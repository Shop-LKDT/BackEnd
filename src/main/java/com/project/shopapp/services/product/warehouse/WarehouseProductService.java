package com.project.shopapp.services.product.warehouse;

import com.project.shopapp.dtos.product.WarehouseProductDTO;
import com.project.shopapp.exceptions.DataNotFoundException;
import com.project.shopapp.models.product.Product;
import com.project.shopapp.models.product.WarehouseProduct;
import com.project.shopapp.repositories.product.ProductRepository;
import com.project.shopapp.repositories.product.WarehouseProductRepository;
import com.project.shopapp.responses.product.WareProductResponse;
import com.project.shopapp.services.product.ProductService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;


@Service
@RequiredArgsConstructor
public class WarehouseProductService implements IWarehouseProductService {
    @Autowired
    WarehouseProductRepository warehouseProductRepository;
    private final WareHouseService wareHouseService;
    @Autowired
    @Lazy
    ProductService productService;
    private final ProductRepository productRepository;

    public List<Product> getProductsNotInWarehouse(Long warehouseId) throws DataNotFoundException {
        // Kiểm tra xem kho có tồn tại không
        List<WarehouseProduct> warehouseProducts = warehouseProductRepository.findByWarehouseId(warehouseId);
        if (warehouseProducts == null || warehouseProducts.isEmpty()) {
            throw new DataNotFoundException("No products found in warehouse with ID: " + warehouseId);
        }

        // Lấy tất cả sản phẩm trong hệ thống
        List<Product> allProducts = productRepository.findAll();

        // Lọc các sản phẩm chưa có trong kho (không có trong danh sách warehouseProducts)
        List<Long> warehouseProductIds = warehouseProducts.stream()
                .map(warehouseProduct -> warehouseProduct.getProduct().getId())
                .collect(Collectors.toList());

        List<Product> productsNotInWarehouse = allProducts.stream()
                .filter(product -> !warehouseProductIds.contains(product.getId()))
                .collect(Collectors.toList());

        return productsNotInWarehouse;
    }

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
    public WareProductResponse saveWarehouseProduct(WarehouseProductDTO warehouseProductDTO) throws Exception {
        WarehouseProduct warehouseProduct = WarehouseProduct.builder()
                .warehouse(wareHouseService.getWarehouseById(warehouseProductDTO.getWarehouseId()))
                .product(productService.getProductById(warehouseProductDTO.getProductId()))
                .quantity(warehouseProductDTO.getQuantity()).build();
        warehouseProductRepository.save(warehouseProduct);
        return WareProductResponse.fromWareHouseProduct(warehouseProduct);
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

    @Override
    public List<Long> getWarehouseProductsByWarehouseId(Long warehouseId) throws DataNotFoundException {
        List<WarehouseProduct> warehouseProducts = warehouseProductRepository.findByWarehouseId(warehouseId);

        if (warehouseProducts.isEmpty()) {
            throw new DataNotFoundException("No products found in warehouse with id: " + warehouseId);
        }

        // Trả về danh sách các ID sản phẩm
        return warehouseProducts.stream()
                .map(WarehouseProduct::getProductId)  // Giả sử có phương thức getProductId trong WarehouseProduct
                .collect(Collectors.toList());
    }
}
