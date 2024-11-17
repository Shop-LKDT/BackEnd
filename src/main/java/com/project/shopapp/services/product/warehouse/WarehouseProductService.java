package com.project.shopapp.services.product.warehouse;

import com.project.shopapp.exceptions.DataNotFoundException;
import com.project.shopapp.models.product.WarehouseProduct;
import com.project.shopapp.repositories.product.WarehouseProductRepository;
import com.project.shopapp.responses.product.WareProductResponse;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class WarehouseProductService implements IWarehouseProductService {
    private final WarehouseProductRepository warehouseProductRepository;
    private final ModelMapper modelMapper;

    @Override
    public List<WareProductResponse> getAllWarehouseProducts() {
        List<WarehouseProduct> warehouseProducts = warehouseProductRepository.findAll();
        // Chuyển đổi list entity sang list DTO bằng ModelMapper
        return warehouseProducts.stream()
                .map(WareProductResponse::fromWareHouseProduct)  // Sử dụng phương thức từProduct để chuyển đổi
                .collect(Collectors.toList());
    }


    @Override
    public WarehouseProduct getWarehouseProductById(Long id) {
        Optional<WarehouseProduct> warehouseProduct = warehouseProductRepository.findById(id);
        if (warehouseProduct.isEmpty()) {
            throw new RuntimeException("Warehouse product not found with id: " + id);
        }
        // Chuyển đổi entity sang DTO
        return warehouseProduct.get();
    }

    @Override
    @Transactional
    public WareProductResponse saveWarehouseProduct(WarehouseProduct warehouseProduct) {
        try {

            return WareProductResponse.fromWareHouseProduct(warehouseProduct);
        } catch (Exception e) {
            throw new RuntimeException("Failed to save warehouse product", e);
        }
    }


    @Override
    @Transactional
    public WareProductResponse updateWarehouseProduct(Long id, Integer quantity) {
        try {
            // Retrieve the product from the repository by ID
            WarehouseProduct warehouseProduct = warehouseProductRepository.findById(id)
                    .orElseThrow(() -> new RuntimeException("Product not found with ID: " + id));

            // Update the product's quantity
            warehouseProduct.setQuantity(quantity);

            // Save the updated product back to the database
            warehouseProductRepository.save(warehouseProduct);

            // Return the updated product as a response
            return WareProductResponse.fromWareHouseProduct(warehouseProduct);
        } catch (Exception e) {
            throw new RuntimeException("Failed to update warehouse product", e);
        }
    }


    @Override
    public void updateQuantityProduct(Long productId) throws DataNotFoundException {

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
