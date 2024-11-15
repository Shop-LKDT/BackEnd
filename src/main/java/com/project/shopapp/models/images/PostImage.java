package com.project.shopapp.models.images;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.project.shopapp.models.Post;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "product_images")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class PostImage {
    public static final int MAXIMUM_IMAGES_PER_POST = 6;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "post_id")
    @JsonIgnore
    private Post post;

    @Column(name = "image_url", length = 300)
    @JsonProperty("image_url")
    private String imageUrl;
}
