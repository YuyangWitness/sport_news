package com.jxufe.sport_news.sys.service.news;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxufe.sport_news.Common.DateUtils;
import com.jxufe.sport_news.sys.entity.Catgory;
import com.jxufe.sport_news.sys.entity.News;
import com.jxufe.sport_news.sys.entity.NewsVO;
import com.jxufe.sport_news.sys.repository.CatgoryMapper;
import com.jxufe.sport_news.sys.repository.NewsMapper;
import com.jxufe.sport_news.sys.service.catgory.CatgoryService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/3/10.
 */
@Service
public class NewsServiceImp implements NewsService {
    @Autowired
    private NewsMapper newsMapper;
    private CatgoryMapper catgoryMapper;

    public PageInfo<NewsVO> getNewsList(String title, Integer pageNo, Integer pageSize,String sidx,String sord) {
       /* pageNo = pageNo == null?1:pageNo;
        pageSize = pageSize == null?10:pageSize;*/
        PageHelper.startPage(pageNo, pageSize);

        List<NewsVO> NewsList =  newsMapper.getNewsList(title,sidx,sord);

        for(int i = 0 ; i<NewsList.size();i++){
         String date = DateUtils.dateToString(NewsList.get(i).getSubDate());
            NewsList.get(i).setDate(date);


        }
        PageInfo pageInfo = new PageInfo(NewsList);
        return pageInfo;
    }

    public void DeleteNew(String id) {
        newsMapper.deleteNew(id);
    }

    public void insertNes(News news) {
        newsMapper.insertNes(news);
    }

    public NewsVO SelectNewsById(String id) {
     NewsVO news =  newsMapper.SelectNewsById(id);

        news.setDate(DateUtils.dateToString(news.getSubDate()));
        return news;
    }

    public void updateByPrimaryKey(NewsVO news) {
        newsMapper.updateByPrimaryKey(news);
    }

    public List<NewsVO> SelectNews() {
        List<NewsVO> newsVOList = newsMapper.SelectNews();
        for (int i = 0;i<newsVOList.size();i++){
            newsVOList.get(i).setDate(DateUtils.dateToString(newsVOList.get(i).getSubDate()));
        }
        return newsVOList;
    }

    public List<NewsVO> SelectHeadNews() {
        List<NewsVO> newsVOList =newsMapper.SelectHeadNews();
        for (int i = 0;i<newsVOList.size();i++){
            newsVOList.get(i).setDate(DateUtils.dateToString(newsVOList.get(i).getSubDate()));
        }
        return newsVOList;
    }

    public List<NewsVO> GetNewsBycatgory(String catgory) {
        List<NewsVO> newsVOList = newsMapper.GetNewsBycatgory(catgory);
        for (int i = 0;i<newsVOList.size();i++){
            newsVOList.get(i).setDate(DateUtils.dateToString(newsVOList.get(i).getSubDate()));
        }
        return newsVOList;
    }
}
