package com.jxufe.sport_news.sys.service.headline;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxufe.sport_news.Common.DateUtils;
import com.jxufe.sport_news.sys.entity.NewsVO;
import com.jxufe.sport_news.sys.repository.HeadMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/3/21.
 */
@Service
public class HeadServiceImp implements HeadService {

    @Autowired
    private HeadMapper headMapper;

    public PageInfo<NewsVO> GetHeadList(String title, Integer pageNo, Integer pageSize, String sidx, String sord) {
        PageHelper.startPage(pageNo, pageSize);
        List<NewsVO> HeadList = headMapper.GetHeadList(title,sidx,sord);
        for(int i = 0 ; i<HeadList.size();i++){
            String date = DateUtils.dateToString(HeadList.get(i).getSubDate());
            HeadList.get(i).setDate(date);


        }
        PageInfo pageInfo = new PageInfo(HeadList);
        return pageInfo;
    }

    public PageInfo<NewsVO> GetNotHeadList(String title, Integer pageNo, Integer pageSize, String sidx, String sord) {
        PageHelper.startPage(pageNo, pageSize);
        List<NewsVO> HeadNotList = headMapper.GetNotHeadList(title, sidx, sord);
        for(int i = 0 ; i<HeadNotList.size();i++){
            String date = DateUtils.dateToString(HeadNotList.get(i).getSubDate());
            HeadNotList.get(i).setDate(date);


        }
        PageInfo pageInfo = new PageInfo(HeadNotList);
        return pageInfo;
    }

    public void SetHead(String id) {

        headMapper.SetHead(id);
    }

    public void DeleteHead(String id) {

        headMapper.DeleteHead(id);
    }
}
