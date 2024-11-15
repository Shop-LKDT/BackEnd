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
        // Tìm coupon theo mã coupon
        Optional<Coupon> couponOptional = couponRepository.findByCode(couponCode);

        // Kiểm tra nếu coupon tồn tại và đang hoạt động
        if (couponOptional.isPresent() && couponOptional.get().isActive()) {
            Coupon coupon = couponOptional.get();
            double discountValue;

            // Giả định rằng giá trị của coupon (coupon.getValue()) có thể là phần trăm hoặc số tiền cố định
            try {
                if (coupon.getValue().endsWith("%")) {
                    // Nếu giá trị là phần trăm, chuyển đổi sang double và tính theo tỷ lệ
                    String percentageValue = coupon.getValue().replace("%", "");
                    double percentage = Double.parseDouble(percentageValue);
                    discountValue = (percentage / 100) * totalAmount;
                } else {
                    // Nếu là số tiền cố định, chuyển sang double
                    discountValue = Double.parseDouble(coupon.getValue());
                }

                // Trả về giá trị giảm giá
                return discountValue;
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Invalid coupon value format for code: " + couponCode);
            }
        }

        // Nếu coupon không hợp lệ hoặc không hoạt động, trả về 0 (không có giảm giá)
        return 0;
    }


    @Override
    public Coupon createCoupon(Coupon coupon) {
        return couponRepository.save(coupon);
    }

    @Override
    public List<Coupon> getAllCoupons() {
        return couponRepository.findAll();
    }

    @Override
    public Optional<Coupon> getCouponById(Long id) {
        return couponRepository.findById(id);
    }

    @Override
    public Optional<Coupon> getCouponByCode(String code) {
        return couponRepository.findByCode(code); // Trả về Optional<Coupon> từ repository
    }

    @Override
    public Coupon updateCoupon(Long id, Coupon couponDetails) {
        Coupon coupon = couponRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Coupon not found with id " + id));

        coupon.setCode(couponDetails.getCode());
        coupon.setActive(couponDetails.isActive());
        coupon.setValue(couponDetails.getValue());

        return couponRepository.save(coupon);
    }

    @Override
    public void deleteCoupon(Long id) {
        Coupon coupon = couponRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Coupon not found with id " + id));
        couponRepository.delete(coupon);
    }
}
