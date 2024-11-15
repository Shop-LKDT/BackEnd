package com.project.shopapp.services.post.image;

import com.project.shopapp.models.images.PostImage;

public interface IPostImageService {
    PostImage deletePostImage(Long id) throws Exception;
}
