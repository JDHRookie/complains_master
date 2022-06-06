package com.svtcc.service.Imp;

import com.svtcc.bean.ComplainBean;
import com.svtcc.bean.HistoryBean;
import com.svtcc.dao.HistoryDao;
import com.svtcc.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("historyService")
public class HistoryServiceImp implements HistoryService {
    @Autowired
    private HistoryDao historyDao;

    @Override
    public int addHisComplains(ComplainBean complainBean) {
        return historyDao.addHistoryData(complainBean);
    }

    @Override
    public List<HistoryBean> selectAllHistoryData() {
        return historyDao.selectAllHistoryData();
    }

    @Override
    public int deleteHistoryData(int hid) {
        return historyDao.deleteHistoryData(hid);
    }
}
