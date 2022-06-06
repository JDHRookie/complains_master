package com.svtcc.bean;

public class AnnounceBean {
    private int mid;
    private String title;
    private String content;
    private String announcetime;

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAnnouncetime() {
        return announcetime;
    }

    public void setAnnouncetime(String announcetime) {
        this.announcetime = announcetime;
    }

    public AnnounceBean(String title, String content, String announcetime) {
        this.title = title;
        this.content = content;
        this.announcetime = announcetime;
    }

    public AnnounceBean() {
    }
}
