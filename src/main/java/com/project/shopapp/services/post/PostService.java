package com.project.shopapp.services.post;

import com.project.shopapp.dtos.PostDTO;
import com.project.shopapp.dtos.images.PostImageDTO;
import com.project.shopapp.exceptions.DataNotFoundException;
import com.project.shopapp.exceptions.InvalidParamException;
import com.project.shopapp.models.Post;
import com.project.shopapp.models.images.PostImage;
import com.project.shopapp.repositories.PostImageRepositorry;
import com.project.shopapp.repositories.PostRepository;
import com.project.shopapp.responses.post.PostResponse;
import com.project.shopapp.responses.report.ReportResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@RequiredArgsConstructor
@Service
public class PostService implements IPostService {

    private final PostRepository postRepository;
    private final PostImageRepositorry postImageRepository;
    @Override
    public Post createPost(PostDTO postDTO) throws Exception {

        Post newPost = Post.builder()
                .title(postDTO.getTitle())
                .thumbnail(postDTO.getThumbnail())
                .content(postDTO.getContent())
                .build();
        postRepository.save(newPost);
        return newPost;
    }

    @Override
    public Post getPostById(long postId) throws Exception {
        Optional<Post> optionalPost = postRepository.findById(postId);
        if (optionalPost.isPresent()) {
            return optionalPost.get();
        }
        throw new DataNotFoundException("Cannot find post with id = " + postId);
    }

    @Override
    public Page<PostResponse> getAllPost(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);

        return postRepository.findAll(pageable)
                .map(PostResponse::fromPost);
    }

    @Override
    public Post updatePost(long id, PostDTO postDTO) throws Exception {
            Post existingPost = postRepository.findById(id)
                    .orElseThrow(() -> new DataNotFoundException("Cannot find post with id = " + id));
            if (postDTO.getTitle() != null && !postDTO.getTitle().isEmpty()) {
                existingPost.setTitle(postDTO.getTitle());
            }
            if (postDTO.getContent() != null && !postDTO.getContent().isEmpty()) {
                existingPost.setContent(postDTO.getContent());
            }
            if (postDTO.getThumbnail() != null && !postDTO.getThumbnail().isEmpty()) {
                existingPost.setThumbnail(postDTO.getThumbnail());
            }
            return postRepository.save(existingPost);

    }


    @Override
    public void deletePost(long id) {
        Optional<Post> optionalProduct = postRepository.findById(id);
        optionalProduct.ifPresent(postRepository::delete);
    }

    @Override
    @Transactional
    public PostImage createPostImage(Long postId, PostImageDTO postImageDTO) throws Exception {
        Post existingPost = postRepository
                .findById(postId)
                .orElseThrow(() ->
                        new DataNotFoundException(
                                "Cannot find post with id: " + postImageDTO.getPostId()));

        // Create a new PostImage entity
        PostImage newPostImage = PostImage.builder()
                .post(existingPost)
                .imageUrl(postImageDTO.getImageUrl())
                .build();

        // Check if the number of images exceeds the maximum allowed for the post
        int size = postImageRepository.findByPostId(postId).size();
        if (size >= PostImage.MAXIMUM_IMAGES_PER_POST) {
            throw new InvalidParamException(
                    "Number of images must be <= " + PostImage.MAXIMUM_IMAGES_PER_POST);
        }

        // Set the thumbnail if not already set
        if (existingPost.getThumbnail() == null) {
            existingPost.setThumbnail(newPostImage.getImageUrl());
        }

        // Save the post (to persist the thumbnail update) and the new image
        postRepository.save(existingPost);
        return postImageRepository.save(newPostImage);
    }
}
