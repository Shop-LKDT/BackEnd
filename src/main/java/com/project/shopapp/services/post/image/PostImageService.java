package com.project.shopapp.services.post.image;

import com.project.shopapp.exceptions.DataNotFoundException;
import com.project.shopapp.models.images.PostImage;
import com.project.shopapp.models.images.ProductImage;
import com.project.shopapp.repositories.PostImageRepositorry;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;
@Service
@RequiredArgsConstructor
public class PostImageService implements IPostImageService {
    private final PostImageRepositorry postImageRepositorry;
    @Override
    @Transactional
    public PostImage deletePostImage(Long id) throws Exception {
            Optional<PostImage> postImage = postImageRepositorry.findById(id);
            if(postImage.isEmpty()) {
                throw new DataNotFoundException(
                        String.format("Cannot find post image with id: %ld", id)
                );
            }
            postImageRepositorry.deleteById(id);
            return postImage.get();
    }
}
