package com.shopping.pojo;

import java.sql.Timestamp;

/**
 * @ClassName Order
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/1 16:16
 * @Version 1.0
 **/
public class Order {
    private int orderId;
    private Timestamp orderDate;
    private int productId;
    private String username;
    private double orderMoney;
    private int orderNumber;

    public int getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(int orderNumber) {
        this.orderNumber = orderNumber;
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

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public double getOrderMoney() {
        return orderMoney;
    }

    public void setOrderMoney(double orderMoney) {
        this.orderMoney = orderMoney;
    }
}
