package com.project.shopapp.services.report;

import com.project.shopapp.dtos.ReportDTO;
import com.project.shopapp.models.Report;
import com.project.shopapp.exceptions.DataNotFoundException;
import com.project.shopapp.responses.report.ReportResponse;
import org.springframework.data.domain.Page;

public interface IReportService {
    Page<ReportResponse> getAllReport(int page, int size);
    Report getReportById(Long id) throws DataNotFoundException;
    Report createReport(ReportDTO reportDTO) throws DataNotFoundException;
    ReportResponse updateReport(Long id, ReportDTO updatedReport) throws DataNotFoundException;
    void deleteReport(Long id) throws DataNotFoundException;
}
