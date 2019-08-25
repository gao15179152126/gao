package com.shopping.dao;

import com.shopping.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @InterfaceName Product
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/23 14:10
 * @Version 1.0
 **/
public interface ProductDao {
    List<Product> list();
    Product queryProductById(@Param("productId") int productId);
    Integer save(@Param("product") Product product);
    void delNum(@Param("productId") int productId,@Param("orderNumber") int orderNumber);
    //改变商品库存数量
    int changeProductNumberById(@Param("productId") int productId,@Param("productNumber") int productNumber);


    /**
     * 通过商品类别查询所有商品
     *
     * @param type 1
     * @return java.util.List<com.shopping.pojo.Product>
     */
    List<Product> queryProductByType(String type);

    /**
     * 通过商品Id设置商品库存数量
     *
     * @param id 1
     * @param number 2
     * @return int
     */
    int setProductNumberById(@Param("id") int id,@Param("number") int number);

    /**
     * 通过商品Id设置商品单价
     *
     * @param id 1
     * @param price 2
     * @return int
     */
    int setProductPriceById(@Param("id") int id,@Param("price") double price);

    /**
     * 通过商品Id设置商品名称
     *
     * @param id 1
     * @param name 2
     * @return int
     */
    int setProductNameById(@Param("id") int id,@Param("name") String name);

    /**
     * 通过商品Id查询商品图片
     *
     * @param id 1
     * @return java.lang.String
     */
    String queryProductImageById(int id);

    /**
     * 通过商品Id设置商品图片
     *
     * @param id 1
     * @param image 2
     * @return int
     */
    int setProductImageById(@Param("id") int id, @Param("image") String image);
}
