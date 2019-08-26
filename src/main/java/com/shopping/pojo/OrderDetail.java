package com.shopping.pojo;

/**
 * @ClassName Orderdetail
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/12 10:03
 * @Version 1.0
 **/
public class OrderDetail {
    /**
     * 订单详情id
     */
    private int orderDetailId;
    /**
     * 商品id
     */
    private int productId;
    /**
     * 商品名称
     */
    private String productName;
    /**
     * 商品价格
     */
    private double productPrice;
    /**
     * 商品数量
     */
    private int productNumber;

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    private String orderNo;

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductNumber() {
        return productNumber;
    }

    public void setProductNumber(int productNumber) {
        this.productNumber = productNumber;
    }
}
