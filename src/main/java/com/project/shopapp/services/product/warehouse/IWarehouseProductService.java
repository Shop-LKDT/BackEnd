package com.project.shopapp.services.product.warehouse;

import com.project.shopapp.exceptions.DataNotFoundException;
import com.project.shopapp.models.product.WarehouseProduct;
import com.project.shopapp.responses.product.WareProductResponse;

import java.util.List;

public interface IWarehouseProductService {
    List<WareProductResponse> getAllWarehouseProducts();

    WarehouseProduct getWarehouseProductById(Long id);

    WareProductResponse saveWarehouseProduct(WarehouseProduct warehouseProduct);

    WareProductResponse updateWarehouseProduct(Long id, Integer quantity);

    void updateQuantityProduct(Long productId) throws DataNotFoundException;
    void updateQuantityProduct(Long productId, int quantity) throws DataNotFoundException;

    void deleteWarehouseProduct(Long id);
}
