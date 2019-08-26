package com.shopping.dao;

import com.shopping.pojo.Cart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @InterfaceName OrderDao
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/31 19:43
 * @Version 1.0
 **/
public interface CartDao {
    /**
     * 添加商品至购物车
     *
     * @param username   1
     * @param productId  2
     * @param cartNumber 3
     * @return void
     */
    void addCart(@Param("username") String username, @Param("productId") int productId, @Param("cartNumber") int cartNumber);

    /**
     * 查询购物车
     *
     * @param username 1
     * @return java.util.List<com.shopping.pojo.Cart>
     */
    List<Cart> queryCart(@Param("username") String username);

    /**
     * 删除购物车单品
     *
     * @param username  1
     * @param productId 2
     * @return void
     */
    void deleteCart(@Param("username") String username, @Param("productId") int productId);

    /**
     * 通过商品id查询商品名称
     *
     * @param productId 1
     * @return java.lang.String
     */
    String getProductNameById(int productId);

    /**
     * 商品数量增加
     *
     * @param username  1
     * @param productId 2
     * @param addNumber 3
     * @return int
     */
    int cartProductNumberAdd(@Param("username") String username, @Param("productId") int productId, @Param("addNumber") int addNumber);


    /**
     * 检查商品是否存在购物车
     *
     * @param username  1
     * @param productId 2
     * @return int
     */
    int productIsOrNotExistCart(@Param("username") String username, @Param("productId") int productId);
}
