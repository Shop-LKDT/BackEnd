package com.project.shopapp.models;

import com.project.shopapp.models.images.PostImage;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Table(name = "posts")
@Data//toString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Post extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "title")
    private String title;

    @Column(name = "content")
    private String content;

    @Column(name = "thumbnail", length = 300)
    private String thumbnail;

    @OneToMany(mappedBy = "post",
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY)
    private List<PostImage> postImages;
}
