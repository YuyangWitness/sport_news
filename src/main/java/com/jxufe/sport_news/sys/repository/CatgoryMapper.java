package com.jxufe.sport_news.sys.repository;

import com.jxufe.sport_news.sys.entity.Catgory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2016/3/19.
 */
public interface CatgoryMapper {
    List<Catgory> GetCatgoryList(@Param("sidx") String sidx,@Param("sord") String sord);

    void deleteCatgory(@Param(value = "id")String id);

    void insertCatgory(@Param(value = "catgory")Catgory catgory);

    List<Catgory> GetCatgory();

    String selectCatgoryById(@Param(value = "id")String id);
}
