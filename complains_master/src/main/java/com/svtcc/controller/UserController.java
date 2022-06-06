package com.svtcc.controller;

import com.svtcc.bean.AdminBean;
import com.svtcc.bean.ComplainBean;
import com.svtcc.bean.HistoryBean;
import com.svtcc.service.ComplainService;
import com.svtcc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Controller("userController")
public class UserController {
    @Autowired
    private ComplainService complainService;

    @Autowired
    private UserService userService;


    @RequestMapping("/user")
    public String User(){

        return "user";
    }

    @RequestMapping("/user_complaininfo")
    public String User_Complaininfo(Model model, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        AdminBean adminBean=(AdminBean) request.getSession().getAttribute("adminBean");
        String contact=adminBean.getRealname();
        List<ComplainBean> complainHisList=userService.selectHisComplain(contact);
        model.addAttribute("complainHisList",complainHisList);

        return "user_complaininfo";
    }

    @RequestMapping("/user_select")
    public String UserComplain(Model model, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        AdminBean adminBean=(AdminBean) request.getSession().getAttribute("adminBean");
        String contact=adminBean.getRealname();
        ArrayList<ComplainBean> complainUserList=userService.selectUserComplain(contact);
        request.setAttribute("complainUserList",complainUserList);
        model.addAttribute("complainUserList",complainUserList);

        return "user_select";
    }
    @RequestMapping("/selectUserComplainByName")
    public String selectUserComplainByName(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        String income=request.getParameter("userComplain");
        ArrayList<ComplainBean> complainUserList2= userService.selectUserComplainByName(income);
        request.setAttribute("complainUserList2",complainUserList2);
        return "user_select";
    }

    //提交工单，更改工单状态
    @RequestMapping("/updateUserComplainStatus")
    public String updateUserComplainStatus(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        //这里需要id来更新工单状态，上一个更新工单状态不用id是因为那是对话框是一个表单提交
        int cid=Integer.parseInt(request.getParameter("cid"));
        //设置标志
        int flag12=userService.updateUserComplainStatus(cid);
        session.setAttribute("flag12",flag12);

        return "redirect:user_select";
    }
    //删除历史工单信息
    @RequestMapping("/deleteUserHisComplain")
    public String deleteUserHisComplain(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        int cid=Integer.parseInt(request.getParameter("cid"));
        int flag13=userService.deleteHisComplain(cid);
        session.setAttribute("flag13",flag13);

        return "redirect:user_complaininfo";
    }

}
