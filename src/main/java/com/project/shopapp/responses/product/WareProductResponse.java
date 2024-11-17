package com.project.shopapp.responses.product;

import com.project.shopapp.models.Comment;
import com.project.shopapp.models.Favorite;
import com.project.shopapp.models.product.Product;
import com.project.shopapp.models.product.WareHouse;
import com.project.shopapp.models.product.WarehouseProduct;
import com.project.shopapp.responses.BaseResponse;
import com.project.shopapp.responses.comment.CommentResponse;
import com.project.shopapp.responses.favorite.FavoriteResponse;
import jakarta.persistence.*;
import lombok.*;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class WareProductResponse extends BaseResponse {

    private Long id;

    private String warehouse;
    private Long productId;

    private String productName;

    private Integer quantity;

    public static WareProductResponse fromWareHouseProduct(WarehouseProduct warehouseProduct) {
        WareProductResponse wareProductResponse = WareProductResponse.builder()
                .id(warehouseProduct.getId())
                .warehouse(warehouseProduct.getWarehouse().getName())
                .productId(warehouseProduct.getId())
                .productName(warehouseProduct.getProduct().getName())
                .quantity(warehouseProduct.getQuantity())
                .build();
        wareProductResponse.setCreatedAt(warehouseProduct.getCreatedAt());
        wareProductResponse.setUpdatedAt(warehouseProduct.getUpdatedAt());
        return wareProductResponse;
    }
}
