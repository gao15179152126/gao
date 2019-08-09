package com.shopping.controller;

import com.shopping.pojo.Order;
import com.shopping.pojo.User;
import com.shopping.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @ClassName OrderController
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/5 10:26
 * @Version 1.0
 **/
@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    /**
     * 提交订单
     */
    @RequestMapping("/submitOrder")
    public String submitOrder(@RequestBody List<Order> orderList){
        orderService.generateOrder(orderList);
        return "redirect:myOrder";
    }

    /**
     * 查看个人订单
     */
    @RequestMapping("/myOrder")
    public String myOrder(HttpSession session, Model model){
        User user = (User) session.getAttribute("user");
        List<Order> listOrder = orderService.viewPersonalOrder(user.getUsername());
        model.addAttribute("listOrder",listOrder);
        return "/myorder";
    }
}
