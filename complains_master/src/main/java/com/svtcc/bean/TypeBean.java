package com.svtcc.bean;

public class TypeBean {
    private int tid;
    private String typename;

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public TypeBean(int tid, String typename) {
        this.tid = tid;
        this.typename = typename;
    }
}
