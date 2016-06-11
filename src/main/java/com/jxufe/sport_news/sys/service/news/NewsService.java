package com.jxufe.sport_news.sys.service.news;

import com.github.pagehelper.PageInfo;
import com.jxufe.sport_news.sys.entity.News;
import com.jxufe.sport_news.sys.entity.NewsVO;

import java.util.List;

/**
 * Created by Administrator on 2016/3/10.
 */
public interface NewsService {
     PageInfo<NewsVO> getNewsList(String title,Integer pageNo,Integer pageSize,String sidx,String sord);

     void DeleteNew(String id);

     void insertNes(News news);

     NewsVO SelectNewsById(String id);

     void updateByPrimaryKey(NewsVO news);

     List<NewsVO> SelectNews();

     List<NewsVO> SelectHeadNews();

     List<NewsVO> GetNewsBycatgory(String catgory);
}
