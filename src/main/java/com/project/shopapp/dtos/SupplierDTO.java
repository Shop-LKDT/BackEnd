package com.project.shopapp.dtos;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SupplierDTO {
    private String name;
    private String phone;
    private String email;
    private String address;
}
