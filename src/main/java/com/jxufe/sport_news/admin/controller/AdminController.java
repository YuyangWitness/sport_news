package com.jxufe.sport_news.admin.controller;

import com.github.pagehelper.PageInfo;
import com.jxufe.sport_news.Common.UUIDGeneratorUtils;
import com.jxufe.sport_news.admin.entity.Admin;
import com.jxufe.sport_news.admin.service.AdminService;
import com.jxufe.sport_news.sys.entity.News;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2016/3/21.
 */
@Controller
@RequestMapping(value = "admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "init-admin")
    public String GetAdmin(){
        return "sys/sysadmin";
    }

    @RequestMapping(value = "init-addadmin")
    public String GetaddAdmin(Model model,@RequestParam(value = "id",required = false)String id){

        if(StringUtils.isNotEmpty(id)) {
            Admin admin = adminService.SelectAdminById(id);
            model.addAttribute("admin", admin);
        }else{
            Admin admin = new Admin();
            model.addAttribute("admin", admin);
        }

        return "sys/adminadd";
    }

    @ResponseBody
    @RequestMapping(value = "GetAdminList")
    public PageInfo<Admin> GetAdminList(@ModelAttribute(value = "admin") Admin admin,
                                        @RequestParam(value = "pageNumber", required = true) int pageNumber,
                                        @RequestParam(value = "pageSize", required = true) int pageSize,
                                        @RequestParam(value = "sidx", required = false) String sidx,
                                        @RequestParam(value = "sord", required = false) String sord){

      PageInfo<Admin> AdminList = adminService.GetAdminList(admin.getUsername(), pageNumber, pageSize, sidx, sord);

        return AdminList;
    }

    @RequestMapping(value = "addadmin")
    public String AddAdmin(@ModelAttribute(value = "admin") Admin admin){
        if(!StringUtils.isNotEmpty(admin.getId())) {
            admin.setId(UUIDGeneratorUtils.uuid32());
            adminService.InsertAdmin(admin);
        }
        return "sys/sysadmin";
    }

    @RequestMapping(value = "delete-admin")
    public String DeleteAdmin(@RequestParam(value = "id")String id){
        adminService.DeleteAdmin(id);
        return "sys/sysadmin";
    }

    @RequestMapping(value = "init-login")
    public String GetLogin(){
        return "admin/login";
    }

    @ResponseBody
    @RequestMapping(value = "adminlogin")
    public String Login(@ModelAttribute(value = "admin")Admin admin,HttpServletRequest request){


     List<Admin> adminList = adminService.SelectAdminByName(admin.getUsername());

        if(adminList.size()==1){
          if(adminList.get(0).getPassword().equals(admin.getPassword())){
              request.getSession().setAttribute("adminUserName",adminList.get(0).getUsername());
              request.getSession().setAttribute("adminRole",adminList.get(0).getRole());
              return "1";
          }else{
              return "2";
          }
        }else{
            return "0";
        }
    }

    @RequestMapping(value = "loginout")
    public String LoginOut(HttpServletRequest request){
        // 清除session
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        return "admin/login";
    }

}
