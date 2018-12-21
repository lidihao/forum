package com.hao.forum.entity;

import com.hao.forum.common.BaseEntity;

import java.util.Date;
import com.hao.forum.common.UserType;

public class User extends BaseEntity {
    private Long uid;
    private String userName;
    private String passWord;
    private String phoneNum;
    private boolean isLocked;
    private Date registerDate;
    private Date lastLogin;
    private UserType type;
    private String salt;
    public User() {
    }

    public Long getUid() {
        return uid;
    }

    public User setUid(Long uid) {
        this.uid = uid;
        return this;
    }

    public String getUserName() {
        return userName;
    }

    public User setUserName(String userName) {
        this.userName = userName;
        return this;
    }

    public String getPassWord() {
        return passWord;
    }

    public User setPassWord(String passWord) {
        this.passWord = passWord;
        return this;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public User setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
        return this;
    }

    public boolean isLocked() {
        return isLocked;
    }

    public User setLocked(boolean locked) {
        isLocked = locked;
        return this;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public User setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
        return this;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public User setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
        return this;
    }

    public UserType getType() {
        return type;
    }

    public User setType(UserType type) {
        this.type = type;
        return this;
    }

    public String getSalt() {
        return salt;
    }

    public User setSalt(String salt) {
        this.salt = salt;
        return this;
    }
}
