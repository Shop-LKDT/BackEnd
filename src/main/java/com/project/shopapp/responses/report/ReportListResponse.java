package com.project.shopapp.responses.report;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@AllArgsConstructor
@Data
@Builder
@NoArgsConstructor
public class ReportListResponse {
    private List<ReportResponse> responseList;
    private int totalPages;
}
