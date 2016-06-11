package com.jxufe.sport_news.sys.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * Created by Administrator on 2016/3/19.
 */
@Entity
@Table(name = "t_catgory")
public class Catgory implements Serializable {
    private String id;
    private String catgory;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCatgory() {
        return catgory;
    }

    public void setCatgory(String catgory) {
        this.catgory = catgory;
    }
}
