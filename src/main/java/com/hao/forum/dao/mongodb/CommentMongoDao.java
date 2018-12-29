package com.hao.forum.dao.mongodb;

import com.github.pagehelper.Page;
import com.hao.forum.common.SysConstant;
import com.hao.forum.entity.Comment;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;

import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;



@Repository
public class CommentMongoDao extends BaseMongoDao<Comment>{
    public void insertComment(Comment comment){
        mongoTemplate.insert(comment);
    }

    public Page<Comment> queryCommentPageOrderByDate(int idx,String postId){
        Query query =new Query(Criteria.where("postId").is(postId));
        query.with(new PageRequest(idx,SysConstant.PAGE_SIZE));
        query.with(new Sort(Sort.Direction.DESC,"commentDate"));
        return queryPostPagable(idx,SysConstant.PAGE_SIZE,query,"comment",Comment.class);
    }
}
