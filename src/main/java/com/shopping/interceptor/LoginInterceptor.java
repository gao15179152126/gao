package com.shopping.interceptor;

import com.shopping.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @ClassName LoginInterceptor
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/24 13:55
 * @Version 1.0
 **/
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        String requestURL = request.getRequestURI();
        if(requestURL.indexOf("/login")>=0||requestURL.indexOf("/regist")>=0||requestURL.indexOf("/doRegist")>=0||requestURL.indexOf("/checkLogin")>=0){
            return true;
        }
        HttpSession httpSession = request.getSession();
        User user = (User)httpSession.getAttribute("user");
        if (user != null){
            return true;
        }else {
            request.setAttribute("smg","您还没有登录");
            request.getRequestDispatcher("/user/login").forward(request,response);
            return false;
        }

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
