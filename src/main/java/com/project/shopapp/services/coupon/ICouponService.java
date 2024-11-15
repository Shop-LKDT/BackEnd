package com.project.shopapp.services.coupon;

import com.project.shopapp.models.Coupon;

import java.util.List;
import java.util.Optional;

public interface ICouponService {
    double calculateCouponValue(String couponCode, double totalAmount);

    Coupon createCoupon(Coupon coupon);

    List<Coupon> getAllCoupons();

    Optional<Coupon> getCouponById(Long id);

    Optional<Coupon> getCouponByCode(String code);

    Coupon updateCoupon(Long id, Coupon couponDetails);

    void deleteCoupon(Long id);
}
