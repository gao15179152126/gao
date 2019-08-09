package com.shopping.service;

import com.shopping.pojo.Order;

import java.util.List;

/**
 * @InterfaceName OrderService
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/5 10:27
 * @Version 1.0
 **/
public interface OrderService {
    void generateOrder(List<Order> orderList);
    List<Order> viewPersonalOrder(String username);
}
