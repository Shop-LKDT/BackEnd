package com.project.shopapp.dtos.images;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Size;
import lombok.*;

@AllArgsConstructor
@Getter
@Setter
@NoArgsConstructor
@Builder
public class PostImageDTO {
    @Min(value = 1, message = "post's ID must be > 0")
    private Long postId;

    @Size(min = 5, max = 200, message = "Image's name")
    private String imageUrl;
}
