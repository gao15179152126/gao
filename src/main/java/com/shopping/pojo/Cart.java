package com.shopping.pojo;

/**
 * @ClassName Order
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/31 16:24
 * @Version 1.0
 **/
public class Cart {
    private int cartId;
    private String username;
    private int productId;
    private String productName;
    private String productImage;
    private double cartMoney;
    private int cartNumber;

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getCartNumber() {
        return cartNumber;
    }

    public void setCartNumber(int cartNumber) {
        this.cartNumber = cartNumber;
    }

    public double getCartMoney() {
        return cartMoney;
    }

    public void setCartMoney(double cartMoney) {
        this.cartMoney = cartMoney;
    }

    private int cartStatus;

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public int getCartStatus() {
        return cartStatus;
    }

    public void setCartStatus(int cartStatus) {
        this.cartStatus = cartStatus;
    }
}
