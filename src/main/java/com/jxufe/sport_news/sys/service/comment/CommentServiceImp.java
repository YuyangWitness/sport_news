package com.jxufe.sport_news.sys.service.comment;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxufe.sport_news.Common.DateUtils;
import com.jxufe.sport_news.sys.entity.Comment;
import com.jxufe.sport_news.sys.entity.CommentVO;
import com.jxufe.sport_news.sys.repository.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/3/20.
 */
@Service
public class CommentServiceImp implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    public PageInfo<CommentVO> GetCatgoryList(Integer pageNo, Integer pageSize, String sidx, String sord) {

        PageHelper.startPage(pageNo, pageSize);

        List<CommentVO> CommentList =  commentMapper.GetCommentList(sidx,sord);

        for(int i = 0 ; i<CommentList.size();i++){
            CommentList.get(i).setDate(DateUtils.timeToString(CommentList.get(i).getEntry_date()));
        }

        PageInfo pageInfo = new PageInfo(CommentList);
        return pageInfo;
    }

    public void DeleteComment(String id) {
        commentMapper.DeleteComment(id);
    }

    public List<CommentVO> GetComment() {

        List<CommentVO> commentVOList = commentMapper.GetComment();
        for(int i = 0 ; i<commentVOList.size();i++){
            commentVOList.get(i).setDate(DateUtils.timeToString(commentVOList.get(i).getEntry_date()));
        }
        return commentVOList;
    }

    public void InsertComment(Comment comment) {
        commentMapper.InsertComment(comment);
    }

    public List<CommentVO> GetCommentListByNews(String id) {

        List<CommentVO> commentVOList = commentMapper.GetCommentListByNews(id);;
        for(int i = 0 ; i<commentVOList.size();i++){
            commentVOList.get(i).setDate(DateUtils.timeToString(commentVOList.get(i).getEntry_date()));
        }
       return commentVOList;
    }
}
