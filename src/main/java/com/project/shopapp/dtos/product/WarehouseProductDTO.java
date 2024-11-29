package com.project.shopapp.dtos.product;

import com.project.shopapp.models.product.Product;
import com.project.shopapp.models.product.WareHouse;
import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class WarehouseProductDTO {

    private Long warehouseId;
    private Long productId;
    private Integer quantity;
}
