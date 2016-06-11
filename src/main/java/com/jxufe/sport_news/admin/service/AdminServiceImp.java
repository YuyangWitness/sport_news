package com.jxufe.sport_news.admin.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxufe.sport_news.admin.entity.Admin;
import com.jxufe.sport_news.admin.repository.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/3/21.
 */
@Service
public class AdminServiceImp implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    public PageInfo<Admin> GetAdminList(String username, Integer pageNo, Integer pageSize, String sidx, String sord) {

        PageHelper.startPage(pageNo, pageSize);
        List<Admin> AdminList = adminMapper.GetAdminList(username,sidx,sord);
        for(int i = 0 ;i<AdminList.size();i++){
            if(AdminList.get(i).getRole().equals("1")){
                AdminList.get(i).setRole("普通管理员");
            }else if(AdminList.get(i).getRole().equals("2")){
                AdminList.get(i).setRole("编辑管理员");
            }else if(AdminList.get(i).getRole().equals("0")){
                AdminList.get(i).setRole("超级管理员");
            }else{
                AdminList.get(i).setRole("无法识别角色");
            }
        }

        PageInfo pageInfo = new PageInfo(AdminList);

        return pageInfo;
    }

    public void InsertAdmin(Admin admin) {
        adminMapper.InsertAdmin(admin);
    }

    public void DeleteAdmin(String id) {
        adminMapper.DeleteAdmin(id);
    }

    public Admin SelectAdminById(String id) {
       Admin ad = adminMapper.SelectAdminById(id);
        return ad;
    }

    public void UpdateAdmin(Admin admin) {
        adminMapper.UpdateAdmin(admin);
    }

    public List<Admin> SelectAdminByName(String username) {
        List<Admin> adminList = adminMapper.SelectAdminByName(username);
        return adminList;
    }
}
