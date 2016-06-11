package com.jxufe.sport_news.user.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxufe.sport_news.user.entity.User;
import com.jxufe.sport_news.user.repository.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2016/2/5.
 */
@Service
public class UserServiceImp implements Userservice{

    @Autowired
    private UserMapper userMapper;

    public User UserList(String id) {
       User user =  userMapper.selectByPrimaryKey(id);
        return user;
    }

    public int InsertUser(User user){
        return userMapper.insert(user);
    }

    public User getUser(String username){
       return userMapper.getUserByName(username);
     }

    public PageInfo<User> GetAdminList(String username, Integer pageNo, Integer pageSize, String sidx, String sord) {

        PageHelper.startPage(pageNo, pageSize);
        List<User> UserList = userMapper.SelectUserList(username,sidx,sord);
        PageInfo pageInfo = new PageInfo(UserList);

        return pageInfo;

    }

    public void DeleteUser(String id) {
        userMapper.deleteByPrimaryKey(id);
    }


}
