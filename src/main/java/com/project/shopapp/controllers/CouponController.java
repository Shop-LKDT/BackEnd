package com.project.shopapp.controllers;

import com.project.shopapp.models.Coupon;
import com.project.shopapp.responses.ResponseObject;
import com.project.shopapp.responses.coupon.CouponCalculationResponse;
import com.project.shopapp.services.coupon.CouponService;
import com.project.shopapp.services.coupon.ICouponService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("${api.prefix}/coupons")
//@Validated
//Dependency Injection
@RequiredArgsConstructor
public class CouponController {
    @Autowired
    private ICouponService couponService;
    @GetMapping("/calculate")
    public ResponseEntity<ResponseObject> calculateCouponValue(
            @RequestParam("couponCode") String couponCode,
            @RequestParam("totalAmount") double totalAmount) {
        double finalAmount = couponService.calculateCouponValue(couponCode, totalAmount);
        CouponCalculationResponse couponCalculationResponse = CouponCalculationResponse.builder()
                .result(finalAmount)
                .build();
        return ResponseEntity.ok(new ResponseObject(
                "Calculate coupon successfully",
                HttpStatus.OK,
                couponCalculationResponse
        ));
    }
    @PostMapping
    public ResponseEntity<Coupon> createCoupon(@RequestBody Coupon coupon) {
        Coupon createdCoupon = couponService.createCoupon(coupon);
        return ResponseEntity.ok(createdCoupon);
    }

    /**
     * Lấy danh sách tất cả các Coupon
     * @return Danh sách các Coupon
     */
    @GetMapping
    public ResponseEntity<List<Coupon>> getAllCoupons() {
        List<Coupon> coupons = couponService.getAllCoupons();
        return ResponseEntity.ok(coupons);
    }

    /**
     * Lấy thông tin chi tiết của Coupon dựa trên ID
     * @param id ID của Coupon
     * @return Coupon nếu tìm thấy, hoặc 404 nếu không tồn tại
     */
    @GetMapping("/{id}")
    public ResponseEntity<Coupon> getCouponById(@PathVariable Long id) {
        Optional<Coupon> coupon = couponService.getCouponById(id);
        return coupon.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    /**
     * Lấy thông tin của Coupon dựa trên mã code
     * @param code Mã Coupon
     * @return Coupon nếu tìm thấy, hoặc 404 nếu không tồn tại
     */
    @GetMapping("/code/{code}")
    public ResponseEntity<Coupon> getCouponByCode(@PathVariable String code) {
        Optional<Coupon> coupon = couponService.getCouponByCode(code);
        return coupon.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    /**
     * Cập nhật thông tin của Coupon dựa trên ID
     * @param id ID của Coupon
     * @param couponDetails Thông tin chi tiết cần cập nhật
     * @return Coupon đã được cập nhật
     */
    @PutMapping("/{id}")
    public ResponseEntity<Coupon> updateCoupon(@PathVariable Long id, @RequestBody Coupon couponDetails) {
        Coupon updatedCoupon = couponService.updateCoupon(id, couponDetails);
        return ResponseEntity.ok(updatedCoupon);
    }

    /**
     * Xóa Coupon dựa trên ID
     * @param id ID của Coupon
     * @return Không có nội dung trả về nếu xóa thành công
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Boolean> deleteCoupon(@PathVariable Long id) {
        Optional<Coupon> coupon = couponService.getCouponById(id);
        if (coupon.isPresent()) {
            couponService.deleteCoupon(id);
            return ResponseEntity.ok(true);
        } else {
            return ResponseEntity.ok(false);
        }
    }

    /**
     * Tính toán giá trị giảm giá dựa trên mã Coupon và tổng giá trị đơn hàng
     * @param couponCode Mã Coupon
     * @param totalAmount Tổng giá trị đơn hàng
     * @return Giá trị giảm giá (double)
     */
    @GetMapping("/calculate-discount")
    public ResponseEntity<Double> calculateDiscount(
            @RequestParam String couponCode,
            @RequestParam double totalAmount) {
        double discountValue = couponService.calculateCouponValue(couponCode, totalAmount);
        return ResponseEntity.ok(discountValue);
    }

}
