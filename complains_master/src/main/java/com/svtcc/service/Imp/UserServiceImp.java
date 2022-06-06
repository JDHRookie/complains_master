package com.svtcc.service.Imp;

import com.svtcc.bean.ComplainBean;
import com.svtcc.dao.UserDao;
import com.svtcc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("userService")
public class UserServiceImp implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public ArrayList<ComplainBean> selectUserComplain(String contact) {
        return userDao.selectUserComplain(contact);
    }

    @Override
    public ArrayList<ComplainBean> selectUserComplainByName(String income) {
        return userDao.selectUserComplainByName(income);
    }

    @Override
    public int updateUserComplainStatus(int cid) {
        return userDao.updateUserComplainStatus(cid);
    }

    @Override
    public List<ComplainBean> selectHisComplain(String contact) {
        return userDao.selectHisComplain(contact);
    }

    @Override
    public int deleteHisComplain(int cid) {
        return userDao.deleteHisComplain(cid);
    }
}
