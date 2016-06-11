package com.jxufe.sport_news.sys.service.headline;

import com.github.pagehelper.PageInfo;
import com.jxufe.sport_news.sys.entity.News;
import com.jxufe.sport_news.sys.entity.NewsVO;

/**
 * Created by Administrator on 2016/3/21.
 */
public interface HeadService {
    PageInfo<NewsVO> GetHeadList(String title,Integer pageNo,Integer pageSize,String sidx,String sord);

    PageInfo<NewsVO> GetNotHeadList(String title,Integer pageNo,Integer pageSize,String sidx,String sord);

    void SetHead(String id);

    void DeleteHead(String id);
}
