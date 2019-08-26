package com.shopping.service;

import com.shopping.pojo.Order;
import com.shopping.pojo.OrderDetail;
import com.shopping.pojo.Product;
import com.shopping.pojo.User;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

/**
 * @InterfaceName AdminService
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/15 12:15
 * @Version 1.0
 **/
public interface AdminService {

    /**
     * 计算页数
     *
     * @return int
     */
    int countPage();

    /**
     * 通过页码分页查询用户信息
     *
     * @param page 1
     * @return java.util.List<com.shopping.pojo.User>
     */
    List<User> pagedQueryUserByPage(int page);

    /**
     * 根据用户名计算页数
     *
     * @param username 1
     * @return int
     */
    int countPageByName(String username);

    /**
     * 通过页码分页和用户名查询用户信息
     *
     * @param page     1
     * @param username 2
     * @return java.util.List<com.shopping.pojo.User>
     */
    List<User> pagedQueryUserByPageAndName(int page, String username);

    /**
     * 改变用户状态
     *
     * @param id     1
     * @param status 2
     * @return int
     */
    int changeUserStatus(int id, String status);

    /**
     * 用户积分清零
     *
     * @param id 1
     * @return int
     */
    int clearUserPoint(int id);

    /**
     * 查询此类所有商品
     *
     * @param type 1
     * @return java.util.List<com.shopping.pojo.Product>
     */
    List<Product> queryProductByType(String type);

    /**
     * 通过商品Id设置商品库存数量
     *
     * @param id     1
     * @param number 2
     * @return int
     */
    int setProductNumberById(int id, int number);

    /**
     * 通过商品Id设置商品单价
     *
     * @param id    1
     * @param price 2
     * @return int
     */
    int setProductPriceById(int id, double price);

    /**
     * 通过商品Id设置商品名称
     *
     * @param id   1
     * @param name 2
     * @return int
     */
    int setProductNameById(int id, String name);

    /**
     * 获取商品图片
     *
     * @param id 1
     * @return int
     */
    String getProductImageById(int id);

    /**
     * 通过商品Id更新商品图片
     *
     * @param id   1
     * @param file 2
     * @return int
     * @throws Exception 文件不存在
     */
    int updateProductImageById(int id, MultipartFile file) throws Exception;

    /**
     * 根据订单状态查询订单
     *
     * @param status 1
     * @return java.util.List<com.shopping.pojo.Order>
     */
    List<Order> queryOrderByStatus(String status);

    /**
     * 完成订单
     *
     * @param orderNo 1
     * @return void
     */
    void finishOrder(String orderNo);

    /**
     * 根据单号查询订单
     *
     * @param orderNo 1
     * @return com.shopping.pojo.Order
     */
    Order queryOrderByNo(String orderNo);

    /**
     * 根据时间查询订单
     *
     * @param startDate 1
     * @param endDate   2
     * @return java.util.List<com.shopping.pojo.Order>
     */
    List<Order> queryOrderByDate(Date startDate, Date endDate);

    /**
     * 根据订单号查询订单细节
     *
     * @param orderNo 1
     * @return java.util.List<com.shopping.pojo.OrderDetail>
     */
    List<OrderDetail> queryOrderDetailByNo(String orderNo);
}
