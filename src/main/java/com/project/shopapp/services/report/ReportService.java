package com.project.shopapp.services.report;


import com.project.shopapp.dtos.ReportDTO;
import com.project.shopapp.models.Report;
import com.project.shopapp.models.User;
import com.project.shopapp.repositories.ReportRepository;
import com.project.shopapp.repositories.UserRepository;
import com.project.shopapp.exceptions.DataNotFoundException;
import com.project.shopapp.responses.report.ReportResponse;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class ReportService implements IReportService {

    private final ReportRepository reportRepository;
    private final UserRepository userRepository;
    private final ModelMapper modelMapper;

    @Override
    public Page<ReportResponse> getAllReport(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return reportRepository.findAll(pageable).map(ReportResponse::fromReport);
    }


    @Override
    public Report getReportById(Long id) throws DataNotFoundException {
        return reportRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("Report not found with id = " + id));
    }

    @Override
    public Report createReport(ReportDTO reportDTO) throws DataNotFoundException {
        User user = userRepository.findById(reportDTO.getUserId())
                .orElseThrow(() -> new DataNotFoundException("User not found with id = " + reportDTO.getUserId()));
        Report newReport = Report.builder()
                .reportContent(reportDTO.getReportContent())
                .responseFromManagement(reportDTO.getResponseFromManagement())
                .user(user).build();

        return reportRepository.save(newReport);
    }

    @Override
    public ReportResponse updateReport(Long id, ReportDTO updatedReport) throws DataNotFoundException {
        Report existingReport = reportRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("Report not found with id = " + id));;

        if (updatedReport.getReportContent() != null) {
            existingReport.setReportContent(updatedReport.getReportContent());
        }

        if (updatedReport.getResponseFromManagement() != null) {
            existingReport.setResponseFromManagement(updatedReport.getResponseFromManagement());
        }

        // Chỉ cập nhật người dùng nếu `updatedReport` có người dùng mới
        if (updatedReport.getUserId() != null) {
            User user = userRepository.findById(updatedReport.getUserId())
                    .orElseThrow(() -> new DataNotFoundException("User not found with id = " + updatedReport.getUserId()));
            existingReport.setUser(user);
        }
        existingReport.setUpdatedAt(LocalDateTime.now());
        reportRepository.save(existingReport);

        ReportResponse reportResponse = new ReportResponse();
        modelMapper.map(existingReport,reportResponse);

        return reportResponse;
    }

    @Override
    public void deleteReport(Long id) throws DataNotFoundException {
        Report report = reportRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("Report not found with id = " + id));
        reportRepository.delete(report);
    }
}
