package com.shopping.service;

import com.shopping.pojo.Product;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
    List<Product> list();
    Product queryProductById(int productId);
    String save(MultipartFile productImage, Product product, Model model) throws IOException;
}
