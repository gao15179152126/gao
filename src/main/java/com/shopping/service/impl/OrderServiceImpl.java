package com.shopping.service.impl;

import com.shopping.dao.*;
import com.shopping.pojo.Order;
import com.shopping.pojo.OrderDetail;
import com.shopping.pojo.User;
import com.shopping.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;


/**
 * @ClassName OrderServiceIml
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/5 10:27
 * @Version 1.0
 **/
@Service
public class OrderServiceImpl implements OrderService {

    private final OrderDao orderDao;
    private final ProductDao productDao;
    private final CartDao cartDao;
    private final UserDao userDao;
    private final CouponDao couponDao;

    @Autowired
    public OrderServiceImpl(OrderDao orderDao, ProductDao productDao, CartDao cartDao, UserDao userDao, CouponDao couponDao) {
        this.orderDao = orderDao;
        this.productDao = productDao;
        this.cartDao = cartDao;
        this.userDao = userDao;
        this.couponDao = couponDao;
    }

    /**
     * 查看个人订单
     */
    @Override
    public List<Order> viewPersonalOrder(String username) {
        List<Order> personalOrderLists = orderDao.queryOrderByUsername(username);
        for (Order personalOrderList : personalOrderLists) {
            List<OrderDetail> personalOrderDetailLists = orderDao.queryOrderDetailByNo(personalOrderList.getOrderNo());
            for (OrderDetail personalOrderDetailList : personalOrderDetailLists) {
                personalOrderDetailList.setProductName(cartDao.getProductNameById(personalOrderDetailList.getProductId()));
            }
            personalOrderList.setOrderDetails(personalOrderDetailLists);
        }
        return personalOrderLists;
    }

    /**
     * 事务模式提交订单
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public String submitOrder(List<OrderDetail> orderDetails, String username, String userId, int vip) {
        //时间+用户ID生成订单号
        String orderNo = System.currentTimeMillis() + userId;
        //订单总金额
        double total = 0;
        //判断库存
        for (OrderDetail orderDetail : orderDetails) {
            if (orderDao.getProductNumberById(orderDetail.getProductId()) < orderDetail.getProductNumber()) {
                return cartDao.getProductNameById(orderDetail.getProductId()) + " 库存不足";
            } else {
                //购物车删除
                cartDao.deleteCart(username, orderDetail.getProductId());
                //库存减少(数量去反)
                productDao.changeProductNumberById(orderDetail.getProductId(), -orderDetail.getProductNumber());
            }
            orderDetail.setOrderNo(orderNo);
            //数据库插入单条订单商品记录
            orderDao.generateOrderDetail(orderDetail);
            //计算订单总价
            total += orderDetail.getProductPrice() * orderDetail.getProductNumber();
        }
        //生成订单
        //封装对象
        Order order = new Order();
        order.setOrderDate(new Timestamp(System.currentTimeMillis()));
        order.setUsername(username);
        order.setOrderStatus("未完成");
        order.setOrderMoney(total * (1 - 0.02 * vip));
        order.setOrderNo(orderNo);
        //提交数据
        orderDao.generateOrderNo(order);
        //返回订单号
        return orderNo;
    }

    /**
     * 事务模式订单付款
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public String payForOrder(String orderNo, User user, String address, int couponId) {
        float discount = couponDao.getDiscountByCouponId(couponId);
        double actualCost = orderDao.queryOrderMoneyByNo(orderNo) * discount / 10;
        String username = user.getUsername();
        if (user.getBalance() < actualCost) {
            return "余额不足";
        } else {
            //用户余额减少
            userDao.changeUserBalance(username, -actualCost);
            //优惠券删除
            if (couponId != 1) {
                couponDao.deleteCouponByCouponId(couponId);
            }
            //用户积分增加
            userDao.changeUserPoint(username, actualCost);
            //改变订单的状态
            orderDao.changeOrderStatus(orderNo, "已付款");
            //改变订单的实付金额
            orderDao.changeOrderMoney(orderNo, actualCost);
            //添加收货地址
            orderDao.changeOrderAddress(orderNo, address);
        }
        return "付款成功";
    }

    /**
     * 事务模式取消订单
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public String cancelOrder(String orderNo) {
        //修改订单状态
        orderDao.changeOrderStatus(orderNo, "已取消");
        //库存回滚
        List<OrderDetail> orderDetailList = orderDao.queryOrderDetailByNo(orderNo);
        for (OrderDetail orderDetail : orderDetailList) {
            productDao.changeProductNumberById(orderDetail.getProductId(), orderDetail.getProductNumber());
        }
        return "取消成功";
    }

    @Override
    public String getOrderStatusByOrderNo(String orderNo) {
        return orderDao.getOrderStatusByOrderNo(orderNo);
    }

    @Override
    public double getOrderMoneyByOrderNo(String orderNo) {
        return orderDao.queryOrderMoneyByNo(orderNo);
    }

}
