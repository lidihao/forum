package com.hao.forum.dao.rdbms;

import com.hao.forum.entity.Board;
import com.hao.forum.entity.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<String> queryBoardNameList(){
        String sql = "select board_name from board";
        return jdbcTemplate.queryForList(sql,String.class);
    }
    public boolean insertBoard(Board board){
        String sql = "insert into board(board_name,description) values (?,?)";
        return jdbcTemplate.update(sql,board.getBoardName(),board.getDescription())>0;
    }
}
