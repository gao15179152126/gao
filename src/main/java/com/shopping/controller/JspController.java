package com.shopping.controller;

import com.shopping.pojo.Cart;
import com.shopping.pojo.Product;
import com.shopping.pojo.User;
import com.shopping.service.CartService;
import com.shopping.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @ClassName JspController
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/7 10:30
 * @Version 1.0
 **/
@Controller
@RequestMapping("/luckincoffee")
public class JspController {
    @Autowired
    private ProductService productService;
    @Autowired
    private CartService cartService;

    @RequestMapping("")
    public String luckincoffee(){
        return "luckincoffee";
    }

    @RequestMapping("/home")
    public String home(){
        return "home";
    }

    /*@RequestMapping("/shop")
    public String shop(){
        return "shop";
    }*/
    /**
     * 商城展示
     */
    @RequestMapping("/shop")
    public ModelAndView list(HttpSession httpSession, Model model){
        //商品展示
        List<Product> lists = productService.list();
        ModelAndView mav = new ModelAndView();
        mav.addObject("list",lists);
        //购物车展示
        User user = (User) httpSession.getAttribute("user");
        List<Cart> listCart=cartService.queryCart(user.getUsername());
        for (Cart cart : listCart){
            cart.setProductName(cartService.getProductNameById(cart.getProductId()));
        }
        mav.addObject("listCart",listCart);
        //跳转页面
        mav.setViewName("shop");
        return mav;
    }

    @RequestMapping("/personal")
    public String personal(){
        return "personal";
    }

    @RequestMapping("/culture")
    public String culture(){
        return "culture";
    }
}
