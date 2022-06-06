package com.svtcc.service.Imp;

import com.svtcc.bean.AnnounceBean;
import com.svtcc.dao.AnnounceDao;
import com.svtcc.service.AnnounceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("announceService")
public class AnnounceServiceImp implements AnnounceService {

    @Autowired
    private AnnounceDao announceDao;

    @Override
    public int addAnnounce(AnnounceBean announceBean) {
        return announceDao.addAnnounce(announceBean);
    }

    @Override
    public int deleteAnnounce(int mid) {
        return announceDao.deleteAnnounce(mid);
    }

    @Override
    public int updateAnnounce(AnnounceBean announceBean) {
        return announceDao.updateAnnounce(announceBean);
    }

    @Override
    public List<AnnounceBean> selectAllAnnounce() {
        return announceDao.selectAllAnnounce();
    }
}
