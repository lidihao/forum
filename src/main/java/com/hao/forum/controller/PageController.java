package com.hao.forum.controller;

import com.github.pagehelper.Page;
import com.hao.forum.common.SysConstant;
import com.hao.forum.entity.Post;
import com.hao.forum.service.BoardService;
import com.hao.forum.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class PageController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private PageService pageService;
    @RequestMapping(value = {"/index","/"})
    public ModelAndView getindexPage(){
        ModelAndView mav = new ModelAndView();
        List<String> boardNameList = boardService.getAllBoardName();
        mav.addObject("boards",boardNameList);
        Page<Post> postOrderByDate = pageService.getPostPagableOrderBy(1,SysConstant.PAGE_SIZE,
                new Sort.Order(Sort.Direction.DESC,"postDate"));
        Page<Post> postOrderByCommentsCount = pageService.getPostPagableOrderBy(1,SysConstant.PAGE_SIZE,
                new Sort.Order(Sort.Direction.DESC,"commentCount"));
        mav.addObject("postOrderByDate",postOrderByDate);
        mav.addObject("postOrderByCommentCount",postOrderByCommentsCount);
        mav.setViewName("indexpage");
        return mav;
    }

    @RequestMapping(value = "/article/edit")
    public ModelAndView getArticleEditPage(){
        ModelAndView mav = new ModelAndView();
        List<String> boardNameList = boardService.getAllBoardName();
        mav.addObject("boards",boardNameList);
        mav.setViewName("postArticle");
        return mav;
    }
}
