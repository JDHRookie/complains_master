package com.svtcc.service.Imp;

import com.svtcc.bean.TypeBean;
import com.svtcc.dao.TypeDao;
import com.svtcc.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("typeService")
public class TypeServiceImp implements TypeService {
    @Autowired
    private TypeDao typeDao;

    @Override
    public List<TypeBean> selectAllType() {
        return typeDao.selectAllType();
    }

    @Override
    public int insertType(String typename) {
        return typeDao.insertType(typename);
    }

    @Override
    public int deleteType(int tid) {
        return typeDao.deleteType(tid);
    }

    @Override
    public int updataType(TypeBean typeBean) {
        return typeDao.updataType(typeBean);
    }
}
