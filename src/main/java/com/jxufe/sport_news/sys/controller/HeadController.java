package com.jxufe.sport_news.sys.controller;

import com.github.pagehelper.PageInfo;
import com.jxufe.sport_news.sys.entity.News;
import com.jxufe.sport_news.sys.entity.NewsVO;
import com.jxufe.sport_news.sys.service.headline.HeadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2016/3/21.
 */
@Controller
@RequestMapping(value = "sys-headline")
public class HeadController {

    @Autowired
    private HeadService headService;


    @RequestMapping(value = "init-head")
    public String GetHeadline(){
        return "sys/syshead";
    }

    @RequestMapping(value = "init-nothead")
    public String GetNotHeadline(){
        return "sys/sysnothead";
    }

    @ResponseBody
    @RequestMapping(value = "GetHeadLine")
    public PageInfo<NewsVO> GetHead(@ModelAttribute(value = "News") News news,
                                  @RequestParam(value = "pageNumber", required = true) int pageNumber,
                                  @RequestParam(value = "pageSize", required = true) int pageSize,
                                  @RequestParam(value = "sidx", required = false) String sidx,
                                  @RequestParam(value = "sord", required = false) String sord){
       PageInfo<NewsVO> GetHeadList = headService.GetHeadList(news.getTitle(), pageNumber, pageSize, sidx, sord);

        return GetHeadList;

    }

    @ResponseBody
    @RequestMapping(value = "GetNotHeadLine")
    public PageInfo<NewsVO> GetNotHead(@ModelAttribute(value = "News") News news,
                                     @RequestParam(value = "pageNumber", required = true) int pageNumber,
                                     @RequestParam(value = "pageSize", required = true) int pageSize,
                                     @RequestParam(value = "sidx", required = false) String sidx,
                                     @RequestParam(value = "sord", required = false) String sord){

        PageInfo<NewsVO> GetNotHeadList = headService.GetNotHeadList(news.getTitle(), pageNumber, pageSize, sidx, sord);

         return GetNotHeadList;
    }

    @RequestMapping(value = "SetHead")
    public String SetHead(@RequestParam(value = "id")String id){
        headService.SetHead(id);
        return "sys/syshead";
    }

    @RequestMapping(value = "DeleteHead")
    public String DeleteHead(@RequestParam(value = "id")String id){
        headService.DeleteHead(id);
        return "sys/syshead";
    }
}
