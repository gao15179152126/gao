package com.shopping.controller;

import com.shopping.pojo.User;
import com.shopping.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName UserController
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/23 11:01
 * @Version 1.0
 **/

@Controller
@RequestMapping("/user")
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    /**
     * 检查用户名是否存在
     */
    @RequestMapping("/checkUsername")
    @ResponseBody
    public Map checkUsername(String username) {
        //map集合用来存放返回值
        Map<String, String> map = new HashMap<>(1);
        if (userService.checkUsername(username) > 0) {
            map.put("result", "1");
        } else {
            map.put("result", "0");
        }
        return map;
    }

    /**
     * 新用户注册
     */
    @RequestMapping("/register")
    public String register(User user, MultipartFile file, Model model) {
        String msg = userService.register(user, file);
        model.addAttribute("msg", msg);
        return "/login";
    }

    /**
     * 正常访问login页面
     */
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    /**
     * 登录验证
     */
    @RequestMapping("/checkLogin")
    public String checkLogin(String username, String password, Model model, HttpSession session) {
        String result = userService.checkLogin(username, password);
        String url = (String) session.getAttribute("url");
        String addCart = "/cart/addCart";
        String success = "登录成功";
        if (success.equals(result)) {
            User user = userService.updateUserInformation(username);
            session.setAttribute("user", user);
            if ("".equals(url) || url == null) {
                return "redirect:/luckincoffee/shop";
            } else {
                if (addCart.equals(url)) {
                    String productId = String.valueOf(session.getAttribute("productId"));
                    String cartNumber = String.valueOf(session.getAttribute("cartNumber"));
                    session.removeAttribute("productId");
                    session.removeAttribute("cartNumber");
                    session.removeAttribute("url");
                    return "redirect:" + url + "1?productId=" + productId + "&cartNumber=" + cartNumber;
                }
                session.removeAttribute("url");
                return "redirect:" + url;
            }
        } else {
            model.addAttribute("msg", result);
            return "login";
        }
    }

    /**
     * 注销方法
     */
    @RequestMapping("/outLogin")
    public String outLogin(HttpSession session) {
        //注销当前的session
        session.invalidate();
        return "redirect:login";
    }

    /**
     * 个人信息界面
     */
    @RequestMapping("/personal")
    public String personal() {
        return "personal";
    }

    /**
     * 检查旧密码是否正确
     */
    @RequestMapping("checkPassword")
    @ResponseBody
    public Map checkPassword(String password, HttpSession session) {
        //map集合用来存放返回值
        Map<String, String> map = new HashMap<>(1);
        String username = ((User) session.getAttribute("user")).getUsername();
        String result = userService.checkOldPassword(username, password);
        map.put("result", result);
        return map;
    }

    /**
     * 修改用户密码
     */
    @RequestMapping("changePassword")
    @ResponseBody
    public Map changePassword(String password, HttpSession session) {
        String username = ((User) session.getAttribute("user")).getUsername();
        Map<String, Integer> map = new HashMap<>(1);
        map.put("result", userService.changePassword(username, password));
        session.setAttribute("user", userService.updateUserInformation(username));
        return map;
    }

    /**
     * 用户充值金额
     */
    @RequestMapping("investMoney")
    @ResponseBody
    public Map investMoney(double money, HttpSession session) {
        int id = ((User) session.getAttribute("user")).getId();
        Map<String, Integer> map = new HashMap<>(1);
        map.put("result", userService.investMoney(id, money));
        session.setAttribute("user", userService.updateUserInformationById(id));
        return map;
    }

    /**
     * 用户升级vip
     */
    @RequestMapping("upgradeVip")
    @ResponseBody
    public Map upgradeVip(HttpSession session) {
        int id = ((User) session.getAttribute("user")).getId();
        Map<String, String> map = new HashMap<>(1);
        map.put("result", userService.addUserVip(id));
        session.setAttribute("user", userService.updateUserInformationById(id));
        return map;
    }
}
