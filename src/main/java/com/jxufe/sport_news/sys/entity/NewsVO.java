package com.jxufe.sport_news.sys.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2016/3/10.
 */
public class NewsVO implements Serializable {
     private String id;
    private String title;
    private String content;
    private String picname;
    private String catgory;
    private String comment_num;
    private String good_num;
    private Date sub_date;
    private String Date;
    private String ishead;

    public String getDate() {
        return Date;
    }

    public void setDate(String date) {
        Date = date;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getPicname() {
        return picname;
    }

    public void setPicname(String picname) {
        this.picname = picname;
    }

    public String getCatgory() {
        return catgory;
    }

    public void setCatgory(String catgory) {
        this.catgory = catgory;
    }

    public String getCommentNum() {
        return comment_num;
    }

    public void setCommentNum(String commentNum) {
        this.comment_num = commentNum;
    }

    public String getGoodNum() {
        return good_num;
    }

    public void setGoodNum(String goodNum) {
        this.good_num = goodNum;
    }

    public Date getSubDate() {
        return sub_date;
    }

    public void setSubDate(Date subDate) {
        this.sub_date = subDate;
    }

    public String getIshead() {
        return ishead;
    }

    public void setIshead(String ishead) {
        this.ishead = ishead;
    }
}
