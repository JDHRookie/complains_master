package com.svtcc.controller;

import com.svtcc.bean.AdminBean;
import com.svtcc.bean.AnnounceBean;
import com.svtcc.service.AdminService;
import com.svtcc.service.AnnounceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Controller("adminController")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @Autowired
    private AnnounceService announceService;

    @RequestMapping("admin_user")
    public String admin_User(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        ArrayList<AdminBean> adminList=adminService.selectAllAdmin();

        request.setAttribute("adminList",adminList);

        return "admin_user";
    }

    @RequestMapping("/selectAdminByName")
    public String selectAdminByName(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String realname=request.getParameter("AdminName");
        ArrayList<AdminBean> adminList2=adminService.selectAdminByName(realname);
        System.out.println("是否有用户信息");
        System.out.println(adminList2.size());
        request.setAttribute("adminList2",adminList2);

        return "admin_user";
    }

    @RequestMapping(value = "login",method = RequestMethod.GET)
    public String Login_GET(){

        return "login";
    }
    @RequestMapping(value = "login",method = RequestMethod.POST)
    public String Login_POST(Model model, javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");

        String username=request.getParameter("username");
        String password=request.getParameter("password");


        AdminBean adminBean=adminService.selectAdmin(username,password);
        int aid= adminBean.getAid();
        if (adminBean!=null){
            request.getSession().setAttribute("adminBean",adminBean);
            request.getSession().setAttribute("aid",aid);
            if (adminBean.getStatus()==1){
                return "redirect:user";
            }else {
                return "redirect:admin";
            }
        }else{
            request.getSession().setAttribute("result",-1);
            return "login";
        }

    }
    @RequestMapping("admin")
    public String toAdmin(){

        return "admin";
    }


    @RequestMapping(value = "login_out",method = RequestMethod.GET)
    public String LoginOut(HttpServletRequest request){
        try{
            HttpSession session=request.getSession();
            //销毁session
            session.invalidate();
            return "forward:login";
        }
        catch (Exception e){
            e.printStackTrace();
            request.setAttribute("msg","系统错误");
            return "forward:login";
        }
    }

    @RequestMapping("deleteAdmin")
    public String deleteAdmin(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        int aid=Integer.parseInt(request.getParameter("aid"));
        int flag7=adminService.deleteAdmin(aid);
        session.setAttribute("flag7",flag7);

        return "redirect:admin_user";
    }

    @RequestMapping("addAdmin")
    public String addAdmin(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String username=request.getParameter("addusername");
        String realname=request.getParameter("addrealname");
        String password=request.getParameter("addpassword");
        String tel=request.getParameter("addtel");
        String email=request.getParameter("addemail");
        AdminBean adminBean  = new AdminBean(username,realname,password,email,tel);
        AdminBean isAdmin = adminService.selectAdminUserName(username);
        session.setAttribute("isAdmin",isAdmin);
        if (isAdmin !=null){
            int flag10=0;
            session.setAttribute("flag10",flag10);
            return "redirect:admin_user";
        }
        int flag8=adminService.insertAdmin(adminBean);
        session.setAttribute("flag8",flag8);
        return "redirect:admin_user";
    }
    @RequestMapping("updateAdminById")
    public String updataAdminById(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        String username=request.getParameter("updateusername");
        String realname=request.getParameter("updaterealname");
        String passwoord=request.getParameter("updatepassword");
        String tel=request.getParameter("updatephone");
        String email=request.getParameter("updateemail");
        int aid=Integer.parseInt(request.getParameter("aid"));
        AdminBean adminBean=new AdminBean();
        adminBean.setAid(aid);
        adminBean.setUsername(username);
        adminBean.setRealname(realname);
        adminBean.setPassword(passwoord);
        adminBean.setTel(tel);
        adminBean.setEmail(email);
        int flag9=adminService.updateAdminById(adminBean);
        session.setAttribute("flag9",flag9);
        return "redirect:admin_user";
    }
    @RequestMapping("/updataInfo")
    public String updataInfo(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        String realname=request.getParameter("realname");
        String tel=request.getParameter("tel");
        String emainl=request.getParameter("email");
        int aid=Integer.parseInt(String.valueOf(request.getSession().getAttribute("aid")));
        AdminBean adminBean=new AdminBean();
        adminBean.setRealname(realname);
        adminBean.setTel(tel);
        adminBean.setEmail(emainl);
        adminBean.setAid(aid);

        int flaguserinfo=adminService.updateAdminById(adminBean);
        request.getSession().setAttribute("adminBean",adminBean);
        session.setAttribute("flaguserinfo",flaguserinfo);

        return "redirect:user";
    }
    @RequestMapping("/updatePassword")
    public String updatePassword(Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String oldPassword= request.getParameter("oldpassword");
        String newPassword=request.getParameter("newpassword");
        int aid=Integer.parseInt(String.valueOf(request.getSession().getAttribute("aid")));
        AdminBean newadmin=new AdminBean();
        AdminBean oldadmin = adminService.selectAdminById(aid);
        newadmin.setPassword(newPassword);
        newadmin.setAid(aid);
        if (newPassword.equals(oldadmin.getPassword())){
            System.out.println("不得与原密码相同!");
        }
        int flaginfo2=adminService.updateAdminById(newadmin);
        session.setAttribute("flaginfo2",flaginfo2);
        model.addAttribute("flaginfo2",flaginfo2);
        return "redirect:user";
    }

}
