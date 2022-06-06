package com.svtcc.controller;
import com.github.pagehelper.PageInfo;
import com.svtcc.bean.AdminBean;
import com.svtcc.bean.ComplainBean;
import com.svtcc.bean.TypeBean;
import com.svtcc.service.AdminService;
import com.svtcc.service.ComplainService;
import com.svtcc.service.HistoryService;
import com.svtcc.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Controller("complainController")
public class ComplainController {
    @Autowired
    private ComplainService complainService;
    @Autowired
    private TypeService typeService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private HistoryService historyService;



    @RequestMapping("/admin_complain")
    public String admin_Complain(Model model,HttpServletRequest request, @RequestParam(name = "page",required = true,defaultValue = "1") int page,@RequestParam(name = "size",required = true,defaultValue = "5") int size) throws UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");
        ArrayList<ComplainBean> complainList=complainService.selectAll(page,size);
        ModelAndView mv=new ModelAndView();
        List<TypeBean> typeList=typeService.selectAllType();
        List<AdminBean> commonAdminList= adminService.selectCommonAdmin();
        PageInfo pageInfo=new PageInfo(complainList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("order-page-list");
        model.addAttribute("commonAdminList",commonAdminList);
        model.addAttribute("typeList",typeList);
        model.addAttribute("complainList",complainList);
        request.setAttribute("complainList",complainList);
        return "admin_complain";
    }


    @RequestMapping("admin_complaintype")
    public String admin_ComplainType(Model model){
        List<TypeBean> typeList=typeService.selectAllType();

        model.addAttribute("typeList",typeList);
        return "admin_complaintype";
    }

    @RequestMapping("addComplains")
    public String addComplains(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String income=request.getParameter("income");
//        String contact=request.getParameter("contact");
//        String tel=request.getParameter("tel");
        String type=request.getParameter("type");
        String content=request.getParameter("content");
        String number=request.getParameter("complainNumber");

        int flag=complainService.addComplains(income,type,content,number);
        session.setAttribute("flag",flag);
        System.out.println(flag);

        return "redirect:admin_complain";
    }

    //删除工单
    @RequestMapping("deleteComplains")
    public String deleteComplains(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        //前端请求通过location.href请求得到id值
        int cid=Integer.parseInt(request.getParameter("cid"));
        //先通过id查询表中数据，拿到数据后，放进新的对象当中
        ComplainBean complainBean=complainService.selectComplainById(cid);
        //拿到数据后直接项历史表中插入，然后再执行删除操作
        int flag16=historyService.addHisComplains(complainBean);
        System.out.println(flag16);
        int flag2=complainService.deleteComplainsById(cid);
        //设置提示
        session.setAttribute("flag2",flag2);
        return "redirect:admin_complain";
    }

    //修改工单
    @RequestMapping("/updateComplainsById")
    public String updateComplainsById(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws UnsupportedEncodingException {
        System.out.println(1);
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        String complainNum=request.getParameter("complainNum");
        System.out.println(complainNum);
        String complainIncome=request.getParameter("complainIncome");
        String complainType=request.getParameter("complainType");
        String complainContact=request.getParameter("complainContact");
        String complainTel=request.getParameter("complainTel");
        String complainContent=request.getParameter("complainContent");
        System.out.println(complainContent);
        int complainId=Integer.parseInt(request.getParameter("complainId"));
        System.out.println(complainId);

        ComplainBean complainBean = new ComplainBean(complainId,complainIncome,complainContact,complainTel,complainType,complainContent,complainNum);
        int flag3=complainService.updateComplainsById(complainBean);
        System.out.println(2);
        System.out.println(flag3);
        //设置提示
        session.setAttribute("flag3",flag3);
        return "redirect:admin_complain";
    }

    //查询功能
    @RequestMapping("/selectComplainsBySth")
    public String selectComplainsBySth(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String complainSth=request.getParameter("complainSth");
        ArrayList<ComplainBean> complainList2=complainService.selectComplainsBySth(complainSth);
        request.setAttribute("complainList2",complainList2);
        System.out.println("是否有数据");
        System.out.println(complainList2.size());

        return "admin_complain";
    }


    //派发工单功能
    @RequestMapping("/sendComplainsByName")
    public String sendComplainsByName(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

//        String complainNum=request.getParameter("complainNum1");
//        String complainIncome=request.getParameter("complainIncome1");
//        String complainType=request.getParameter("complainType1");
        String complainContact=request.getParameter("complainContact1");
        System.out.println(complainContact);
        String complainTel=request.getParameter("complainTel1");
//        String complainContent=request.getParameter("complainContent1");
        int complainId=Integer.parseInt(request.getParameter("sendcomplainId"));
        ComplainBean complainBean = new ComplainBean();
        complainBean.setContact(complainContact);
        complainBean.setTel(complainTel);
        complainBean.setCid(complainId);
        int flag11=complainService.updateComplainsById(complainBean);//选择派发的人员，更新信息
        int isUpdate=complainService.updateComplainStatus();//更新工单的状态
        System.out.println(isUpdate);
        //设置提示
        session.setAttribute("flag11",flag11);
        return "redirect:admin_complain";
    }
}
