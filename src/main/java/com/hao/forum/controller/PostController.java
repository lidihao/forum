package com.hao.forum.controller;

import com.hao.forum.common.Msg;
import com.hao.forum.entity.Post;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class PostController {
    @ResponseBody
    @RequestMapping("/post/add")
    public Msg addPost(Post post){
        Post post1=post;
        return null;
    }
}
