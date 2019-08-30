package com.shopping.dao;

import com.shopping.pojo.dto.OrderDateTime;
import com.shopping.pojo.Order;
import com.shopping.pojo.OrderDetail;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @InterfaceName OrderDao
 * @Description 订单数据接口
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/5 10:26
 * @Version 1.0
 **/
public interface OrderDao {
    /**
     * 查看个人订单
     *
     * @param username 用户名
     * @return java.util.List<com.shopping.pojo.Order>
     */
    List<Order> queryOrderByUsername(@Param("username") String username);

    /**
     * 根据订单号查看订单内容
     *
     * @param orderNo 订单号
     * @return java.util.List<com.shopping.pojo.OrderDetail>
     */
    List<OrderDetail> queryOrderDetailByNo(@Param("orderNo") String orderNo);

    /**
     * 查询所有订单
     *
     * @return java.util.List<com.shopping.pojo.Order>
     */
    List<Order> queryAllOrder();

    /**
     * 根据当前商品查询库存量
     *
     * @param productId 商品id
     * @return int
     */
    int getProductNumberById(@Param("productId") int productId);

    /**
     * 生成订单细节
     *
     * @param orderDetail 订单详情
     * @return int
     */
    int generateOrderDetail(@Param("orderDetail") OrderDetail orderDetail);

    /**
     * 生成单号记录
     *
     * @param order 订单
     * @return int
     */
    int generateOrderNo(@Param("order") Order order);

    /**
     * 订单状态改变
     *
     * @param orderNo     订单号
     * @param orderStatus 订单状态
     * @return int
     */
    int changeOrderStatus(@Param("orderNo") String orderNo, @Param("orderStatus") String orderStatus);

    /**
     * 订单金额改变
     *
     * @param orderNo    订单号
     * @param orderMoney 订单金额
     * @return int
     */
    int changeOrderMoney(@Param("orderNo") String orderNo, @Param("orderMoney") double orderMoney);

    /**
     * 根据订单号查询订单金额
     *
     * @param orderNo 订单号
     * @return double
     */
    double queryOrderMoneyByNo(String orderNo);

    /**
     * 查询所有订单时间
     *
     * @return java.util.List<com.shopping.pojo.dto.OrderDateTime>
     */
    List<OrderDateTime> queryAllOrderTime();


    /**
     * 根据订单状态查询订单
     *
     * @param status 订单状态
     * @return java.util.List<com.shopping.pojo.Order>
     */
    List<Order> queryOrderByStatus(String status);

    /**
     * 根据id查询商品名称
     *
     * @param productId 商品id
     * @return java.lang.String
     */
    String queryProductNameById(int productId);

    /**
     * 根据单号查询订单
     *
     * @param orderNo 订单号
     * @return com.shopping.pojo.Order
     */
    Order queryOrderByNo(String orderNo);

    /**
     * 根据起止时间查询订单
     *
     * @param startDate 开始时间
     * @param endDate   结束时间
     * @return java.util.List<com.shopping.pojo.Order>
     */
    List<Order> queryOrderByDate(@Param("startDate") Date startDate, @Param("endDate") Date endDate);

    /**
     * 改变订单地址
     *
     * @param orderNo      订单号
     * @param orderAddress 订单地址
     * @return int
     */
    int changeOrderAddress(@Param("orderNo") String orderNo, @Param("orderAddress") String orderAddress);

    /**
     * 根据订单号查询订单状态
     *
     * @param orderNo 订单号
     * @return java.lang.String
     */
    String getOrderStatusByOrderNo(String orderNo);
}
