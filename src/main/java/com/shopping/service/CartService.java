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
    /**
     * 添加商品至购物车
     *
     * @param username   1
     * @param productId  2
     * @param cartNumber 3
     * @return void
     */
    void addCart(String username, int productId, int cartNumber);

    /**
     * 查询购物车
     *
     * @param username 1
     * @return java.util.List<com.shopping.pojo.Cart>
     */
    List<Cart> queryCart(String username);

    /**
     * 指定商品id删除购物车
     *
     * @param username  1
     * @param productId 2
     * @return void
     */
    void deleteCart(String username, int productId);

    /**
     * 通过商品id获取商品名称
     *
     * @param id 1
     * @return java.lang.String
     */
    String getProductNameById(int id);

    /**
     * 购物车商品数量增加
     *
     * @param username   1
     * @param productId  2
     * @param cartNumber 3
     * @return int
     */
    void cartProductNumberAdd(String username, int productId, int cartNumber);
}
