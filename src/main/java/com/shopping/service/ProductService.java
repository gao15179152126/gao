package com.shopping.service;

import com.shopping.pojo.Product;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * @InterfaceName ProductService
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/23 14:11
 * @Version 1.0
 **/
public interface ProductService {
    /**
     * 列出所有商品
     *
     * @return java.util.List<com.shopping.pojo.Product>
     */
    List<Product> list();

    /**
     * 通过商品id查询商品
     *
     * @param productId 1
     * @return com.shopping.pojo.Product
     */
    Product queryProductById(int productId);

    /**
     * 上传商品
     *
     * @param productImage 1
     * @param product      2
     * @param model        3
     * @return java.lang.String
     * @throws IOException 文件可能不存在
     */
    String save(MultipartFile productImage, Product product, Model model) throws IOException;
}
