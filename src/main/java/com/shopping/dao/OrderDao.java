package com.shopping.dao;

import com.shopping.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @InterfaceName OrderDao
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/5 10:26
 * @Version 1.0
 **/
public interface OrderDao {
    void autoAddOrder(@Param("order") Order order);
    List<Order> queryOrderByUsername(@Param("username") String username);
    List<Order> queryAllOrder();
}
