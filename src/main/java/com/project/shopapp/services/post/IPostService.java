package com.project.shopapp.services.post;

import com.project.shopapp.dtos.post.PostDTO;
import com.project.shopapp.dtos.ProductDTO;
import com.project.shopapp.dtos.images.PostImageDTO;
import com.project.shopapp.models.Post;
import com.project.shopapp.models.images.PostImage;
import org.springframework.data.domain.Page;

public interface IPostService {
    Post createPost(PostDTO postDTO) throws Exception;
    Post getPostById(long id) throws Exception;
    Page<Post> getAllPost(int page, int size);
    Post updatePost(long id, PostDTO postDTO) throws Exception;
    void deletePost(long id);
    PostImage createPostImage(
            Long postId,
            PostImageDTO postImageDTO) throws Exception;

}
