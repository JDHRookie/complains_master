package com.svtcc.service;

import com.svtcc.bean.AdminBean;

import java.util.ArrayList;
import java.util.List;

public interface AdminService {
    AdminBean selectAdmin(String username,String password);

    ArrayList<AdminBean> selectAllAdmin();

    ArrayList<AdminBean> selectAdminByName(String realname);

    int insertAdmin(AdminBean adminBean);

    int deleteAdmin(int aid);

    int updateAdminById(AdminBean adminBean);

    AdminBean selectAdminUserName(String username);

    List<AdminBean> selectCommonAdmin();

    AdminBean selectAdminById(int aid);
}
