package com.shopping.controller;

import com.shopping.pojo.Cart;
import com.shopping.pojo.User;
import com.shopping.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    private final CartService cartService;

    @Autowired
    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    /**
     * 添加至购物车
     */
    @RequestMapping("/addCart")
    @ResponseBody
    public String addCart(HttpSession httpSession, int productId, int cartNumber) {
        String username = ((User) httpSession.getAttribute("user")).getUsername();
        cartService.addCart(username, productId, cartNumber);
        return "1";
    }

    /**
     * 添加购物车后再登录
     */
    @RequestMapping("/addCart1")
    public String addCart1(HttpSession httpSession, int productId, int cartNumber) {
        String username = ((User) httpSession.getAttribute("user")).getUsername();
        cartService.addCart(username, productId, cartNumber);
        return "redirect:/luckincoffee/shop";
    }

    /**
     * 查看购物车
     */
    @RequestMapping("/cartShow")
    public String cart(HttpSession httpSession, Model model) {
        User user = (User) httpSession.getAttribute("user");
        List<Cart> listCart = cartService.queryCart(user.getUsername());
        for (Cart cart : listCart) {
            cart.setProductName(cartService.getProductNameById(cart.getProductId()));
        }
        model.addAttribute("listCart", listCart);
        return "cart";
    }

    /**
     * 从购物车删除
     */
    @RequestMapping("/deleteCart")
    public String deleteCart(HttpSession httpSession, int productId) {
        User user = (User) httpSession.getAttribute("user");
        cartService.deleteCart(user.getUsername(), productId);
        return "redirect:cartShow";
    }

    /**
     * 购物车中单个商品增加
     */
    @RequestMapping("singleAdd")
    public String singleAdd(HttpSession httpSession, int productId) {
        String username = ((User) httpSession.getAttribute("user")).getUsername();
        cartService.cartProductNumberAdd(username, productId, 1);
        return "";
    }

    /**
     * 购物车中单个商品减少
     */
    @RequestMapping("singleDel")
    public String singleDel(HttpSession httpSession, int productId) {
        String username = ((User) httpSession.getAttribute("user")).getUsername();
        cartService.cartProductNumberAdd(username, productId, -1);
        return "";
    }
}
