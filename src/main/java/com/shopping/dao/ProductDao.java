package com.shopping.dao;

import com.shopping.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @InterfaceName Product
 * @Description 商品数据接口
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/23 14:10
 * @Version 1.0
 **/
public interface ProductDao {
    /**
     * 查询所有商品
     *
     * @return java.util.List<com.shopping.pojo.Product>
     */
    List<Product> list();

    /**
     * 通过商品id查询商品
     *
     * @param productId 商品id
     * @return com.shopping.pojo.Product
     */
    Product queryProductById(@Param("productId") int productId);

    /**
     * 上传商品
     *
     * @param product 商品
     * @return java.lang.Integer
     */
    Integer save(@Param("product") Product product);

    /**
     * 商品数量减少
     *
     * @param productId   商品id
     * @param orderNumber 生成订单商品数量
     * @return void
     */
    void delNum(@Param("productId") int productId, @Param("orderNumber") int orderNumber);

    /**
     * 改变商品库存数量
     *
     * @param productId     商品id
     * @param productNumber 商品数量
     * @return int
     */
    int changeProductNumberById(@Param("productId") int productId, @Param("productNumber") int productNumber);

    /**
     * 通过商品类别查询所有商品
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
    int setProductNumberById(@Param("id") int id, @Param("number") int number);

    /**
     * 通过商品Id设置商品单价
     *
     * @param id    商品id
     * @param price 商品价格
     * @return int
     */
    int setProductPriceById(@Param("id") int id, @Param("price") double price);

    /**
     * 通过商品Id设置商品名称
     *
     * @param id   商品id
     * @param name 商品名称
     * @return int
     */
    int setProductNameById(@Param("id") int id, @Param("name") String name);

    /**
     * 通过商品Id查询商品图片
     *
     * @param id 商品id
     * @return java.lang.String
     */
    String queryProductImageById(int id);

    /**
     * 通过商品Id设置商品图片
     *
     * @param id    商品id
     * @param image 图片名称
     * @return int
     */
    int setProductImageById(@Param("id") int id, @Param("image") String image);

    /**
     * 获取商品详情
     *
     * @param id 1
     * @return java.lang.String
     */
    String getProductDetailByProductId(int id);

    /**
     * 修改商品详情
     *
     * @param id     1
     * @param detail 2
     * @return int
     */
    int changeProductDetailById(@Param("id") int id, @Param("detail") String detail);

    /**
     * 通过商品id删除商品
     *
     * @param id 商品id
     * @return int
     */
    int deleteProductById(int id);
}
