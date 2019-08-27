package com.shopping.service;

import com.shopping.pojo.Cart;

import java.util.List;

/**
 * @InterfaceName CartService
 * @Description 购物车接口
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/31 19:44
 * @Version 1.0
 **/
public interface CartService {
    /**
     * 添加商品至购物车
     *
     * @param username   用户名
     * @param productId  商品id
     * @param cartNumber 购物车商品数量
     * @return void
     */
    void addCart(String username, int productId, int cartNumber);

    /**
     * 查询购物车
     *
     * @param username 用户名
     * @return java.util.List<com.shopping.pojo.Cart>
     */
    List<Cart> queryCart(String username);

    /**
     * 指定商品id删除购物车
     *
     * @param username  用户名
     * @param productId 商品id
     * @return void
     */
    void deleteCart(String username, int productId);

    /**
     * 通过商品id获取商品名称
     *
     * @param id 商品id
     * @return java.lang.String
     */
    String getProductNameById(int id);

    /**
     * 购物车商品数量增加
     *
     * @param username   用户名
     * @param productId  商品id
     * @param cartNumber 增减数量
     * @return int
     */
    void cartProductNumberAdd(String username, int productId, int cartNumber);
}
