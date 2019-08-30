package com.shopping.pojo;

/**
 * @ClassName Coupon
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/28 13:32
 * @Version 1.0
 **/
public class Coupon {
    /**
     * 优惠券id
     */
    private int couponId;
    /**
     * 订单号
     */
    private String orderNo;
    /**
     * 用户名
     */
    private String username;
    /**
     * 折扣
     */
    private float discount;
    /**
     * 优惠券名称
     */
    private String couponName;

    public String getCouponName() {
        return couponName;
    }

    public void setCouponName(String couponName) {
        this.couponName = couponName;
    }

    public int getCouponId() {
        return couponId;
    }

    public void setCouponId(int couponId) {
        this.couponId = couponId;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }
}
