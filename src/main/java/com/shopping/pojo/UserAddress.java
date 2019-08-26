package com.shopping.pojo;

/**
 * @ClassName UserAddress
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/14 10:56
 * @Version 1.0
 **/
public class UserAddress {
    private int userAddressId;
    private String username;
    private String address;

    public int getUserAddressId() {
        return userAddressId;
    }

    public void setUserAddressId(int userAddressId) {
        this.userAddressId = userAddressId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
