package com.jxufe.sport_news.sys.service.catgory;

import com.github.pagehelper.PageInfo;
import com.jxufe.sport_news.sys.entity.Catgory;
import com.jxufe.sport_news.sys.entity.NewsVO;

import java.util.List;

/**
 * Created by Administrator on 2016/3/19.
 */
public interface CatgoryService {
    PageInfo<Catgory> GetCatgoryList(Integer pageNo, Integer pageSize,String sidx,String sord);

    void deleteCatgory(String id);

    void insertCatgory(Catgory catgory);

    List<Catgory> GetCatgory();
}
