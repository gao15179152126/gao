package com.shopping.service.impl;

import com.shopping.dao.CartDao;
import com.shopping.dao.OrderDao;
import com.shopping.dao.ProductDao;
import com.shopping.pojo.Order;
import com.shopping.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;
import java.util.TimeZone;

/**
 * @ClassName OrderServiceIml
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/5 10:27
 * @Version 1.0
 **/
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;
    @Autowired
    private ProductDao productDao;
    @Autowired
    private CartDao cartDao;

    @Override
    /**
     * 自动生成订单
     */
    public void generateOrder(List<Order> orderList) {
        for(Order order:orderList){
            order.setOrderDate(new Timestamp(System.currentTimeMillis()));
            cartDao.deleteCart(order.getUsername(),order.getProductId());
            productDao.delNum(order.getProductId(), order.getOrderNumber());
            orderDao.autoAddOrder(order);
        }
    }

    /**
     * 查看个人订单
     */
    @Override
    public List<Order> viewPersonalOrder(String username) {
        return orderDao.queryOrderByUsername(username);
    }
}
