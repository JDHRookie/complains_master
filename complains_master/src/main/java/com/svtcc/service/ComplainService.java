package com.svtcc.service;

import com.svtcc.bean.ComplainBean;

import java.util.ArrayList;
import java.util.List;

public interface ComplainService {
    ArrayList<ComplainBean> selectAll(int page,int size);

    ComplainBean selectComplainByName(String type);

    int addComplains(String income,String type,String content,String number);

    int deleteComplainsById(int cid);

    int updateComplainsById(ComplainBean complainBean);

    int updateComplainStatus();

    ComplainBean selectComplainById(int cid);


    ArrayList<ComplainBean> selectComplainsBySth(String contact);
}
