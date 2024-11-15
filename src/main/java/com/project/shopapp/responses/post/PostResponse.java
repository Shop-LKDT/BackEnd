package com.project.shopapp.responses.post;

import com.project.shopapp.models.Post;
import com.project.shopapp.models.images.PostImage;
import com.project.shopapp.responses.BaseResponse;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PostResponse extends BaseResponse {
    private Long id;
    private String title;
    private String content;
    private String thumbnail;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private List<PostImage> postImages;
    public static PostResponse fromPost(Post post) {
        PostResponse response = new PostResponse();
        response.setId(post.getId());
        response.setTitle(post.getTitle());
        response.setContent(post.getContent());
        response.setThumbnail(post.getThumbnail());
        response.setCreatedAt(post.getCreatedAt());
        response.setUpdatedAt(post.getUpdatedAt());
        response.setPostImages(post.getPostImages()); // Nếu cần, có thể map chi tiết các trường từ PostImage
        // map other fields if necessary
        return response;
    }
}
