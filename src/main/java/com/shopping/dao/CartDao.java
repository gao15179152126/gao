package com.shopping.dao;

import com.shopping.pojo.Cart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @InterfaceName OrderDao
 * @Description 购物车数据接口
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/31 19:43
 * @Version 1.0
 **/
public interface CartDao {
    /**
     * 添加商品至购物车
     *
     * @param username   用户名
     * @param productId  商品id
     * @param cartNumber 商品购物车数量
     * @return void
     */
    void addCart(@Param("username") String username, @Param("productId") int productId, @Param("cartNumber") int cartNumber);

    /**
     * 查询购物车
     *
     * @param username 用户名
     * @return java.util.List<com.shopping.pojo.Cart>
     */
    List<Cart> queryCart(@Param("username") String username);

    /**
     * 删除购物车单品
     *
     * @param username  用户名
     * @param productId 商品id
     * @return void
     */
    void deleteCart(@Param("username") String username, @Param("productId") int productId);

    /**
     * 通过商品id查询商品名称
     *
     * @param productId 商品id
     * @return java.lang.String
     */
    String getProductNameById(int productId);

    /**
     * 商品数量增加
     *
     * @param username  用户名
     * @param productId 商品id
     * @param addNumber 添加至购物车数量
     * @return int
     */
    int cartProductNumberAdd(@Param("username") String username, @Param("productId") int productId, @Param("addNumber") int addNumber);


    /**
     * 检查商品是否存在购物车
     *
     * @param username  用户名
     * @param productId 商品id
     * @return int
     */
    int productIsOrNotExistCart(@Param("username") String username, @Param("productId") int productId);
}
