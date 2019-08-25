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
    //添加商品至购物车
    void addCart(@Param("username")String username,
                 @Param("productId")int productId,
                 @Param("cartNumber")int cartNumber);
    List<Cart> queryCart(@Param("username") String username);
    void deleteCart(@Param("username") String username, @Param("productId")int productId);
    String getProductNameById(int productId);
    //商品数量增加
    int cartProductNumberAdd(@Param("username")String username,
                             @Param("productId")int productId,
                             @Param("addNumber")int addNumber);
    //查询商品是否存在购物车
    int productIsOrNotExistCart(@Param("username")String username,
                                @Param("productId")int productId);
}
