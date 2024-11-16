package com.project.shopapp.controllers.product;

import com.project.shopapp.dtos.product.WareHouseDTO;
import com.project.shopapp.models.product.WareHouse;
import com.project.shopapp.responses.ResponseObject;
import com.project.shopapp.services.product.warehouse.IWareHouseService;
import com.project.shopapp.services.product.warehouse.WareHouseService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("${api.prefix}/warehouses")
@RequiredArgsConstructor
public class WareHoseController {
    private final WareHouseService warehouseService;
    @PostMapping("")
    public ResponseEntity<ResponseObject> createWarehouse(
            @Valid @RequestBody WareHouseDTO wareHouseDTO ,
            BindingResult result) {
        WareHouse wareHouse= warehouseService.saveWarehouse(wareHouseDTO);
        return ResponseEntity.ok().body(ResponseObject.builder()
                .data(wareHouse)
                .status(HttpStatus.OK)
                .message("ok").build());
    }
}
