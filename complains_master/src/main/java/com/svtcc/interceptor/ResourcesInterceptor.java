package com.svtcc.interceptor;

import com.svtcc.bean.AdminBean;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ResourcesInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        AdminBean adminBean=(AdminBean) request.getSession().getAttribute("adminBean");

        //获取请求的路径
        String uri =request.getRequestURI();
        if (adminBean!=null){
            return true;
        }
        //用户登录的相关请求，放行
        if (uri.indexOf("login")>=0){
            return true;
        }

        request.setAttribute("msg","你还没有登录,请先登录!");
        request.getRequestDispatcher("login").forward(request,response);
        return false;
    }
}
