package com.svtcc.controller;

import com.svtcc.bean.HistoryBean;
import com.svtcc.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;
@Controller("historyController")
public class HistoryController {
    @Autowired
    private HistoryService historyService;


    @RequestMapping("/admin_history")
    public String selectAllHistoryData(Model model, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        List<HistoryBean> historyBeanList=historyService.selectAllHistoryData();
        model.addAttribute("historyList",historyBeanList);

        return "admin_history";
    }

    @RequestMapping("/deleteHistoryData")
    public String deleteHistoryData(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        int hid=Integer.parseInt(request.getParameter("hid"));
        int flag17=historyService.deleteHistoryData(hid);
        session.setAttribute("flag17",flag17);

        return "redirect:admin_history";
    }
}
