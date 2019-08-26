package com.shopping.pojo;

import java.io.Serializable;

/**
 * @ClassName Product
 * @Description TODO
 * @Author Zhaoui.Gao
 * @DateTime 2019/7/23 14:09
 * @Version 1.0
 **/
public class Product implements Serializable {
    /**
     * 商品id
     */
    private int productId;
    /**
     * 商品类型
     */
    private String productType;
    /**
     * 商品名称
     */
    private String productName;
    /**
     * 商品价格
     */
    private double productPrice;
    /**
     * 商品图片
     */
    private String productImage;
    /**
     * 商品数量
     */
    private int productAmount;
    /**
     * 商品详情
     */
    private String productDetail;

    public String getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(String productDetail) {
        this.productDetail = productDetail;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public int getProductAmount() {
        return productAmount;
    }

    public void setProductAmount(int productAmount) {
        this.productAmount = productAmount;
    }
}
