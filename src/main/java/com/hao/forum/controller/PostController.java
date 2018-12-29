package com.hao.forum.controller;

import com.github.pagehelper.Page;
import com.hao.forum.common.Msg;
import com.hao.forum.entity.Post;
import com.hao.forum.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class PostController {
    @Autowired
    private PostService postService;
    @RequestMapping(value = "/post/add",method = RequestMethod.POST)
    public Msg addPost(@RequestBody Post post){
        postService.doAddPost(post);
        return Msg.success();
    }

    @RequestMapping(value = "/post/get/page" ,method = RequestMethod.POST)
    public Msg getPostPagable(@RequestParam("pageIndex") int pageIndex){
        return postService.doGetPostPage(pageIndex);
    }


    @RequestMapping("/post/get/{pid}")
    public Msg getPost(@PathVariable("pid") String postId){
        Post post=postService.doFindPostById(postId);
        return Msg.success().add("post",post);
    }

    @RequestMapping(value = "/post/list",method = RequestMethod.POST)
    public Msg listPost(@RequestParam("boardName")String boardName,@RequestParam("index")int index){
        Page<Post> postPage = postService.dolistPostByBoardName(boardName,index);
        return Msg.success().add("postPage",postPage);
    }
}
