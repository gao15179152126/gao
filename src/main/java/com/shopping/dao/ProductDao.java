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
}
