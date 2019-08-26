package com.shopping.service;

import com.shopping.pojo.Order;
import com.shopping.pojo.OrderDetail;
import com.shopping.pojo.User;

import java.util.List;

/**
 * @InterfaceName OrderService
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/5 10:27
 * @Version 1.0
 **/
public interface OrderService {
    /**
     * 查看个人订单
     *
     * @param username 1
     * @return java.util.List<com.shopping.pojo.Order>
     */
    List<Order> viewPersonalOrder(String username);

    /**
     * 提交订单
     *
     * @param orderDetails 1
     * @param username     2
     * @param userId       3
     * @param vip          4
     * @return java.lang.String
     */
    String submitOrder(List<OrderDetail> orderDetails, String username, String userId, int vip);

    /**
     * 订单付款
     *
     * @param orderNo 1
     * @param user    2
     * @param address 3
     * @return java.lang.String
     */
    String payForOrder(String orderNo, User user, String address);

    /**
     * 取消订单
     *
     * @param orderNo 1
     * @return java.lang.String
     */
    String cancelOrder(String orderNo);
}
