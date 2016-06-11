package com.jxufe.sport_news.user.controller;

import com.github.pagehelper.PageInfo;
import com.jxufe.sport_news.Common.UUIDGeneratorUtils;
import com.jxufe.sport_news.sys.entity.*;
import com.jxufe.sport_news.sys.service.catgory.CatgoryService;
import com.jxufe.sport_news.sys.service.comment.CommentService;
import com.jxufe.sport_news.sys.service.news.NewsService;
import com.jxufe.sport_news.user.entity.User;
import com.jxufe.sport_news.user.service.UserServiceImp;
import com.jxufe.sport_news.user.service.Userservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2016/2/5.
 */
@Controller
@RequestMapping("/user")
public class Usercontroller {

    @Autowired
    private Userservice userservice;

    @Autowired
    private CatgoryService catgoryService;

    @Autowired
    private NewsService newsService;

    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "init-admin")
    public String Getlogin(Model model){
        User user = userservice.UserList("1");
        model.addAttribute("user",user);
        return "user/login";
    }


    @RequestMapping(value = "register")
    public String register(@ModelAttribute(value = "User")User user){

        user.setId(UUIDGeneratorUtils.uuid32());
        int result = userservice.InsertUser(user);

        if(result==1){
            return "user/success";
        }
        return "user/fail";
    }

    @RequestMapping(value = "login",method = RequestMethod.POST)
    @ResponseBody
    public String login(@ModelAttribute(value = "User")User user,HttpServletRequest request){
        User getUser = userservice.getUser(user.getUsername());

        request.getSession().setAttribute("UserNum",getUser);
        if(getUser==null){
            return "0";
        }else if(getUser.getPassword().equals(user.getPassword())){
            return "1";
        }else{
            return "2";
        }
    }

    @RequestMapping(value = "init-user")
    public String GetUser(){
        return "sys/sysuser";
    }

    @ResponseBody
    @RequestMapping(value = "GetUserList")
    public PageInfo<User> GetUser(@ModelAttribute(value = "user") User user,
                                  @RequestParam(value = "pageNumber", required = true) int pageNumber,
                                  @RequestParam(value = "pageSize", required = true) int pageSize,
                                  @RequestParam(value = "sidx", required = false) String sidx,
                                  @RequestParam(value = "sord", required = false) String sord){
      PageInfo<User> pageInfo =  userservice.GetAdminList(user.getUsername(), pageNumber, pageSize, sidx, sord);

      return pageInfo;
    }

    @RequestMapping(value = "delete-user")
    public String DeleteUser(@RequestParam(value = "id")String id){
        userservice.DeleteUser(id);
        return "sys/sysuser";
    }

    @RequestMapping(value = "init-index")
    public String GetIndex(Model model){

       List<Catgory> CatgoryList = catgoryService.GetCatgory();
        List<NewsVO> NewsList = newsService.SelectNews();
        List<NewsVO> HeadList = newsService.SelectHeadNews();
        List<CommentVO> CommentList = commentService.GetComment();
        model.addAttribute("catgory",CatgoryList);
        model.addAttribute("News",NewsList);
        model.addAttribute("Head",HeadList);
        model.addAttribute("Comment", CommentList);
        return "index/index";
    }

    @RequestMapping(value = "init-catgory")
    public String GetCatgory(Model model,@RequestParam(value = "catgory")String catgory){
        List<Catgory> CatgoryList = catgoryService.GetCatgory();
        List<NewsVO> NewsList = newsService.GetNewsBycatgory(catgory);
        model.addAttribute("catgory",CatgoryList);
        model.addAttribute("news",NewsList);
        return "index/catgoryindex";
    }

    @RequestMapping(value = "init-news")
    public String GetNews(Model model,@RequestParam(value = "id")String id){
        List<Catgory> CatgoryList = catgoryService.GetCatgory();
        NewsVO news = newsService.SelectNewsById(id);
        List<CommentVO> commentList = commentService.GetCommentListByNews(id);
        model.addAttribute("catgory",CatgoryList);
        model.addAttribute("news",news);
        model.addAttribute("comment",commentList);
        return "index/indexNews";
    }

    @RequestMapping(value = "logout")
    public String LogOut(HttpServletRequest request,Model model){
        // 清除session
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        List<Catgory> CatgoryList = catgoryService.GetCatgory();
        List<NewsVO> NewsList = newsService.SelectNews();
        List<NewsVO> HeadList = newsService.SelectHeadNews();
        List<CommentVO> CommentList = commentService.GetComment();
        model.addAttribute("catgory",CatgoryList);
        model.addAttribute("News",NewsList);
        model.addAttribute("Head",HeadList);
        model.addAttribute("Comment", CommentList);
        return "index/index";
    }
}
