package com.jxufe.sport_news.sys.repository;

import com.jxufe.sport_news.sys.entity.News;
import com.jxufe.sport_news.sys.entity.NewsVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016/3/10.
 */

public interface NewsMapper {
    List<NewsVO> getNewsList(@Param("title")String title,@Param("sidx") String sidx,@Param("sord") String sord);

    void deleteNew(@Param("id")String id);

    void insertNes(@Param("news")News news);

    NewsVO SelectNewsById(@Param("id")String id);

    void updateByPrimaryKey(@Param("news")NewsVO news);

    List<NewsVO> SelectNews();

    List<NewsVO> SelectHeadNews();

    List<NewsVO> GetNewsBycatgory(@Param("catgory")String catgory);

}
