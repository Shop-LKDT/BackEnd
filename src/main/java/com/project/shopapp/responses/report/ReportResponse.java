package com.project.shopapp.responses.report;

import com.project.shopapp.models.Report;
import com.project.shopapp.responses.BaseResponse;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReportResponse extends BaseResponse {
    private Long id;

    private Long userId;

    private String reportContent;

    private String responseFromManagement;

    private String status;
    public static ReportResponse fromReport(Report report) {
        ReportResponse response = new ReportResponse();
        response.setUserId(report.getUser().getId());
        response.setReportContent(report.getReportContent());
        response.setResponseFromManagement(report.getResponseFromManagement());
        response.setUpdatedAt(report.getCreatedAt());
        response.setCreatedAt(report.getCreatedAt());
        response.setId(report.getId());
        response.setStatus(report.getStatus());
        // map other fields from Report to ReportResponse
        return response;
    }
}
