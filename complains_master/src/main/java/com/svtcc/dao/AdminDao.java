package com.svtcc.dao;

import com.svtcc.bean.AdminBean;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

public interface AdminDao {
    AdminBean selectAdmin(@Param("username") String username ,@Param("password") String password);

    ArrayList<AdminBean> selectAllAdmin();

    ArrayList<AdminBean> selectAdminByName(String realname);

    int insertAdmin(AdminBean adminBean);

    int deleteAdmin(int aid);

    int updateAdminById(AdminBean adminBean);

    AdminBean selectAdminUserName(String username);

    List<AdminBean> selectCommonAdmin();

    AdminBean selectAdminById(int aid);
}
