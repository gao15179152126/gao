package com.shopping.service.impl;

import com.shopping.dao.CouponDao;
import com.shopping.pojo.Coupon;
import com.shopping.service.CouponService;
import com.shopping.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName CouponServiceImpl
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/28 13:50
 * @Version 1.0
 **/
@Service
public class CouponServiceImpl implements CouponService {

    private final CouponDao couponDao;
    private final UserService userService;

    @Autowired
    public CouponServiceImpl(CouponDao couponDao, UserService userService) {
        this.couponDao = couponDao;
        this.userService = userService;
    }

    @Override
    public List<Coupon> getCouponByUsername(String username) {
        return couponDao.queryUserCouponByUsername(username);
    }

    @Override
    public List<String> getCouponNameByUsername(String username) {
        return couponDao.getCouponNameByUsername(username);
    }

    @Override
    public String getCouponByOrderNoAndUsername(String orderNo, String username) {
        if (userService.checkUsername(username) < 1) {
            return "用户名不存在";
        }
        if (couponDao.checkCouponByOrderNoAndUsername(orderNo, username) > 0) {
            return "该用户已经领取过该分享";
        }
        if (couponDao.countCouponByOrderNo(orderNo) > 9) {
            return "该分享领取次数上限";
        }
        //随机生成折扣卷
        float discount;
        double random = Math.random();
        if (random < 0.5) {
            discount = 8.8f;
        } else if (random < 0.8) {
            discount = 6.8f;
        } else {
            discount = 5.8f;
        }
        Coupon coupon = new Coupon();
        coupon.setOrderNo(orderNo);
        coupon.setUsername(username);
        coupon.setDiscount(discount);
        coupon.setCouponName(discount + "折全场优惠券");
        couponDao.insertCoupon(coupon);
        return "恭喜你获得" + discount + "折全场优惠券";
    }

    @Override
    public List<Coupon> getOrderCouponByOrderNo(String orderNo) {
        return couponDao.getOrderCouponByOrderNo(orderNo);
    }

    @Override
    public float getDiscountByCouponId(int couponId) {
        return couponDao.getDiscountByCouponId(couponId);
    }

    @Override
    public int deleteCouponByCouponId(int couponId) {
        return couponDao.deleteCouponByCouponId(couponId);
    }
}
