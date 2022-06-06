package com.svtcc.bean;

public class AdminBean {
    private int aid;
    private String username;
    private String realname;
    private String password;
    private String email;
    private String tel;
    private int status;

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public AdminBean(String username, String realname, String password, String email, String tel) {
        this.username = username;
        this.realname = realname;
        this.password = password;
        this.email = email;
        this.tel = tel;
    }

    public AdminBean() {
    }
}
