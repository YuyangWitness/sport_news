package com.jxufe.sport_news.user.service;

import com.github.pagehelper.PageInfo;
import com.jxufe.sport_news.user.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/2/5.
 */

public interface Userservice {

    User UserList(String id);

    int InsertUser(User user);

    User getUser(String username);

    PageInfo<User> GetAdminList(String username,Integer pageNo,Integer pageSize,String sidx,String sord);

    void DeleteUser(String id);
}
