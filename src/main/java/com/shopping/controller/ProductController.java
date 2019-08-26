package com.shopping.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shopping.pojo.Product;
import com.shopping.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.List;

/**
 * @ClassName ProductController
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/23 14:27
 * @Version 1.0
 **/
@Controller
@RequestMapping("/product")
public class ProductController {

    private final ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    /**
     * 商品展示
     */
    @RequestMapping("/shopShow")
    public ModelAndView list() {
        List<Product> lists = productService.list();
        ModelAndView mav = new ModelAndView();
        mav.addObject("list", lists);
        mav.setViewName("shopShow");
        System.out.println(lists);
        return mav;
    }

    /**
     * 单个商品展示
     */
    @RequestMapping(value = "/singleProductShow", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String queryProductById(int productId) throws JsonProcessingException {
        Product singleProduct = productService.queryProductById(productId);
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.writeValueAsString(singleProduct);
    }

    /**
     * 上传商品
     */
    @RequestMapping("/save")
    @ResponseBody
    public String save(MultipartFile file, Product product, Model model) {
        try {
            return productService.save(file, product, model);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "1";
    }

    /**
     * 上传商品页面
     */
    @RequestMapping("/toSave")
    public String toSave() {
        return "save";
    }
}
