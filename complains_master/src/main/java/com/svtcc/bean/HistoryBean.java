package com.svtcc.bean;

public class HistoryBean {
    private int hid;
    private String income;
    private String contact;
    private String tel;
    private String status;
    private String type;
    private String content;
    private String number;

    public int getHid() {
        return hid;
    }

    public void setHid(int hid) {
        this.hid = hid;
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

    public HistoryBean(int hid, String income, String contact, String tel, String status, String type, String content, String number) {
        this.hid = hid;
        this.income = income;
        this.contact = contact;
        this.tel = tel;
        this.status = status;
        this.type = type;
        this.content = content;
        this.number = number;
    }

    public HistoryBean() {
    }
}
