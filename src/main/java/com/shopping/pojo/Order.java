package com.shopping.pojo;


import java.sql.Timestamp;
import java.util.List;

/**
 * @ClassName Order
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/1 16:16
 * @Version 1.0
 **/
public class Order {
    /**
     * 订单id
     */
    private int orderId;
    /**
     * 下单时间
     */
    private Timestamp orderDate;
    /**
     * 用户名
     */
    private String username;
    /**
     * 订单状态
     */
    private String orderStatus;
    /**
     * 订单金额
     */
    private double orderMoney;
    /**
     * 订单号
     */
    private String orderNo;
    /**
     * 订单详情
     */
    private List<OrderDetail> orderDetails;
    /**
     * 订单地址
     */
    private String address;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public double getOrderMoney() {
        return orderMoney;
    }

    public void setOrderMoney(double orderMoney) {
        this.orderMoney = orderMoney;
    }

}
