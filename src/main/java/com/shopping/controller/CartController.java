package com.shopping.controller;

import com.shopping.pojo.Cart;
import com.shopping.pojo.User;
import com.shopping.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @ClassName OrderController
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/31 19:34
 * @Version 1.0
 **/
@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    /**
     * 添加至购物车
     */
    @RequestMapping("/addCart")
    public String addCart(String username, int productId){
        cartService.addCart(username,productId);
        return "redirect:cartShow";
    }

    /**
     * 查看购物车
     */
    @RequestMapping("/cartShow")
    public String cart(HttpSession httpSession, Model model){
        User user = (User) httpSession.getAttribute("user");
        List<Cart> listCart=cartService.queryCart(user.getUsername());
        for (Cart cart:listCart){
            cart.setProductName(cartService.getProductNameById(cart.getProductId()));
        }
        model.addAttribute("listCart",listCart);
        return "cart";
    }

    /**
     * 从购物车删除
     */
    @RequestMapping("/deleteCart")
    public String deleteCart(String username, int productId){
        cartService.deleteCart(username,productId);
        return "redirect:cartShow";
    }
}
