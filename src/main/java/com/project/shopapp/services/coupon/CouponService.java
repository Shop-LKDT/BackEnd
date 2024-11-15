package com.project.shopapp.services.coupon;

import com.project.shopapp.models.Coupon;
import com.project.shopapp.models.CouponCondition;
import com.project.shopapp.repositories.CouponConditionRepository;
import com.project.shopapp.repositories.CouponRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.time.LocalDate;
import java.util.Optional;


@RequiredArgsConstructor
@Service
public class CouponService implements ICouponService{
    private final CouponRepository couponRepository;
    private final CouponConditionRepository couponConditionRepository;
    @Override
    public double calculateCouponValue(String couponCode, double totalAmount) {
        Optional<Coupon> couponOpt = couponRepository.findByCode(couponCode);
        if (couponOpt.isPresent()) {
            Coupon coupon = couponOpt.get();
            System.out.println("Coupon found: " + couponCode);
            if (!coupon.isActive()) {
                System.out.println("Coupon is not active");
                throw new IllegalArgumentException("Coupon is not active");
            }
            double discountAmount = calculateDiscount(coupon, totalAmount);
            System.out.println("Discount calculated: " + discountAmount);
            double finalAmount = totalAmount - discountAmount;
            System.out.println("Final amount after discount: " + finalAmount);
            return finalAmount;
        }
        System.out.println("Coupon not found or invalid");
        return totalAmount;
    }

    private double calculateDiscount(Coupon coupon, double totalAmount) {
        List<CouponCondition> conditions = couponConditionRepository
                .findByCouponId(coupon.getId());
        double discount = 0.0;
        double updatedTotalAmount = totalAmount;
        for (CouponCondition condition : conditions) {
            //EAV(Entity - Attribute - Value) Model
            String attribute = condition.getAttribute();
            String operator = condition.getOperator();
            String value = condition.getValue();

            double percentDiscount = Double.valueOf(
                    String.valueOf(condition.getDiscountAmount()));

            if (attribute.equals("minimum_amount")) {
                if (operator.equals(">") && updatedTotalAmount > Double.parseDouble(value)) {
                    discount += updatedTotalAmount * percentDiscount / 100;
                }
            } else if (attribute.equals("applicable_date")) {
                LocalDate applicableDate = LocalDate.parse(value);
                LocalDate currentDate = LocalDate.now();
                if (operator.equalsIgnoreCase("BETWEEN")
                        && currentDate.isEqual(applicableDate)) {
                    discount += updatedTotalAmount * percentDiscount / 100;
                }
            }
            //còn nhiều nhiều điều kiện khác nữa
            updatedTotalAmount = updatedTotalAmount - discount;
        }
        return discount;
    }
}
