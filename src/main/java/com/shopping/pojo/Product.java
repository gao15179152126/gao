package com.shopping.pojo;

import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

/**
 * @ClassName Product
 * @Description TODO
 * @Author Zhaoui.Gao
 * @DateTime 2019/7/23 14:09
 * @Version 1.0
 **/
public class Product implements Serializable {
    private int productId;
    private String productType;
    private String productName;
    private double productPrice;
    private String productImage;
    private int productAmount;

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
