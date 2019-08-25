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
//    void generateOrder(List<Order> orderList);
    List<Order> viewPersonalOrder(String username);

    //提交订单
    String submitOrder(List<OrderDetail> orderDetails, String username, String userId, int vip);
    //订单付款
    String payForOrder(String orderNo, User user, String address);
    //取消订单
    String cancelOrder(String orderNo);

}
