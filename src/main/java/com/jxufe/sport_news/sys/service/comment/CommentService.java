package com.jxufe.sport_news.sys.service.comment;

import com.github.pagehelper.PageInfo;
import com.jxufe.sport_news.sys.entity.Comment;
import com.jxufe.sport_news.sys.entity.CommentVO;

import java.util.List;

/**
 * Created by Administrator on 2016/3/20.
 */
public interface CommentService {
    PageInfo<CommentVO> GetCatgoryList(Integer pageNo, Integer pageSize,String sidx,String sord);

    void DeleteComment(String id);

    List<CommentVO> GetComment();

    void InsertComment(Comment comment);

    List<CommentVO> GetCommentListByNews(String id);
}
