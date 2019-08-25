package com.shopping.dao;

import com.shopping.pojo.dto.OrderDateTime;
import com.shopping.pojo.Order;
import com.shopping.pojo.OrderDetail;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @InterfaceName OrderDao
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/5 10:26
 * @Version 1.0
 **/
public interface OrderDao {
    //void autoAddOrder(@Param("order") Order order);
    //根据用户名查询订单号
    List<Order> queryOrderByUsername(@Param("username") String username);
    //根据订单号查询订单内容
    List<OrderDetail> queryOrderDetailByNo(@Param("orderNo") String orderNo);

    List<Order> queryAllOrder();

    //根据当前商品查询库存量
    int getProductNumberById(@Param("productId") int productId);
    //生成订单细节
    int generateOrderDetail(@Param("orderDetail") OrderDetail orderDetail);
    //生成单号记录
    int generateOrderNo(@Param("order") Order order);
    //订单状态改变
    int changeOrderStatus(@Param("orderNo") String orderNo, @Param("orderStatus") String orderStatus);
    //订单金额改变
    int changeOrderMoney(@Param("orderNo") String orderNo, @Param("orderMoney") double orderMoney);
    //根据订单号查询订单金额
    double queryOrderMoneyByNo(String orderNo);
    //查询所有订单时间
    List<OrderDateTime> queryAllOrderTime();



    /**
     * 根据订单状态查询订单
     *
     * @param status 1
     * @return java.util.List<com.shopping.pojo.Order>
     */
    List<Order> queryOrderByStatus(String status);

    /**
     * 根据id查询商品名称
     *
     * @param productId 1
     * @return java.lang.String
     */
    String queryProductNameById(int productId);

    /**
     * 根据单号查询订单
     *
     * @param orderNo 1
     * @return com.shopping.pojo.Order
     */
    Order queryOrderByNo(String orderNo);

    /**
     * 根据起止时间查询订单
     *
     * @param startDate 1
     * @param endDate 2
     * @return java.util.List<com.shopping.pojo.Order>
     */
    List<Order> queryOrderByDate(@Param("startDate") Date startDate, @Param("endDate") Date endDate);

    /**
     * 改变订单地址
     *
     * @param orderNo 1
     * @param orderAddress 2
     * @return int
     */
    int changeOrderAddress(@Param("orderNo") String orderNo, @Param("orderAddress") String orderAddress);
}
