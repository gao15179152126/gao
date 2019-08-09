package com.shopping.controller;

import com.shopping.pojo.User;
import com.shopping.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;

/**
 * @ClassName UserController
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/23 11:01
 * @Version 1.0
 **/

@Controller
@RequestMapping("/user")

//这里用了@SessionAttributes，可以直接把model中的user(也就key)放入其中
//这样保证了session中存在user这个对象
@SessionAttributes("user")

public class UserController {

    @Autowired
    private UserService userService;

    /**
     *正常访问login页面
     */
    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    /**
     *数据库检查用户是否正确
     */
    @RequestMapping("/checkLogin")
    public String checkLogin(User user,Model model){
        user = userService.checkLogin(user.getUsername(), user.getPassword());
        //若有user则添加到model里并且跳转到成功页面
        if(user != null){
            model.addAttribute("user",user);
            return "redirect:../product/shopShow";
        }
        return "/WEB-INF/test/fail.jsp";
    }

    /**
     *测试超链接跳转到另一个页面是否可以取到session值
     */
    @RequestMapping("/anotherpage")
    public String hrefpage(){

        return "../test/anotherpage";
    }

    /**
     *注销方法
     */
    @RequestMapping("/outLogin")
    public String outLogin(HttpSession session, SessionStatus sessionStatus){
        //通过session.invalidata()方法来注销当前的session
        session.invalidate();
        sessionStatus.setComplete();
        return "redirect:login";
    }

    /**
     *注册页面
     */
    @RequestMapping("/regist")
    public String regist(){
        return "regist";
    }

    /**
     *注册
     */
    @RequestMapping("/doRegist")
    public String doRegist(User user, Model model){
        System.out.println(user.getUsername());
        userService.regist(user);
        return "../test/success";
    }

    /**
     *个人信息界面
     */
    @RequestMapping("/personal")
    public String personal(){
        return "personal";
    }

}
