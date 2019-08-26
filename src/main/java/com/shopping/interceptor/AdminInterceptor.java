package com.shopping.interceptor;

import com.shopping.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @ClassName AdminInterceptor
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/21 16:41
 * @Version 1.0
 **/
public class AdminInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String userStatus = user.getUserStatus();
        String status = "管理员";
        if (status.equals(userStatus)){
            return true;
        }else {
            request.setAttribute("msg","您还没有管理权限");
            request.getRequestDispatcher("/user/login").forward(request,response);
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView){

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e){

    }
}
