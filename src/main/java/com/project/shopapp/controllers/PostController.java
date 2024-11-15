package com.project.shopapp.controllers;

import com.project.shopapp.dtos.PostDTO;
import com.project.shopapp.dtos.images.PostImageDTO;
import com.project.shopapp.exceptions.DataNotFoundException;
import com.project.shopapp.models.Post;
import com.project.shopapp.models.images.PostImage;
import com.project.shopapp.responses.ResponseObject;
import com.project.shopapp.services.post.IPostService;
import com.project.shopapp.utils.FileUtils;
import com.project.shopapp.utils.MessageKeys;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.UrlResource;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.FieldError;
import org.springframework.web.multipart.MultipartFile;
import com.project.shopapp.components.LocalizationUtils;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@RestController
@RequestMapping("${api.prefix}/posts")
@RequiredArgsConstructor
public class PostController {
    private final IPostService postService;
    private final LocalizationUtils localizationUtils;
    @PostMapping("")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ResponseEntity<ResponseObject> createPost(
            @Valid @RequestBody PostDTO postDTO,
            BindingResult result
    ) throws Exception {
        if (result.hasErrors()) {
            List<String> errorMessages = result.getFieldErrors()
                    .stream()
                    .map(FieldError::getDefaultMessage)
                    .toList();
            return ResponseEntity.badRequest().body(
                    ResponseObject.builder()
                            .message(String.join("; ", errorMessages))
                            .status(HttpStatus.BAD_REQUEST)
                            .build()
            );
        }
        Post newPost = postService.createPost(postDTO);
        return ResponseEntity.ok(
                ResponseObject.builder()
                        .message("Create new post successfully")
                        .status(HttpStatus.CREATED)
                        .data(newPost)
                        .build()
        );
    }

    @GetMapping("")
    public ResponseEntity<ResponseObject> getAllPost(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size
    ) {
        try {
            Page<Post> postsPage = postService.getAllPost(page,size);
            if (postsPage.isEmpty()) {
                return ResponseEntity.ok(ResponseObject.builder()
                        .message("No posts available")
                        .status(HttpStatus.OK)
                        .data(Collections.emptyList())
                        .build());
            }
            return ResponseEntity.ok(ResponseObject.builder()
                    .message("Retrieve posts successfully")
                    .status(HttpStatus.OK)
                    .data(postsPage.getContent())
                    .build());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(
                    ResponseObject.builder()
                            .message("Error occurred while retrieving posts")
                            .status(HttpStatus.INTERNAL_SERVER_ERROR)
                            .build());
        }
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Operation(summary = "Update a post", description = "Update post details by ID",
            security = { @SecurityRequirement(name = "bearer-key") })
    public ResponseEntity<ResponseObject> updatePost(
            @PathVariable long id,
            @Valid @RequestBody PostDTO postDTO) {
        try {
            Post updatedPost = postService.updatePost(id, postDTO);
            return ResponseEntity.ok(ResponseObject.builder()
                    .message("Post updated successfully")
                    .status(HttpStatus.OK)
                    .data(updatedPost)
                    .build());
        } catch (DataNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(ResponseObject.builder()
                            .message(e.getMessage())
                            .status(HttpStatus.NOT_FOUND)
                            .data(null)
                            .build());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(ResponseObject.builder()
                            .message("An error occurred while updating the post")
                            .status(HttpStatus.INTERNAL_SERVER_ERROR)
                            .data(null)
                            .build());
        }
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Operation(security = { @SecurityRequirement(name = "bearer-key") })
    public ResponseEntity<ResponseObject> deletePost(@PathVariable long id) {
        postService.deletePost(id);
        return ResponseEntity.ok(ResponseObject.builder()
                .data(null)
                .message(String.format("Product with id = %d deleted successfully", id))
                .status(HttpStatus.OK)
                .build());
    }

    @PostMapping(value = "uploads/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ResponseEntity<ResponseObject> uploadPostImages(
            @PathVariable("id") Long postId,
            @ModelAttribute("files") List<MultipartFile> files
    ) throws Exception {
        Post existingPost = postService.getPostById(postId);
        files = files == null ? new ArrayList<>() : files;
        if (files.size() > PostImage.MAXIMUM_IMAGES_PER_POST) {
            return ResponseEntity.badRequest().body(
                    ResponseObject.builder()
                            .message(localizationUtils
                                    .getLocalizedMessage(MessageKeys.UPLOAD_IMAGES_MAX_5))
                            .build()
            );
        }
        List<PostImage> postImages = new ArrayList<>();
        for (MultipartFile file : files) {
            if (file.getSize() == 0) {
                continue;
            }
            if (file.getSize() > 10 * 1024 * 1024) {
                return ResponseEntity.status(HttpStatus.PAYLOAD_TOO_LARGE)
                        .body(ResponseObject.builder()
                                .message(localizationUtils
                                        .getLocalizedMessage(MessageKeys.UPLOAD_IMAGES_FILE_LARGE))
                                .status(HttpStatus.PAYLOAD_TOO_LARGE)
                                .build());
            }
            String contentType = file.getContentType();
            if (contentType == null || !contentType.startsWith("image/")) {
                return ResponseEntity.status(HttpStatus.UNSUPPORTED_MEDIA_TYPE)
                        .body(ResponseObject.builder()
                                .message(localizationUtils
                                        .getLocalizedMessage(MessageKeys.UPLOAD_IMAGES_FILE_MUST_BE_IMAGE))
                                .status(HttpStatus.UNSUPPORTED_MEDIA_TYPE)
                                .build());
            }
            String filename = FileUtils.storeFile(file, "uploads/postImages");
            PostImage postImage = postService.createPostImage(
                    existingPost.getId(),
                    PostImageDTO.builder()
                            .imageUrl(filename)
                            .build()
            );
            postImages.add(postImage);
        }
        return ResponseEntity.ok().body(ResponseObject.builder()
                .message("Upload images successfully")
                .status(HttpStatus.CREATED)
                .data(postImages)
                .build());
    }

    @GetMapping("/images/{imageName}")
    public ResponseEntity<?> viewImage(@PathVariable String imageName) {
        try {
            java.nio.file.Path imagePath = Paths.get("uploads/postImages/" + imageName).normalize();
            if (!imagePath.startsWith(Paths.get("uploads/postImages"))) {
                return ResponseEntity.status(HttpStatus.FORBIDDEN)
                        .body("Access denied!");
            }
            UrlResource resource = new UrlResource(imagePath.toUri());
            if (resource.exists()) {
                // Xác định MIME type của ảnh
                String mimeType = Files.probeContentType(imagePath);
                MediaType mediaType = mimeType != null ? MediaType.parseMediaType(mimeType) : MediaType.APPLICATION_OCTET_STREAM;

                return ResponseEntity.ok()
                        .contentType(mediaType)
                        .body(resource);
            } else {
                return ResponseEntity.ok()
                        .contentType(MediaType.IMAGE_JPEG)
                        .body(new UrlResource(Paths.get("uploads/notfound.jpeg").toUri()));
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error retrieving image.");
        }
    }





}
