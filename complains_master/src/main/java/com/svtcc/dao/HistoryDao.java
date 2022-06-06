package com.svtcc.dao;

import com.svtcc.bean.ComplainBean;
import com.svtcc.bean.HistoryBean;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HistoryDao {
    int addHistoryData(ComplainBean complainBean);

    List<HistoryBean> selectAllHistoryData();

    int deleteHistoryData(int hid);
}
