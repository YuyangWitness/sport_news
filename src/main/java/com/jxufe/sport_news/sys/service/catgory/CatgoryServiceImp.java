package com.jxufe.sport_news.sys.service.catgory;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxufe.sport_news.Common.DateUtils;
import com.jxufe.sport_news.sys.entity.Catgory;
import com.jxufe.sport_news.sys.entity.NewsVO;
import com.jxufe.sport_news.sys.repository.CatgoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/3/19.
 */
@Service
public class CatgoryServiceImp implements CatgoryService {

    @Autowired
    private CatgoryMapper catgoryMapper;

    public PageInfo<Catgory> GetCatgoryList(Integer pageNo, Integer pageSize,String sidx,String sord) {

        PageHelper.startPage(pageNo, pageSize);

        List<Catgory> CatgoryList =  catgoryMapper.GetCatgoryList(sidx,sord);

        PageInfo pageInfo = new PageInfo(CatgoryList);
        return pageInfo;
    }

    public void deleteCatgory(String id) {
        catgoryMapper.deleteCatgory(id);
    }

    public void insertCatgory(Catgory catgory) {
        catgoryMapper.insertCatgory(catgory);
    }

    public List<Catgory> GetCatgory(){
        return catgoryMapper.GetCatgory();
    }


}
