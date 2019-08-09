package com.shopping.service;

import com.shopping.pojo.Cart;

import java.util.List;

/**
 * @InterfaceName OrderService
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/31 19:44
 * @Version 1.0
 **/
public interface CartService {
    void addCart(String username, int productId);
    List<Cart> queryCart(String username);
    void deleteCart(String username, int productId);
    String getProductNameById(int id);
}
