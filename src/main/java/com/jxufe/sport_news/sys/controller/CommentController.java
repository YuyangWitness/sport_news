package com.jxufe.sport_news.sys.controller;

import com.github.pagehelper.PageInfo;
import com.jxufe.sport_news.Common.UUIDGeneratorUtils;
import com.jxufe.sport_news.sys.entity.Comment;
import com.jxufe.sport_news.sys.entity.CommentVO;
import com.jxufe.sport_news.sys.service.comment.CommentService;
import com.jxufe.sport_news.user.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by Administrator on 2016/3/20.
 */
@Controller
@RequestMapping(value = "sys-comment")
public class CommentController {

    @Autowired
    private CommentService commentService;


    @RequestMapping(value = "init-comment")
    public String GetComment(){
        return "sys/syscomment";
    }

    @ResponseBody
    @RequestMapping(value = "GetComment")
    public PageInfo<CommentVO> GetCommentList(@RequestParam(value = "pageNumber", required = true) int pageNumber,
                                            @RequestParam(value = "pageSize", required = true) int pageSize,
                                            @RequestParam(value = "sidx", required = false) String sidx,
                                            @RequestParam(value = "sord", required = false) String sord){

      PageInfo<CommentVO> CommentList =  commentService.GetCatgoryList(pageNumber, pageSize, sidx, sord);

        return CommentList;
    }

    @RequestMapping(value = "delete-comment")
    public String DeleteComment(@RequestParam(value = "id")String id){
        commentService.DeleteComment(id);

        return "sys/syscomment";
    }


    @RequestMapping(value = "Insert-comment")
    @ResponseBody
    public Map addcomment(@ModelAttribute(value = "comment")Comment comment,HttpServletRequest request){

        Map map = new HashMap();
        comment.setId(UUIDGeneratorUtils.uuid32());
        comment.setEntry_date(new Date());
        User user = (User) request.getSession().getAttribute("UserNum");
        comment.setName(user.getId());
        commentService.InsertComment(comment);
        String id = comment.getNew_id();
        map.put("id",id);
        return map;
    }
}
