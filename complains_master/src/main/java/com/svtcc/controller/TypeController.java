package com.svtcc.controller;

import com.svtcc.bean.TypeBean;
import com.svtcc.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;

@Controller("typeController")
public class TypeController {
    @Autowired
    private TypeService typeService;

    @RequestMapping("/addComplainType")
    public String addComplainType(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String typename=request.getParameter("complainTypeName");
        int flag4= typeService.insertType(typename);
        session.setAttribute("flag4",flag4);

        return "redirect:admin_complaintype";
    }

    @RequestMapping("/deleteComplainType")
    public String deleteComplainType(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        int tid=Integer.parseInt(request.getParameter("tid"));
        int flag5=typeService.deleteType(tid);
        session.setAttribute("flag5",flag5);

        return "redirect:admin_complaintype";
    }

    @RequestMapping("/updataComplainType")
    public String updataComplainType(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws UnsupportedEncodingException{
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        int tid=Integer.parseInt(request.getParameter("tid"));
        String typename=request.getParameter("typename");

        TypeBean typeBean=new TypeBean(tid,typename);
        int flag6= typeService.updataType(typeBean);
        session.setAttribute("flag6",flag6);
        return "redirect:admin_complaintype";
    }
}
