package com.jxufe.sport_news.sys.repository;

import com.jxufe.sport_news.sys.entity.Comment;
import com.jxufe.sport_news.sys.entity.CommentVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2016/3/20.
 */
public interface CommentMapper {

    List<CommentVO> GetCommentList(@Param("sidx") String sidx,@Param("sord") String sord);

    void DeleteComment(@Param(value = "id")String id);

    List<CommentVO> GetComment();

    void InsertComment(@Param(value = "comment")Comment comment);

    List<CommentVO> GetCommentListByNews(@Param(value = "id")String id);

}
