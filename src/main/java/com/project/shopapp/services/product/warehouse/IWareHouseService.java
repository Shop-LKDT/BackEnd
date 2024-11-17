package com.project.shopapp.services.product.warehouse;

import com.project.shopapp.dtos.product.WareHouseDTO;
import com.project.shopapp.models.product.WareHouse;

import java.util.List;

public interface IWareHouseService {
    List<WareHouse> getAllWarehouses();

    WareHouse getWarehouseById(Long id);

    WareHouse saveWarehouse(WareHouseDTO wareHouseDTO);

    WareHouse updateWarehouse(Long id, WareHouse warehouse);

    void deleteWarehouse(Long id);
}
