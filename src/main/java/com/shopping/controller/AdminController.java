package com.shopping.controller;

import com.shopping.pojo.Order;
import com.shopping.pojo.OrderDetail;
import com.shopping.pojo.Product;
import com.shopping.pojo.User;
import com.shopping.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @ClassName AdminController
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/15 12:14
 * @Version 1.0
 **/
@Controller
@RequestMapping("/admin")
public class AdminController {

    private final AdminService adminService;

    @Autowired
    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    /**
     * 用户管理
     */
    @RequestMapping("userManagement")
    public String userManagement(String page, String queryUsername, Model model) {
        int queryPage = 1;
        int totalPage;
        List<User> users;
        if (!"".equals(page) && page != null) {
            queryPage = Integer.valueOf(page);
        }
        if ("".equals(queryUsername) || queryUsername == null) {
            totalPage = adminService.countPage();
            users = adminService.pagedQueryUserByPage(queryPage);
        } else {
            totalPage = adminService.countPageByName(queryUsername);
            users = adminService.pagedQueryUserByPageAndName(queryPage, queryUsername);
        }
        model.addAttribute("queryUsername", queryUsername);
        model.addAttribute("currentPage", queryPage);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("users", users);
        return "admin/user";
    }

    /**
     * 改变用户状态
     */
    @RequestMapping("changeUserStatus")
    @ResponseBody
    public Map changeUserStatus(int id, String status) {
        Map<String, Integer> map = new HashMap<>(1);
        map.put("result", adminService.changeUserStatus(id, status));
        return map;
    }

    /**
     * 清除积分
     */
    @RequestMapping("clearPoint")
    @ResponseBody
    public Map clearPoint(int id) {
        Map<String, Integer> map = new HashMap<>(1);
        map.put("result", adminService.clearUserPoint(id));
        return map;
    }

    /**
     * 商品库存管理
     */
    @RequestMapping("storehouse")
    public String storehouse(String type, Model model) {
        List<Product> products;
        if ("".equals(type) || type == null) {
            products = adminService.queryProductByType("大师咖啡");
        } else {
            products = adminService.queryProductByType(type);
        }
        model.addAttribute("products", products);
        return "admin/storehouse";
    }

    /**
     * 设置库存数量
     */
    @RequestMapping("setProductNumber")
    @ResponseBody
    public Map setProductNumber(int productId, int productNumber) {
        Map<String, Integer> map = new HashMap<>(1);
        map.put("result", adminService.setProductNumberById(productId, productNumber));
        return map;
    }

    /**
     * 设置商品价格
     */
    @RequestMapping("setProductPrice")
    @ResponseBody
    public Map setProductPrice(int productId, double productPrice) {
        Map<String, Integer> map = new HashMap<>(1);
        map.put("result", adminService.setProductPriceById(productId, productPrice));
        return map;
    }

    /**
     * 设置商品名称
     */
    @RequestMapping("setProductName")
    @ResponseBody
    public Map setProductName(int productId, String productName) {
        Map<String, Integer> map = new HashMap<>(1);
        map.put("result", adminService.setProductNameById(productId, productName));
        return map;
    }

    /**
     * 修改商品图片
     */
    @RequestMapping("updateProductImage")
    @ResponseBody
    public Map updateProductImage(int productId, MultipartFile file) throws Exception {
        Map<String, Integer> map = new HashMap<>(1);
        map.put("result", adminService.updateProductImageById(productId, file));
        return map;
    }

    /**
     * 获得商品图片
     */
    @RequestMapping("getProductImage")
    @ResponseBody
    public Map getProductImage(int id) {
        Map<String, String> map = new HashMap<>(1);
        map.put("productImage", adminService.getProductImageById(id));
        return map;
    }

    /**
     * 上架商品
     */
    @RequestMapping("newGoods")
    public String newGoods() {
        return "admin/newGoods";
    }

    /**
     * 订单处理查询
     */
    @RequestMapping("orderHandle")
    public String orderHandle(Model model) {
        String status = "已付款";
        model.addAttribute("statusOrders", adminService.queryOrderByStatus(status));
        return "admin/orderHandle";
    }

    /**
     * 完成已付款订单
     */
    @RequestMapping("finishOrder")
    public String finishOrder(String orderNo) {
        adminService.finishOrder(orderNo);
        return "redirect:orderHandle";
    }

    /**
     * 按时间查询订单（默认当日）
     */
    @RequestMapping("orderFind")
    public String orderFind(String start, String end, Model model) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate = null;
        if ("".equals(start) || "".equals(end) || end == null || start == null) {
            //获取当前时间
            long nowTime = System.currentTimeMillis();
            //获取当前日期0点时间
            long todayStartTime = nowTime - (nowTime + TimeZone.getDefault().getRawOffset()) % (1000 * 3600 * 24);
            endDate = new Date(nowTime);
            startDate = new Date(todayStartTime);

        } else {
            try {
                startDate = format.parse(start);
                endDate = format.parse(end);
                model.addAttribute("startDate", start);
                model.addAttribute("endDate", end);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        List<Order> dateOrders = adminService.queryOrderByDate(startDate, endDate);
        double sum = 0;
        for (Order dateOrder : dateOrders) {
            sum += dateOrder.getOrderMoney();
        }
        String totalPrice = String.format("%.2f", sum);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("dateOrders", dateOrders);
        return "admin/orderFind";
    }

    /**
     * 通过订单号查询订单
     */
    @RequestMapping("orderFindByNo")
    @ResponseBody
    public Map orderFindByNo(String no) {
        Map<String, Order> map = new HashMap<>(1);
        Order noOrder = adminService.queryOrderByNo(no);
        noOrder.setOrderDetails(adminService.queryOrderDetailByNo(no));
        map.put("result", noOrder);
        return map;
    }

    /**
     * 获取订单内容
     */
    @RequestMapping("orderDetails")
    @ResponseBody
    public Map orderDetails(String no) {
        Map<String, List<OrderDetail>> map = new HashMap<>(1);
        List<OrderDetail> orderDetails = adminService.queryOrderDetailByNo(no);
        map.put("result", orderDetails);
        return map;
    }
}
