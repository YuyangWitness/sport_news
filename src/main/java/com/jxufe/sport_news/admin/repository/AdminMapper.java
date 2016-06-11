package com.jxufe.sport_news.admin.repository;

import com.jxufe.sport_news.admin.entity.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2016/3/21.
 */
public interface AdminMapper {
    List<Admin>  GetAdminList(@Param("username")String username,@Param("sidx") String sidx,@Param("sord") String sord);

    void InsertAdmin(@Param("admin")Admin admin);

    void DeleteAdmin(@Param("id")String id);

    Admin SelectAdminById(@Param("id")String id);

    void UpdateAdmin(@Param("admin")Admin admin);

    List<Admin> SelectAdminByName(@Param("username")String username);
}
