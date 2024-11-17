package com.project.shopapp.services.product.warehouse;

import com.project.shopapp.dtos.product.WareHouseDTO;
import com.project.shopapp.models.product.WareHouse;
import com.project.shopapp.repositories.product.WarehouseRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
@RequiredArgsConstructor
public class WareHouseService implements IWareHouseService {
    private final WarehouseRepository warehouseRepository;

    @Override
    public List<WareHouse> getAllWarehouses() {
        return warehouseRepository.findAll();
    }

    @Override
    public WareHouse getWarehouseById(Long id) {
        Optional<WareHouse> warehouse = warehouseRepository.findById(id);
        if (warehouse.isEmpty()) {
            throw new RuntimeException("Warehouse not found with id: " + id);
        }
        return warehouse.get();
    }

    @Override
    public WareHouse saveWarehouse(WareHouseDTO wareHouseDTO) {
        try {
            WareHouse newWareHouse = WareHouse.builder()
                    .name(wareHouseDTO.getName())
                    .location(wareHouseDTO.getLocation())
                    .build();
            return warehouseRepository.save(newWareHouse);
        } catch (Exception e) {
            throw new RuntimeException("Failed to save warehouse", e);
        }
    }

    @Override
    @Transactional
    public WareHouse updateWarehouse(Long id, WareHouse warehouse) {
        WareHouse existingWarehouse = getWarehouseById(id);
        existingWarehouse.setName(warehouse.getName());
        existingWarehouse.setLocation(warehouse.getLocation());

        try {
            return warehouseRepository.save(existingWarehouse);
        } catch (Exception e) {
            throw new RuntimeException("Failed to update warehouse", e);
        }
    }

    @Override
    @Transactional
    public void deleteWarehouse(Long id) {
        WareHouse warehouse = getWarehouseById(id);
        try {
            warehouseRepository.delete(warehouse);
        } catch (Exception e) {
            throw new RuntimeException("Failed to delete warehouse", e);
        }
    }
}
