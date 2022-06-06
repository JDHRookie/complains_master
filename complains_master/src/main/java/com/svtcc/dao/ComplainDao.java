package com.svtcc.dao;

import com.github.pagehelper.Page;
import com.svtcc.bean.AdminBean;
import com.svtcc.bean.ComplainBean;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;
import java.util.List;


public interface ComplainDao {
    ArrayList<ComplainBean> selectAll();

    ComplainBean selectComplainByName(@Param("type") String type);

    int deleteComplainsById(@Param("cid") int cid);

    int updateComplainsById(ComplainBean complainBean);

    ArrayList<ComplainBean> selectComplainsBySth(String contact);

    int updateComplainStatus();

    ComplainBean selectComplainById(int cid);

    @Insert("insert  into springweb.tb_complain (income,type,content,number) values (#{income},#{type},#{content},#{number})")
    int addComplains(@Param("income") String income,@Param("type") String type,@Param("content") String content,@Param("number") String number);
}
