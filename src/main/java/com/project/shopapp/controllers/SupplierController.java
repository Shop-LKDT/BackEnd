package com.project.shopapp.controllers;

import com.project.shopapp.dtos.SupplierDTO;
import com.project.shopapp.models.Supplier;
import com.project.shopapp.responses.ResponseObject;
import com.project.shopapp.services.Supplier.ISupplierService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("${api.prefix}/suppliers")
@RequiredArgsConstructor
public class SupplierController {
    @Autowired
    ISupplierService supplierService;

    // 1. Tạo mới một nhà cung cấp
    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<ResponseObject> createSupplier(@RequestBody SupplierDTO supplierDTO) {
        Supplier savedSupplier = supplierService.createSupplier(supplierDTO);
        return ResponseEntity.status(HttpStatus.CREATED).body(
                new ResponseObject("Supplier created successfully", HttpStatus.CREATED, savedSupplier)
        );
    }

    // 2. Lấy danh sách tất cả các nhà cung cấp
    @GetMapping
    public ResponseEntity<ResponseObject> getAllSuppliers() {
        List<Supplier> suppliers = supplierService.getAllSuppliers();
        return ResponseEntity.ok(new ResponseObject("List of suppliers", HttpStatus.OK, suppliers));
    }

    // 3. Tìm nhà cung cấp theo ID
    @GetMapping("/{id}")
    public ResponseEntity<ResponseObject> getSupplierById(@PathVariable Long id) {
        return supplierService.getSupplierById(id)
                .map(supplier -> ResponseEntity.ok(new ResponseObject("Supplier found", HttpStatus.OK, supplier)))
                .orElse(ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ResponseObject("Supplier not found", HttpStatus.NOT_FOUND, null)));
    }

    // 4. Cập nhật thông tin nhà cung cấp
    @PutMapping("/{id}")
    public ResponseEntity<ResponseObject> updateSupplier(@PathVariable Long id, @RequestBody SupplierDTO supplier) {
        try {
            Supplier updatedSupplier = supplierService.updateSupplier(id, supplier);
            return ResponseEntity.ok(new ResponseObject("Supplier updated successfully", HttpStatus.OK, updatedSupplier));
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ResponseObject(e.getMessage(), HttpStatus.NOT_FOUND, null));
        }
    }

    // 5. Xóa nhà cung cấp
    @DeleteMapping("/{id}")
    public ResponseEntity<ResponseObject> deleteSupplier(@PathVariable Long id) {
        try {
            supplierService.deleteSupplier(id);
            return ResponseEntity.ok(new ResponseObject("Supplier deleted successfully", HttpStatus.OK, null));
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ResponseObject(e.getMessage(), HttpStatus.NOT_FOUND, null));
        }
    }
}
