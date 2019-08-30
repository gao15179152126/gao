package com.shopping.dao;

import com.shopping.pojo.Coupon;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @InterfaceName CouponDao
 * @Description 优惠券数据接口
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/28 13:36
 * @Version 1.0
 **/
public interface CouponDao {
    /**
     * 查询用户优惠券
     *
     * @param username 用户名
     * @return java.util.List<com.shopping.pojo.Coupon>
     */
    List<Coupon> queryUserCouponByUsername(String username);

    /**
     * 查询用户优惠券名称
     *
     * @param username 用户名
     * @return java.util.List<java.lang.String>
     */
    List<String> getCouponNameByUsername(String username);

    /**
     * 列出该订单优惠券被领取情况
     *
     * @param orderNo 订单号
     * @return java.util.List<com.shopping.pojo.Coupon>
     */
    List<Coupon> getOrderCouponByOrderNo(String orderNo);

    /**
     * 计算已领取优惠券数量
     *
     * @param orderNo 订单号
     * @return int
     */
    int countCouponByOrderNo(String orderNo);

    /**
     * 检查用户是否已经领取过该分享
     *
     * @param orderNo  1
     * @param username 2
     * @return int
     */
    int checkCouponByOrderNoAndUsername(@Param("orderNo") String orderNo, @Param("username") String username);

    /**
     * 插入优惠券
     *
     * @param coupon 1
     * @return int
     */
    int insertCoupon(Coupon coupon);

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
