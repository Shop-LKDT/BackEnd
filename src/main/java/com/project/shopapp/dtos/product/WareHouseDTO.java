package com.project.shopapp.dtos.product;

import jakarta.persistence.Column;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class WareHouseDTO {
    private String name;
    private String location;
}
