package com.project.shopapp.dtos;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReportDTO {

    private Long userId;

    private String reportContent;

    private String responseFromManagement;

    private String status;


}
