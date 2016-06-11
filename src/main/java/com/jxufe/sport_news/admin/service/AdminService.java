package com.jxufe.sport_news.admin.service;

import com.github.pagehelper.PageInfo;
import com.jxufe.sport_news.admin.entity.Admin;

import java.util.List;

/**
 * Created by Administrator on 2016/3/21.
 */
public interface AdminService {

    PageInfo<Admin> GetAdminList(String username,Integer pageNo,Integer pageSize,String sidx,String sord);

    void InsertAdmin(Admin admin);

    void DeleteAdmin(String id);

    Admin SelectAdminById(String id);

    void UpdateAdmin(Admin admin);

    List<Admin> SelectAdminByName(String username);

}
