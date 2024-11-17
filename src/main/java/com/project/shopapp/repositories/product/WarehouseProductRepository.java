package com.project.shopapp.repositories.product;

import com.project.shopapp.models.product.WarehouseProduct;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface WarehouseProductRepository extends JpaRepository<WarehouseProduct, Long> {
    @Query("SELECT wp FROM WarehouseProduct wp " +
            "WHERE wp.product.id = :productId " +
            "AND wp.quantity > 0 " +
            "ORDER BY wp.quantity DESC")
    List<WarehouseProduct> findByProductIdAndQuantityGreaterThanOrderByQuantityDesc(
            @Param("productId") Long productId
    );
}