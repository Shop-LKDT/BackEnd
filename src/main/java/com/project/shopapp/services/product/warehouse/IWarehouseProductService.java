package com.project.shopapp.services.product.warehouse;

import com.project.shopapp.dtos.product.WarehouseProductDTO;
import com.project.shopapp.exceptions.DataNotFoundException;
import com.project.shopapp.models.product.Product;
import com.project.shopapp.models.product.WarehouseProduct;
import com.project.shopapp.responses.product.WareProductResponse;

import java.util.List;

public interface IWarehouseProductService {
    List<WareProductResponse> getAllWarehouseProducts();

    WarehouseProduct getWarehouseProductById(Long id);

    WareProductResponse saveWarehouseProduct(WarehouseProductDTO warehouseProductDTO) throws Exception;

    WareProductResponse updateWarehouseProduct(Long id, Integer quantity);

    void updateQuantityProduct(Long productId) throws DataNotFoundException;

    List<Product> getProductsNotInWarehouse(Long warehouseId) throws DataNotFoundException;
    void updateQuantityProduct(Long productId, int quantity) throws DataNotFoundException;

    void deleteWarehouseProduct(Long id);

    List<Long> getWarehouseProductsByWarehouseId(Long warehouseId) throws DataNotFoundException;
}

