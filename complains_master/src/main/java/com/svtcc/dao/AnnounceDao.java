package com.svtcc.dao;

import com.svtcc.bean.AnnounceBean;

import java.util.List;

public interface AnnounceDao {

    int addAnnounce(AnnounceBean announceBean);

    int deleteAnnounce(int mid);

    int updateAnnounce(AnnounceBean announceBean);

    List<AnnounceBean> selectAllAnnounce();
}
