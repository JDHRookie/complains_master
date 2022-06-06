package com.svtcc.service.Imp;

import com.svtcc.bean.AdminBean;
import com.svtcc.dao.AdminDao;
import com.svtcc.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("adminService")
public class AdminServiceImp implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public AdminBean selectAdmin(String username, String password) {
        return adminDao.selectAdmin(username,password);
    }

    @Override
    public ArrayList<AdminBean> selectAllAdmin() {
        return adminDao.selectAllAdmin();
    }

    @Override
    public ArrayList<AdminBean> selectAdminByName(String realname) {
        return adminDao.selectAdminByName(realname);
    }

    @Override
    public int insertAdmin(AdminBean adminBean) {
        return adminDao.insertAdmin(adminBean);
    }

    @Override
    public int deleteAdmin(int aid) {
        return adminDao.deleteAdmin(aid);
    }

    @Override
    public int updateAdminById(AdminBean adminBean) {
        return adminDao.updateAdminById(adminBean);
    }

    @Override
    public AdminBean selectAdminUserName(String username) {
        return adminDao.selectAdminUserName(username);
    }

    @Override
    public List<AdminBean> selectCommonAdmin() {
        return adminDao.selectCommonAdmin();
    }

    @Override
    public AdminBean selectAdminById(int aid) {
        return adminDao.selectAdminById(aid);
    }
}
