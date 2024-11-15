package com.project.shopapp.repositories;

import com.project.shopapp.models.images.PostImage;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PostImageRepositorry extends JpaRepository<PostImage, Long> {
    List<PostImage> findByPostId(Long postId);
}
