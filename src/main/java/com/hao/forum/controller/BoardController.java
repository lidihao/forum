package com.hao.forum.controller;

import com.hao.forum.common.Msg;
import com.hao.forum.entity.Board;
import com.hao.forum.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class BoardController {
    @Autowired
    private BoardService boardService;
    @RequestMapping(value = "/admin/board/add",method = RequestMethod.POST)
    public ModelAndView addBoard(Board board){
        Msg msg = boardService.addBoard(board);
        ModelAndView mav = new ModelAndView();
        if(msg.getCode()==100){
            mav.addObject("sucessMsg",msg.getMsg());
        }else {
            mav.addObject("errorMsg",msg.getMsg());
        }
        mav.setViewName("forward:/createBoard.jsp");
        return mav;
    }

    @RequestMapping(value = "/admin/board/delete",method = RequestMethod.POST)
    public ModelAndView deleteBoard(String boardName){
        return null;
    }

    @ResponseBody
    @RequestMapping(value = "/board/listAllBoardName",method = RequestMethod.POST)
    public Msg listAllBoardName(){
        List<String> namelist = boardService.getAllBoardName();
        Msg msg = Msg.success().add("nameList",namelist);
        return msg;
    }
}
