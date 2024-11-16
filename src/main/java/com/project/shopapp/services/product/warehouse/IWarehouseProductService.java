package com.project.shopapp.services.product.warehouse;

import com.project.shopapp.exceptions.DataNotFoundException;
import com.project.shopapp.models.product.WarehouseProduct;

import java.util.List;

public interface IWarehouseProductService {
    List<WarehouseProduct> getAllWarehouseProducts();

    WarehouseProduct getWarehouseProductById(Long id);

    WarehouseProduct saveWarehouseProduct(WarehouseProduct warehouseProduct);

    WarehouseProduct updateWarehouseProduct(Long id, WarehouseProduct warehouseProduct);

    void updateQuantityProduct(Long productId) throws DataNotFoundException;
    void updateQuantityProduct(Long productId, int quantity) throws DataNotFoundException;

    void deleteWarehouseProduct(Long id);
}
