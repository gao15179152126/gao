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
    void addCart(@Param("username") String username, @Param("productId")int productId);
    List<Cart> queryCart(@Param("username") String username);
    void deleteCart(@Param("username") String username, @Param("productId")int productId);
    String getProductNameById(int productId);
}
