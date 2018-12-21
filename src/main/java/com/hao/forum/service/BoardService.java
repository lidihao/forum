package com.hao.forum.service;

import com.hao.forum.common.Msg;
import com.hao.forum.dao.rdbms.BoardDao;
import com.hao.forum.entity.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardDao boardDao;
    public List<String> getAllBoardName(){
        return boardDao.queryBoardNameList();
    }
    public Msg addBoard(Board board){
        Msg msg =null;
        try{
            if(boardDao.insertBoard(board)){
                msg = Msg.success();
            }else {
                msg = Msg.fail();
            };
        }catch (Exception e){
            msg = Msg.fail("添加失败可能是版块重复");
        }
        return msg;
    }
}
