package com.jxufe.sport_news.sys.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by Administrator on 2016/3/21.
 */
@Entity
@Table(name = "t_headline")
public class HeadLine {
    private String id;
    private String new_id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNew_id() {
        return new_id;
    }

    public void setNew_id(String new_id) {
        this.new_id = new_id;
    }
}
