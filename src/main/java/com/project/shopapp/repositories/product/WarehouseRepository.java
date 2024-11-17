package com.project.shopapp.repositories.product;


import com.project.shopapp.models.product.WareHouse;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WarehouseRepository extends JpaRepository<WareHouse, Long> {
}
