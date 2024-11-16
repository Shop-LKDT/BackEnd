package com.project.shopapp.services.product.warehouse;

import com.project.shopapp.exceptions.DataNotFoundException;
import com.project.shopapp.models.product.WarehouseProduct;
import com.project.shopapp.repositories.product.WarehouseProductRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
@RequiredArgsConstructor
public class WarehouseProductService implements IWarehouseProductService {
    private final WarehouseProductRepository warehouseProductRepository;

    @Override
    public List<WarehouseProduct> getAllWarehouseProducts() {
        return warehouseProductRepository.findAll();
    }

    @Override
    public WarehouseProduct getWarehouseProductById(Long id) {
        Optional<WarehouseProduct> warehouseProduct = warehouseProductRepository.findById(id);
        if (warehouseProduct.isEmpty()) {
            throw new RuntimeException("Warehouse product not found with id: " + id);
        }
        return warehouseProduct.get();
    }

    @Override
    @Transactional
    public WarehouseProduct saveWarehouseProduct(WarehouseProduct warehouseProduct) {
        try {
            return warehouseProductRepository.save(warehouseProduct);
        } catch (Exception e) {
            throw new RuntimeException("Failed to save warehouse product", e);
        }
    }

    @Override
    @Transactional
    public WarehouseProduct updateWarehouseProduct(Long id, WarehouseProduct warehouseProduct) {
        WarehouseProduct existingProduct = getWarehouseProductById(id);

        existingProduct.setWarehouse(warehouseProduct.getWarehouse());
        existingProduct.setProduct(warehouseProduct.getProduct());
        existingProduct.setQuantity(warehouseProduct.getQuantity());

        try {
            return warehouseProductRepository.save(existingProduct);
        } catch (Exception e) {
            throw new RuntimeException("Failed to update warehouse product", e);
        }
    }

    @Override
    public void updateQuantityProduct(Long productId) throws DataNotFoundException {
        List<WarehouseProduct> warehouseProducts = warehouseProductRepository
                .findByProductIdAndQuantityGreaterThanOrderByQuantityDesc(productId);

        if (warehouseProducts.isEmpty()) {
            throw new DataNotFoundException("No available product in any warehouse");
        }

        // Lấy warehouse product có số lượng nhiều nhất
        WarehouseProduct warehouseProduct = warehouseProducts.get(0);

        // Giảm số lượng đi 1
        int currentQuantity = warehouseProduct.getQuantity();
        if (currentQuantity <= 0) {
            throw new DataNotFoundException("Product is out of stock in all warehouses");
        }

        warehouseProduct.setQuantity(currentQuantity - 1);

        try {
            warehouseProductRepository.save(warehouseProduct);
        } catch (Exception e) {
            throw new RuntimeException("Failed to update product quantity", e);
        }

    }

    @Transactional
    public void updateQuantityProduct(Long productId, int quantity) throws DataNotFoundException {
        List<WarehouseProduct> warehouseProducts = warehouseProductRepository
                .findByProductIdAndQuantityGreaterThanOrderByQuantityDesc(productId);

        if (warehouseProducts.isEmpty()) {
            throw new DataNotFoundException("No available product in any warehouse");
        }

        WarehouseProduct warehouseProduct = warehouseProducts.get(0);

        int currentQuantity = warehouseProduct.getQuantity();
        if (currentQuantity < quantity) {
            throw new DataNotFoundException(
                    String.format("Insufficient stock. Required: %d, Available: %d",
                            quantity, currentQuantity)
            );
        }

        warehouseProduct.setQuantity(currentQuantity - quantity);

        try {
            warehouseProductRepository.save(warehouseProduct);
        } catch (Exception e) {
            throw new RuntimeException("Failed to update product quantity", e);
        }
    }

    // Thêm method để check số lượng tồn kho
    public int getAvailableQuantity(Long productId) throws DataNotFoundException {
        List<WarehouseProduct> warehouseProducts = warehouseProductRepository
                .findByProductIdAndQuantityGreaterThanOrderByQuantityDesc(productId);

        if (warehouseProducts.isEmpty()) {
            return 0;
        }

        return warehouseProducts.stream()
                .mapToInt(WarehouseProduct::getQuantity)
                .sum();
    }

    @Override
    @Transactional
    public void deleteWarehouseProduct(Long id) {
        WarehouseProduct warehouseProduct = getWarehouseProductById(id);
        try {
            warehouseProductRepository.delete(warehouseProduct);
        } catch (Exception e) {
            throw new RuntimeException("Failed to delete warehouse product", e);
        }
    }
}
