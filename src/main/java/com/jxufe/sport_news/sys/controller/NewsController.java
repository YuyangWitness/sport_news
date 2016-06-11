package com.jxufe.sport_news.sys.controller;

import com.github.pagehelper.PageInfo;
import com.jxufe.sport_news.Common.UUIDGeneratorUtils;
import com.jxufe.sport_news.sys.entity.Catgory;
import com.jxufe.sport_news.sys.entity.News;
import com.jxufe.sport_news.sys.entity.NewsVO;
import com.jxufe.sport_news.sys.service.catgory.CatgoryService;
import com.jxufe.sport_news.sys.service.news.NewsService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/3/10.
 */
@Controller
@RequestMapping(value = "sys-news")
public class NewsController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private CatgoryService catgoryService;

    @RequestMapping(value = "Getindex")
    public String Getindex(){
        return "sys/sysindex";
    }

    @RequestMapping(value = "GetNews")
    public String GetNews(){
        return "sys/sysnews";
    }

    @ResponseBody
    @RequestMapping(value = "GetNewsList")
    public PageInfo<NewsVO> GetNewsList(@ModelAttribute(value = "News") News news,
                                      @RequestParam(value = "pageNumber", required = true) int pageNumber,
                                      @RequestParam(value = "pageSize", required = true) int pageSize,
                                      @RequestParam(value = "sidx", required = false) String sidx,
                                      @RequestParam(value = "sord", required = false) String sord) {

        PageInfo<NewsVO> NewsList = newsService.getNewsList(news.getTitle(), pageNumber, pageSize, sidx, sord);

        return NewsList;
    }

    @RequestMapping(value = "SearchNew")
    public String SearchNew(){
        return "sys/sysnews";
    }

    @RequestMapping(value = "DeleteNew")
    public String DeleteNew(@RequestParam(value = "id")String id,HttpServletRequest request){
        String picturePath = request.getSession().getServletContext().getRealPath("/") + File.separator + "uploadFiles" + File.separator + "News" + File.separator;


        NewsVO news = newsService.SelectNewsById(id);
        if(news.getPicname()!=""&&news.getPicname()!=null){
        File deleteFile = new File(picturePath + news.getPicname());
            deleteFile.delete();
        }
        newsService.DeleteNew(id);
        return "sys/sysnews";

    }

    @RequestMapping(value = "ModifyNew")
    public String ModifyNew(Model model,@RequestParam(value = "id")String id){
        if (StringUtils.isNotEmpty(id)) {
            NewsVO news = newsService.SelectNewsById(id);
            model.addAttribute("news",news);
        }

      List<Catgory> CatgoryList = catgoryService.GetCatgory();

        model.addAttribute("catgory",CatgoryList);

          return "sys/sysnewEdit";
    }

    @RequestMapping(value = "GetNewsEdit")
    public String GetNewsEdit(Model model){

        List<Catgory> CatgoryList = catgoryService.GetCatgory();

        model.addAttribute("catgory",CatgoryList);
        return "sys/sysnewEdit";
    }

    @RequestMapping(value = "insertNew")
    public String insertNew(@RequestParam(value = "file",required = false) MultipartFile file,HttpServletRequest request) throws IOException {

        String id = request.getParameter("id");
        if(!StringUtils.isNotEmpty(id)){
        News news = new News();
        String picturePath = request.getSession().getServletContext().getRealPath("/") + File.separator + "uploadFiles" + File.separator + "News" + File.separator;
        if(!file.isEmpty()) {
            File file1 = new File(picturePath);
           if (!file1.exists()) {
            file1.mkdirs();
             }
              String pictureName = file.getOriginalFilename();
              String fileType = pictureName.substring(pictureName.lastIndexOf(".") + 1);
                String filePath = System.currentTimeMillis() + "." + fileType;
            File uploadFile = new File(picturePath + filePath);

            file.transferTo(uploadFile);

            news.setPicname(filePath);
}else{
            news.setPicname(null);
        }
        news.setId(UUIDGeneratorUtils.uuid32());
        news.setCommentNum("0");
        news.setGoodNum("0");
        news.setTitle(request.getParameter("title"));
        news.setCatgory(request.getParameter("catgory"));
        news.setContent(request.getParameter("content"));
        news.setIshead("0");
        news.setSubDate(new Date());


        newsService.insertNes(news);
        }
        else{
            NewsVO news = newsService.SelectNewsById(id);
            news.setTitle(request.getParameter("title"));
            news.setCatgory(request.getParameter("catgory"));
            news.setContent(request.getParameter("content"));
            String picturePath = request.getSession().getServletContext().getRealPath("/") + File.separator + "uploadFiles" + File.separator + "News" + File.separator;

            if(!file.isEmpty()){

                if(StringUtils.isNotEmpty(news.getPicname())){//判断是否存在原先的图片
                    //先删除原先的文件
                    File deleteFile = new File(picturePath + news.getPicname());
                    deleteFile.delete();

                    //增加新的文件
                    String pictureName = file.getOriginalFilename();
                    String fileType = pictureName.substring(pictureName.lastIndexOf(".") + 1);
                    String filePath = System.currentTimeMillis() + "." + fileType;
                    File uploadFile = new File(picturePath + filePath);

                    file.transferTo(uploadFile);
                    news.setPicname(filePath);
                }else{

                    //增加新的文件
                    String pictureName = file.getOriginalFilename();
                    String fileType = pictureName.substring(pictureName.lastIndexOf(".") + 1);
                    String filePath = System.currentTimeMillis() + "." + fileType;
                    File uploadFile = new File(picturePath + filePath);

                    file.transferTo(uploadFile);
                    news.setPicname(filePath);
                }
            }else{
                String pic = request.getParameter("pic");
                if(!StringUtils.isNotEmpty(pic)&&StringUtils.isNotEmpty(news.getPicname())){
                    //先删除原先的文件
                    File deleteFile = new File(picturePath + news.getPicname());
                    deleteFile.delete();
                    news.setPicname(null);
                }
            }

            newsService.updateByPrimaryKey(news);

        }
        return "sys/sysnews";
    }

    @ResponseBody
    @RequestMapping(value = "updateGood")
    public String UpdateGoodnum(@RequestParam(value = "id")String id){

       NewsVO news = newsService.SelectNewsById(id);
        int goodnum = Integer.parseInt(news.getGoodNum());
        goodnum++;
        news.setGoodNum(String.valueOf(goodnum));

        newsService.updateByPrimaryKey(news);
        return String.valueOf(goodnum);
    }
}
