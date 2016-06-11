package com.jxufe.sport_news.sys.repository;

import com.jxufe.sport_news.sys.entity.News;
import com.jxufe.sport_news.sys.entity.NewsVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2016/3/21.
 */
public interface HeadMapper {
    List<NewsVO> GetHeadList(@Param("title")String title,@Param("sidx") String sidx,@Param("sord") String sord);

    List<NewsVO> GetNotHeadList(@Param("title")String title,@Param("sidx") String sidx,@Param("sord") String sord);

    void SetHead(@Param("id")String id);

    void DeleteHead(@Param("id")String id);
}
