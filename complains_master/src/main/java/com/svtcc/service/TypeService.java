package com.svtcc.service;

import com.svtcc.bean.TypeBean;

import java.util.List;

public interface TypeService {
    List<TypeBean> selectAllType();

    int insertType(String typename);

    int deleteType(int tid);

    int updataType(TypeBean typeBean);
}
