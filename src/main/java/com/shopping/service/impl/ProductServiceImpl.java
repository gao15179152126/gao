package com.shopping.service.impl;

import com.shopping.dao.ProductDao;
import com.shopping.pojo.Product;
import com.shopping.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * @ClassName ProductServiceImpl
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/23 14:21
 * @Version 1.0
 **/
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;

    @Override
    public List<Product> list() {
        return productDao.list();
    }

    @Override
    public Product queryProductById(int productId) {
        return productDao.queryProductById(productId);
    }

    @Override
    @Transactional
        public String save(MultipartFile file, Product product, Model model) throws IOException {
        // 保存图片的路径，图片上传成功后，将路径保存到数据库
        String filePath = "C:\\upload";
        // 获取原始图片的扩展名
        String originalFilename = file.getOriginalFilename();
        // 生成文件新的名字
        String newFileName = UUID.randomUUID() + originalFilename;
        // 封装上传文件位置的全路径
        File targetFile = new File(filePath, newFileName);
        file.transferTo(targetFile);
        // 保存到数据库
        product.setProductImage(newFileName);
        productDao.save(product);
        return "1";
    }


}
