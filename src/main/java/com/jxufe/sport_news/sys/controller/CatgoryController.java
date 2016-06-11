package com.jxufe.sport_news.sys.controller;

import com.github.pagehelper.PageInfo;
import com.jxufe.sport_news.Common.UUIDGeneratorUtils;
import com.jxufe.sport_news.sys.entity.Catgory;
import com.jxufe.sport_news.sys.entity.News;
import com.jxufe.sport_news.sys.service.catgory.CatgoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2016/3/19.
 */
@Controller
@RequestMapping(value = "sys-catgory")
public class CatgoryController {

    @Autowired
    private CatgoryService catgoryService;
    @RequestMapping(value = "init-catgory")
    public String getCatgory(){
        return "sys/syscatgory";
    }

    @RequestMapping(value = "init-addcatgory")
    public String addCatgory(){
        return "sys/catgoryadd";
    }

    @ResponseBody
    @RequestMapping(value = "GetCatgoryList")
    public PageInfo<Catgory> GetCatgoryList(@RequestParam(value = "pageNumber", required = true) int pageNumber,
                                            @RequestParam(value = "pageSize", required = true) int pageSize,
                                            @RequestParam(value = "sidx", required = false) String sidx,
                                            @RequestParam(value = "sord", required = false) String sord){
        PageInfo<Catgory> CatgoryList = catgoryService.GetCatgoryList(pageNumber, pageSize, sidx, sord);
     return CatgoryList;
    }

    @RequestMapping(value = "DeleteCatgory")
    public String DeleteCatgory(@RequestParam(value = "id")String id){

        catgoryService.deleteCatgory(id);

      return   "sys/syscatgory";
    }


    @RequestMapping(value = "insertCatgory")
    public String insertCatgory(@ModelAttribute(value = "catgory")Catgory catgory){

        catgory.setId(UUIDGeneratorUtils.uuid32());

        catgoryService.insertCatgory(catgory);

        return "sys/syscatgory";

    }
}
