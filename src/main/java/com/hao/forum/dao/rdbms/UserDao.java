package com.hao.forum.dao.rdbms;

import com.hao.forum.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

@Repository
public class UserDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public boolean insertUser(User user){
        String sql = "insert into user(user_name,pass_word,phone_num,salt) values (?,?,?,?)";
        return jdbcTemplate.update(sql,user.getUserName(),user.getPassWord(),user.getPhoneNum(),user.getSalt())>0;
    }
    public String[] queryPwByUserName(String userName){
        String sql = "select pass_word,salt,is_locked from user where user_name=?";
        return jdbcTemplate.queryForObject(sql, new RowMapper<String[]>(){
            public String[] mapRow(ResultSet rs, int rowNum) throws SQLException {
                String[] ans = new String[3];
                ans[0] = rs.getString("pass_word");
                ans[1] = rs.getString("salt");
                ans[2] = rs.getString("is_locked");
                return ans;
            }
        },userName);
    }

    public boolean updateLockFlag(boolean lock, String userName){
        String sql="update user set is_locked=? where user_name = ?";
        return jdbcTemplate.update(sql,lock,userName)>0;
    }

    public boolean updateDateByUserName(String userName){
        String sql = "update user set last_login = ? where user_name = ?";
        return jdbcTemplate.update(sql,new Date(),userName)>0;
    }
    public int queryRoleByUserName(String userName){
        String sql ="select user_type from user where user_name = ?";
        return jdbcTemplate.queryForObject(sql,Integer.class,userName);
    }
}
