package com.shopping.service;

import com.shopping.pojo.Order;
import com.shopping.pojo.OrderDetail;
import com.shopping.pojo.User;

import java.util.List;

/**
 * @InterfaceName OrderService
 * @Description 订单接口
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/5 10:27
 * @Version 1.0
 **/
public interface OrderService {
    /**
     * 查看个人订单
     *
     * @param username 用户名
     * @return java.util.List<com.shopping.pojo.Order>
     */
    List<Order> viewPersonalOrder(String username);

    /**
     * 提交订单
     *
     * @param orderDetails 订单详情
     * @param username     用户名
     * @param userId       用户id
     * @param vip          会员等级
     * @return java.lang.String
     */
    String submitOrder(List<OrderDetail> orderDetails, String username, String userId, int vip);

    /**
     * 订单付款
     *
     * @param orderNo  订单号
     * @param user     用户
     * @param address  地址
     * @param couponId 优惠券Id
     * @return java.lang.String
     */
    String payForOrder(String orderNo, User user, String address, int couponId);

    /**
     * 取消订单
     *
     * @param orderNo 订单号
     * @return java.lang.String
     */
    String cancelOrder(String orderNo);

    /**
     * 根据订单号查询订单状态
     *
     * @param orderNo 订单号
     * @return java.lang.String
     */
    String getOrderStatusByOrderNo(String orderNo);

    /**
     * 根据订单号查询订单金额
     *
     * @param orderNo 订单号
     * @return double
     */
    double getOrderMoneyByOrderNo(String orderNo);
}
