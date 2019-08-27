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
 * @Description 管理员接口
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
     * @param page 页码
     * @return java.util.List<com.shopping.pojo.User>
     */
    List<User> pagedQueryUserByPage(int page);

    /**
     * 根据用户名计算页数
     *
     * @param username 用户名
     * @return int
     */
    int countPageByName(String username);

    /**
     * 通过页码分页和用户名查询用户信息
     *
     * @param page     页码
     * @param username 用户名
     * @return java.util.List<com.shopping.pojo.User>
     */
    List<User> pagedQueryUserByPageAndName(int page, String username);

    /**
     * 改变用户状态
     *
     * @param id     用户id
     * @param status 用户状态
     * @return int
     */
    int changeUserStatus(int id, String status);

    /**
     * 用户积分清零
     *
     * @param id 用户id
     * @return int
     */
    int clearUserPoint(int id);

    /**
     * 查询此类所有商品
     *
     * @param type 商品类型
     * @return java.util.List<com.shopping.pojo.Product>
     */
    List<Product> queryProductByType(String type);

    /**
     * 通过商品Id设置商品库存数量
     *
     * @param id     商品id
     * @param number 商品数量
     * @return int
     */
    int setProductNumberById(int id, int number);

    /**
     * 通过商品Id设置商品单价
     *
     * @param id    商品id
     * @param price 商品单价
     * @return int
     */
    int setProductPriceById(int id, double price);

    /**
     * 通过商品Id设置商品名称
     *
     * @param id   商品id
     * @param name 商品名称
     * @return int
     */
    int setProductNameById(int id, String name);

    /**
     * 获取商品图片
     *
     * @param id 商品id
     * @return int
     */
    String getProductImageById(int id);

    /**
     * 通过商品Id更新商品图片
     *
     * @param id   商品id
     * @param file 商品图片文件
     * @return int
     * @throws Exception 文件不存在
     */
    int updateProductImageById(int id, MultipartFile file) throws Exception;

    /**
     * 根据订单状态查询订单
     *
     * @param status 订单状态
     * @return java.util.List<com.shopping.pojo.Order>
     */
    List<Order> queryOrderByStatus(String status);

    /**
     * 完成订单
     *
     * @param orderNo 订单号
     * @return void
     */
    void finishOrder(String orderNo);

    /**
     * 根据单号查询订单
     *
     * @param orderNo 订单号
     * @return com.shopping.pojo.Order
     */
    Order queryOrderByNo(String orderNo);

    /**
     * 根据时间查询订单
     *
     * @param startDate 开始时间
     * @param endDate   结束时间
     * @return java.util.List<com.shopping.pojo.Order>
     */
    List<Order> queryOrderByDate(Date startDate, Date endDate);

    /**
     * 根据订单号查询订单细节
     *
     * @param orderNo 订单号
     * @return java.util.List<com.shopping.pojo.OrderDetail>
     */
    List<OrderDetail> queryOrderDetailByNo(String orderNo);
}
