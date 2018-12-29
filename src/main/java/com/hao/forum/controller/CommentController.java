package com.hao.forum.controller;

import com.github.pagehelper.Page;
import com.hao.forum.common.Msg;
import com.hao.forum.entity.Comment;
import com.hao.forum.entity.Post;
import com.hao.forum.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CommentController {
    @Autowired
    private CommentService commentService;
    @RequestMapping(value = "/add/Comment",method = RequestMethod.POST)
    public Msg addComment(Comment comment){
        commentService.doinsertComment(comment);
        return Msg.success();
    }
    @RequestMapping(value = "/comment/listByPage",method = RequestMethod.POST)
    public Msg getCommentPageOrderByDate(@RequestParam("index") int pageIndex,@RequestParam("postId")String postId){
        Page<Comment> comments = commentService.doGetCommentPageOrderByDate(pageIndex,postId);
        return Msg.success().add("commentPage",comments);
    }
}
