package com.hao.forum.service;

import com.hao.forum.common.Msg;
import com.hao.forum.common.SysConstant;
import com.hao.forum.dao.rdbms.UserDao;
import com.hao.forum.entity.User;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UserService {
    @Autowired
    private UserDao userDao;
    public Msg doRegister(User user){
        Msg msg=null;
        String salt = DigestUtils.md5Hex(new Date().toString()+user.getUserName());
        SimpleHash hash = new SimpleHash(SysConstant.HASH_ALGORITHM_NAME,user.getPassWord(),
                ByteSource.Util.bytes(salt),SysConstant.HASH_TIMES);
        user.setPassWord(hash.toHex());
        user.setSalt(salt);
        try {
            if (userDao.insertUser(user)) {
                msg= Msg.success();
            } else {
                msg= Msg.fail();
            }
        }catch (Exception e){
            msg=Msg.fail("该帐号已经被注册了");
        }
        return msg;
    }

    public Msg doLogin(String userName,String passWord){
        Msg msg = null;
        Subject currentUser = SecurityUtils.getSubject();
        if (!currentUser.isAuthenticated()){
            try {
                UsernamePasswordToken token = new UsernamePasswordToken(userName, passWord);
                currentUser.login(token);
                userDao.updateDateByUserName(userName);
                msg=Msg.success("登录成功");
            }catch (LockedAccountException e){
                msg=Msg.fail("该帐号被锁定");
            }catch (Exception e){
                msg=Msg.fail("帐号或密码不正确");
            }
        }else {
            msg = Msg.fail("该帐号已经登录");
        }
        return msg;
    }

    public Msg logout(){
        Subject curUser=SecurityUtils.getSubject();
        curUser.logout();
        return Msg.success();
    }

    public Msg doLockedUser(String userName){
        if (userDao.updateLockFlag(true, userName)) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    public Msg doUnlockedUser(String userName){
        if (userDao.updateLockFlag(false, userName)) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }
}
