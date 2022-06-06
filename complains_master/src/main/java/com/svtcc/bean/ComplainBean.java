package com.svtcc.bean;

import java.io.Serializable;

public class ComplainBean implements Serializable{
    private int cid;
    private String income;
    private String contact;
    private String tel;
    private String status;
    private String type;
    private String content;
    private String number;
    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getIncome() {
        return income;
    }

    public void setIncome(String income) {
        this.income = income;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public ComplainBean(int cid, String income, String contact, String tel, String type, String content, String number) {
        this.cid = cid;
        this.income = income;
        this.contact = contact;
        this.tel = tel;
        this.type = type;
        this.content = content;
        this.number = number;
    }

    public ComplainBean() {
    }
}
