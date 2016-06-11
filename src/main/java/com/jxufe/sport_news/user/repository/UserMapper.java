package com.jxufe.sport_news.user.repository;


import com.jxufe.sport_news.user.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface UserMapper {

    int deleteByPrimaryKey(String id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User getUserByName(@Param("username") String username);

    List<User> SelectUserList(@Param("username")String username,@Param("sidx") String sidx,@Param("sord") String sord);
}