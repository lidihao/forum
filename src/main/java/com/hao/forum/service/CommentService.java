package com.hao.forum.service;

import com.github.pagehelper.Page;
import com.hao.forum.dao.mongodb.CommentMongoDao;
import com.hao.forum.entity.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {
    @Autowired
    private CommentMongoDao commentMongoDao;
    public void doinsertComment(Comment comment){
        if (comment!=null)
            commentMongoDao.insertComment(comment);
    }
    public Page<Comment> doGetCommentPageOrderByDate(int idx,String postId){
        return commentMongoDao.queryCommentPageOrderByDate(idx,postId);
    }
}
