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
    private Long userId;

    private String reportContent;

    private String responseFromManagement;
    public static ReportResponse fromReport(Report report) {
        ReportResponse response = new ReportResponse();
        response.setUserId(report.getUser().getId());
        response.setReportContent(report.getReportContent());
        response.setResponseFromManagement(report.getResponseFromManagement());
        response.setUpdatedAt(report.getCreatedAt());
        response.setCreatedAt(report.getCreatedAt());
        // map other fields from Report to ReportResponse
        return response;
    }
}
