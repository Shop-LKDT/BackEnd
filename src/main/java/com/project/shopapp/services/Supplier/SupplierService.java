package com.project.shopapp.services.Supplier;

import com.project.shopapp.dtos.SupplierDTO;
import com.project.shopapp.models.Supplier;
import com.project.shopapp.repositories.SupplierRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SupplierService implements ISupplierService{
    @Autowired
    SupplierRepository supplierRepository;



    @Override
    public Supplier createSupplier(SupplierDTO supplierDTO) {
        // Chuyển đổi từ SupplierDTO sang Supplier
        Supplier supplier = Supplier.builder()
                .name(supplierDTO.getName())
                .phone(supplierDTO.getPhone())
                .email(supplierDTO.getEmail())
                .address(supplierDTO.getAddress())
                .build();

        return supplierRepository.save(supplier);
    }

    @Override
    public Supplier updateSupplier(Long id, SupplierDTO updatedSupplier) {
        return supplierRepository.findById(id)
                .map(supplier -> {
                    supplier.setName(updatedSupplier.getName());
                    supplier.setPhone(updatedSupplier.getPhone());
                    supplier.setEmail(updatedSupplier.getEmail());
                    supplier.setAddress(updatedSupplier.getAddress());
                    return supplierRepository.save(supplier);
                }).orElseThrow(() -> new RuntimeException("Supplier not found"));
    }

    @Override
    public void deleteSupplier(Long id) {
        if (!supplierRepository.existsById(id)) {
            throw new RuntimeException("Supplier not found");
        }
        supplierRepository.deleteById(id);
    }

    @Override
    public List<Supplier> getAllSuppliers() {
        return supplierRepository.findAll();
    }

    @Override
    public Optional<Supplier> getSupplierById(Long id) {
        return supplierRepository.findById(id);
    }
}
