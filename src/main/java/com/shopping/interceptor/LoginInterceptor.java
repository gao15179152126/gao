package com.shopping.interceptor;

import com.shopping.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @ClassName LoginInterceptor
 * @Description 用户拦截器
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/24 13:55
 * @Version 1.0
 **/
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        String requestUrl = request.getRequestURI();
        String addCart = "/cart/addCart";
        HttpSession session = request.getSession();
        if (addCart.equals(requestUrl)){
            session.setAttribute("productId", request.getParameter("productId"));
            session.setAttribute("cartNumber", request.getParameter("cartNumber"));
        }
        User user = (User)session.getAttribute("user");
        if (user != null){
            return true;
        }else {
            session.setAttribute("url",requestUrl);
            request.setAttribute("msg","您还没有登录");
            request.getRequestDispatcher("/user/login").forward(request,response);
            return false;
        }

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {

    }
}
