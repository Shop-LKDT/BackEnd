package com.project.shopapp.controllers;


import com.project.shopapp.dtos.ReportDTO;
import com.project.shopapp.models.Product;
import com.project.shopapp.models.Report;
import com.project.shopapp.responses.ResponseObject;
import com.project.shopapp.responses.product.ProductResponse;
import com.project.shopapp.responses.report.ReportResponse;
import com.project.shopapp.services.report.ReportService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;

@RestController
@RequestMapping("${api.prefix}/reports")
@RequiredArgsConstructor
public class ReportController {

    private final ReportService reportService;

    @PostMapping("")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ResponseEntity<ResponseObject> createReport(
            @RequestBody ReportDTO reportDTO) {
        try {
            Report newReport = reportService.createReport(reportDTO);
            return ResponseEntity.status(HttpStatus.CREATED)
                    .body(new ResponseObject("Create report successfully", HttpStatus.CREATED, newReport));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new ResponseObject(e.getMessage(), HttpStatus.BAD_REQUEST, null));
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<ResponseObject> getReportById(@PathVariable("id") Long reportId) throws Exception {
        Report existingProduct = reportService.getReportById(reportId);
        return ResponseEntity.ok(ResponseObject.builder()
                .data(ReportResponse.fromReport(existingProduct))
                .message("Get detail product successfully")
                .status(HttpStatus.OK)
                .build());



    }


    @GetMapping
    public ResponseEntity<ResponseObject> getAllReports(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size
    ) {
        try {
            Page<ReportResponse> reportsPage = reportService.getAllReport(page, size);
            if (reportsPage.isEmpty()) {
                return ResponseEntity.ok(ResponseObject.builder()
                        .message("No posts available")
                        .status(HttpStatus.OK)
                        .data(Collections.emptyList())
                        .build());
            }
            return ResponseEntity.ok(ResponseObject.builder()
                    .message("Retrieve posts successfully")
                    .status(HttpStatus.OK)
                    .data(reportsPage.getContent())
                    .build());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(
                    ResponseObject.builder()
                            .message("Error occurred while retrieving posts")
                            .status(HttpStatus.INTERNAL_SERVER_ERROR)
                            .build());
        }
    }


    @PutMapping("/{id}")
    public ResponseEntity<ResponseObject> updateReport(
            @PathVariable Long id,
            @RequestBody ReportDTO updatedReport) {
        try {
            ReportResponse report = reportService.updateReport(id, updatedReport);
            return ResponseEntity.ok(new ResponseObject("Update report successfully", HttpStatus.OK, report));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(new ResponseObject(e.getMessage(), HttpStatus.NOT_FOUND, null));
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ResponseObject> deleteReport(@PathVariable Long id) {
        try {
            reportService.deleteReport(id);
            return ResponseEntity.ok(new ResponseObject("Delete report successfully", HttpStatus.OK, null));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(new ResponseObject(e.getMessage(), HttpStatus.NOT_FOUND, null));
        }
    }
}
