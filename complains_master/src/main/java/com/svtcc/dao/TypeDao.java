package com.svtcc.dao;

import com.svtcc.bean.TypeBean;

import java.util.List;

public interface TypeDao {
    List<TypeBean> selectAllType();

    int insertType(String typename);

    int deleteType(int tid);

    int updataType(TypeBean typeBean);
}
