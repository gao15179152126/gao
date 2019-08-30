package com.shopping.service;

import com.shopping.pojo.Coupon;

import java.util.List;

/**
 * @InterfaceName CouponService
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/28 13:50
 * @Version 1.0
 **/
public interface CouponService {

    /**
     * 查询用户所有优惠券
     *
     * @param username 用户名
     * @return java.util.List<com.shopping.pojo.Coupon>
     */
    List<Coupon> getCouponByUsername(String username);

    /**
     * 查询用户优惠券名称
     *
     * @param username 用户名
     * @return java.util.List<java.lang.String>
     */
    List<String> getCouponNameByUsername(String username);

    /**
     * 用户获取优惠券
     *
     * @param orderNo  1
     * @param username 2
     * @return java.lang.String
     */
    String getCouponByOrderNoAndUsername(String orderNo, String username);

    /**
     * 列出该订单优惠券被领取情况
     *
     * @param orderNo 1
     * @return java.lang.String
     */
    List<Coupon> getOrderCouponByOrderNo(String orderNo);

    /**
     * 根据优惠券id查折扣
     *
     * @param couponId 1
     * @return float
     */
    float getDiscountByCouponId(int couponId);

    /**
     * 删除优惠券
     *
     * @param couponId 1
     * @return int
     */
    int deleteCouponByCouponId(int couponId);
}
