package com.svtcc.service;

import com.svtcc.bean.ComplainBean;
import com.svtcc.bean.HistoryBean;

import java.util.List;

public interface HistoryService {

    int addHisComplains(ComplainBean complainBean);

    List<HistoryBean> selectAllHistoryData();

    int deleteHistoryData(int hid);
}
