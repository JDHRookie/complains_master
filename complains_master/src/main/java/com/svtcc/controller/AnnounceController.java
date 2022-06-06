package com.svtcc.controller;

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
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller("announceController")
public class AnnounceController {
    @Autowired
    private AnnounceService announceService;


    @RequestMapping("admin_complaininfo")
    public String admin_ComplainInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        List<AnnounceBean> announceBeanList=announceService.selectAllAnnounce();
        model.addAttribute("announceBeanList",announceBeanList);
        return "admin_complaininfo";
    }

    @RequestMapping("user_history")
    public String user_history(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        List<AnnounceBean> announceUserList=announceService.selectAllAnnounce();
        model.addAttribute("announceUserList",announceUserList);
        return "user_history";

    }



    @RequestMapping("/addAnnounce")
    public String addAnnounce(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        String title=request.getParameter("annotitle");
        String content=request.getParameter("annocontent");
        //获取当前时间
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time= sdf.format(System.currentTimeMillis());
        AnnounceBean announceBean = new AnnounceBean(title,content,time);
        int flag18=announceService.addAnnounce(announceBean);
        session.setAttribute("flag18",flag18);

        return "redirect:admin_complaininfo";
    }
    @RequestMapping("/deleteAnnounce")
    public String deleteAnnounce(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        int mid=Integer.parseInt(request.getParameter("mid"));
        int flag19=announceService.deleteAnnounce(mid);
        session.setAttribute("flag19",flag19);

        return "redirect:admin_complaininfo";
    }

    @RequestMapping("/updateAnnounce")
    public String updateAnnounce(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        int mid=Integer.parseInt(request.getParameter("annoId"));
        String title = request.getParameter("upannotitle");
        String content=request.getParameter("upannocontent");
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time= sdf.format(System.currentTimeMillis());
        System.out.println("查看是否有数据.....................");
        System.out.println(title);
        System.out.println(content);
        AnnounceBean announceBean=new AnnounceBean();
        announceBean.setTitle(title);
        announceBean.setContent(content);
        announceBean.setAnnouncetime(time);
        announceBean.setMid(mid);
        int flag20=announceService.updateAnnounce(announceBean);
        session.setAttribute("flag20",flag20);

        return "redirect:admin_complaininfo";
    }

}
