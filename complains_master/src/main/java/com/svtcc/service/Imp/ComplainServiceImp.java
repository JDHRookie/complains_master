package com.svtcc.service.Imp;

import com.github.pagehelper.PageHelper;
import com.svtcc.bean.ComplainBean;
import com.svtcc.dao.ComplainDao;
import com.svtcc.service.ComplainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("complainService")
public class ComplainServiceImp implements ComplainService {
    @Autowired
    private ComplainDao complainDao;

    @Override
    public ArrayList<ComplainBean> selectAll(int page,int size) {
        PageHelper.startPage(page, size);
        return complainDao.selectAll();
    }

    @Override
    public ComplainBean selectComplainByName(String type) {
        return complainDao.selectComplainByName(type);
    }

    @Override
    public int addComplains(String income,  String type, String content,String number) {
        return complainDao.addComplains(income,type,content,number);
    }

    @Override
    public int deleteComplainsById(int cid) {
        return complainDao.deleteComplainsById(cid);
    }

    @Override
    public int updateComplainsById(ComplainBean complainBean) {
        return complainDao.updateComplainsById(complainBean);
    }

    @Override
    public int updateComplainStatus() {
        return complainDao.updateComplainStatus();
    }

    @Override
    public ComplainBean selectComplainById(int cid) {
        return complainDao.selectComplainById(cid);
    }

    @Override
    public ArrayList<ComplainBean> selectComplainsBySth(String contact) {
        return complainDao.selectComplainsBySth(contact);
    }

}
