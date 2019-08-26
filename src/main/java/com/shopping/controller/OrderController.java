package com.shopping.controller;

import com.shopping.pojo.Order;
import com.shopping.pojo.OrderDetail;
import com.shopping.pojo.User;
import com.shopping.service.AddressService;
import com.shopping.service.OrderService;
import com.shopping.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    private final OrderService orderService;
    private final UserService userService;
    private final AddressService addressService;

    @Autowired
    public OrderController(OrderService orderService, UserService userService, AddressService addressService) {
        this.orderService = orderService;
        this.userService = userService;
        this.addressService = addressService;
    }

    /**
     * 提交订单
     */
    @RequestMapping("/submitOrder")
    @ResponseBody
    public Map submitOrder(@RequestBody List<OrderDetail> orderDetails, HttpSession session) {
        Map<String, String> map = new HashMap<>(1);
        String username = ((User) session.getAttribute("user")).getUsername();
        String userId = String.valueOf(((User) session.getAttribute("user")).getId());
        int vip = ((User) session.getAttribute("user")).getVip();
        //预设订单号
        String result = orderService.submitOrder(orderDetails, username, userId, vip);
        map.put("result", result);
        //todo 设置订单号值到Attribute
        return map;
    }

    /**
     * 查看个人订单
     */
    @RequestMapping("/myOrder")
    public String myOrder(HttpSession session, Model model) {
        String username = ((User) session.getAttribute("user")).getUsername();
        List<Order> personalOrderLists = orderService.viewPersonalOrder(username);
        List<String> userAddressLists = addressService.queryUserAddressByUsername(username);
        model.addAttribute("personalOrderLists", personalOrderLists);
        model.addAttribute("userAddressLists", userAddressLists);
        return "/personalOrder";
    }

    /**
     * 订单付款
     */
    @RequestMapping("/payForOrder")
    @ResponseBody
    public Map payForOrder(HttpSession session, String orderNo, String address) {
        Map<String, String> map = new HashMap<>(1);
        User user = (User) session.getAttribute("user");
        String result = orderService.payForOrder(orderNo, user, address);
        map.put("result", result);
        session.setAttribute("user", userService.updateUserInformation(user.getUsername()));
        return map;
    }

    /**
     * 取消订单
     */
    @RequestMapping("cancelOrder")
    @ResponseBody
    public String cancelOrder(String orderNo) {
        return orderService.cancelOrder(orderNo);
    }
}
