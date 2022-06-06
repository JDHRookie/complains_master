package com.svtcc.service;

import com.svtcc.bean.AnnounceBean;

import java.util.List;

public interface AnnounceService {
    int addAnnounce(AnnounceBean announceBean);

    int deleteAnnounce(int mid);

    int updateAnnounce(AnnounceBean announceBean);

    List<AnnounceBean> selectAllAnnounce();
}
