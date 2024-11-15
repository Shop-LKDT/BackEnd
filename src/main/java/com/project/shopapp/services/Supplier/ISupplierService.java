package com.project.shopapp.services.Supplier;

import com.project.shopapp.dtos.SupplierDTO;
import com.project.shopapp.models.Supplier;

import java.util.List;
import java.util.Optional;

public interface ISupplierService {
    Supplier createSupplier(SupplierDTO supplier);
    Supplier updateSupplier(Long id, SupplierDTO supplier);
    void deleteSupplier(Long id);
    List<Supplier> getAllSuppliers();
    Optional<Supplier> getSupplierById(Long id);
}
