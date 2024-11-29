package com.project.shopapp.controllers.product;

import com.project.shopapp.dtos.product.WarehouseProductDTO;
import com.project.shopapp.models.product.Product;
import com.project.shopapp.models.product.WarehouseProduct;
import com.project.shopapp.responses.ResponseObject;
import com.project.shopapp.responses.product.ProductResponse;
import com.project.shopapp.responses.product.WareProductResponse;
import com.project.shopapp.services.product.warehouse.WarehouseProductService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("${api.prefix}/warehouse-products")
@RequiredArgsConstructor
public class WareHouseProductController {

    private final WarehouseProductService warehouseProductService;

    // Lấy tất cả các sản phẩm trong kho
    @GetMapping
    public ResponseEntity<ResponseObject> getAllWarehouseProducts() {
        List<WareProductResponse> warehouseProducts = warehouseProductService.getAllWarehouseProducts();
        return ResponseEntity.ok().body(ResponseObject.builder()
                .message("Get products successfully")
                .status(HttpStatus.OK)
                .data(warehouseProducts)
                .build());
    }

    // Lấy thông tin một sản phẩm trong kho theo ID
    @GetMapping("/{id}")
    public ResponseEntity<ResponseObject> getWarehouseProductById(@PathVariable Long id) {
        WarehouseProduct warehouseProduct = warehouseProductService.getWarehouseProductById(id);
        return ResponseEntity.ok().body(ResponseObject.builder()
                .message("Get product successfully")
                .status(HttpStatus.OK)
                .data(warehouseProduct)
                .build());
    }
    @GetMapping("/products-not-in-warehouse/{warehouseId}")
    public List<ProductResponse> getProductsNotInWarehouse(@PathVariable Long warehouseId) {
        try {
            List<Product> productsNotInWarehouse = warehouseProductService.getProductsNotInWarehouse(warehouseId);
            return productsNotInWarehouse.stream()
                    .map(ProductResponse::fromProduct)
                    .collect(Collectors.toList());
        } catch (Exception e) {
            // Handle exception or return error response
            throw new RuntimeException("Error occurred: " + e.getMessage());
        }
    }

    // Thêm mới một sản phẩm vào kho
    @PostMapping
    public ResponseEntity<ResponseObject> createWarehouseProduct(@Valid @RequestBody WarehouseProductDTO warehouseProductDTO) throws Exception {
        // Chuyển đổi DTO sang entity nếu cần thiết trong service
        WareProductResponse warehouseProduct = warehouseProductService.saveWarehouseProduct(warehouseProductDTO);
        return ResponseEntity.status(HttpStatus.CREATED).body(ResponseObject.builder()
                .message("Product created successfully")
                .status(HttpStatus.CREATED)
                .data(warehouseProduct)
                .build());
    }

    // Cập nhật thông tin sản phẩm trong kho theo ID
    @PutMapping("/{id}")
    public ResponseEntity<ResponseObject> updateWarehouseProduct(@PathVariable Long id,
                                                                 @RequestParam Integer quantity) {
        WareProductResponse updatedWarehouseProduct = warehouseProductService.updateWarehouseProduct(id, quantity);
        return ResponseEntity.ok().body(ResponseObject.builder()
                .message("Product updated successfully")
                .status(HttpStatus.OK)
                .data(updatedWarehouseProduct)
                .build());
    }

    // Cập nhật số lượng sản phẩm trong kho
    @PatchMapping("/{id}/quantity")
    public ResponseEntity<ResponseObject> updateProductQuantity(@PathVariable Long id, @RequestParam int quantity) {
        try {
            warehouseProductService.updateQuantityProduct(id, quantity);
            return ResponseEntity.ok().body(ResponseObject.builder()
                    .message("Product quantity updated successfully")
                    .status(HttpStatus.OK)
                    .data(null)
                    .build());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(ResponseObject.builder()
                    .message("Product not found")
                    .status(HttpStatus.NOT_FOUND)
                    .data(null)
                    .build());
        }
    }

    // Xóa một sản phẩm khỏi kho
    @DeleteMapping("/{id}")
    public ResponseEntity<ResponseObject> deleteWarehouseProduct(@PathVariable Long id) {
        try {
            warehouseProductService.deleteWarehouseProduct(id);
            return ResponseEntity.ok().body(ResponseObject.builder()
                    .message("Product deleted successfully")
                    .status(HttpStatus.OK)
                    .data(null)
                    .build());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(ResponseObject.builder()
                    .message("Product not found")
                    .status(HttpStatus.NOT_FOUND)
                    .data(null)
                    .build());
        }
    }

    // Kiểm tra số lượng tồn kho của một sản phẩm
    @GetMapping("/{productId}/quantity")
    public ResponseEntity<ResponseObject> getAvailableQuantity(@PathVariable Long productId) {
        try {
            int availableQuantity = warehouseProductService.getAvailableQuantity(productId);
            return ResponseEntity.ok().body(ResponseObject.builder()
                    .message("Available quantity fetched successfully")
                    .status(HttpStatus.OK)
                    .data(availableQuantity)
                    .build());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(ResponseObject.builder()
                    .message("Product not found")
                    .status(HttpStatus.NOT_FOUND)
                    .data(0)
                    .build());
        }
    }
}
