package com.svtcc.service;

import com.svtcc.bean.ComplainBean;

import java.util.ArrayList;
import java.util.List;

public interface UserService {
    ArrayList<ComplainBean> selectUserComplain(String contact);

    ArrayList<ComplainBean> selectUserComplainByName(String income);

    int updateUserComplainStatus(int cid);

    List<ComplainBean> selectHisComplain(String contact);

    int deleteHisComplain(int cid);
}
