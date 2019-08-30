package com.shopping.controller;

import com.shopping.pojo.Coupon;
import com.shopping.pojo.User;
import com.shopping.service.CouponService;
import com.shopping.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName CouponController
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/28 13:48
 * @Version 1.0
 **/
@Controller
@RequestMapping("/coupon")
public class CouponController {

    private final CouponService couponService;
    private final OrderService orderService;

    @Autowired
    public CouponController(CouponService couponService, OrderService orderService) {
        this.couponService = couponService;
        this.orderService = orderService;
    }

    /**
     * 优惠券分享页
     */
    @RequestMapping("/toShare")
    public String toShare(String orderNo, Model model) {
        String orderStatus = orderService.getOrderStatusByOrderNo(orderNo);
        if ("未完成".equals(orderStatus) || "已取消".equals(orderStatus) || "".equals(orderStatus) || orderStatus == null) {
            return "../common/error";
        }
        model.addAttribute("orderNo", orderNo);
        List<Coupon> coupons = couponService.getOrderCouponByOrderNo(orderNo);
        model.addAttribute("coupons", coupons);
        return "sharingCoupons";
    }

    /**
     * 领取优惠券
     */
    @RequestMapping("getCoupon")
    @ResponseBody
    public Map getCoupon(String orderNo, String username) {
        Map<String, String> map = new HashMap<>(1);
        String result = couponService.getCouponByOrderNoAndUsername(orderNo, username);
        map.put("result", result);
        return map;
    }

    /**
     * 查看用户所拥有的优惠券
     */
    @RequestMapping("viewUserCoupon")
    @ResponseBody
    public Map viewUserCoupon(HttpSession session) {
        String username = ((User) session.getAttribute("user")).getUsername();
        Map<String, List<String>> map = new HashMap<>(1);
        map.put("couponResult", couponService.getCouponNameByUsername(username));
        return map;
    }

    /**
     * 通过优惠券Id获取折扣
     */
    @RequestMapping("getDiscount")
    @ResponseBody
    public Map getDiscountByCouponId(int couponId, String orderNo) {
        Map<String, String> map = new HashMap<>(2);
        map.put("orderMoney", String.valueOf(orderService.getOrderMoneyByOrderNo(orderNo)));
        map.put("discount", String.valueOf(couponService.getDiscountByCouponId(couponId)));
        return map;
    }
}
