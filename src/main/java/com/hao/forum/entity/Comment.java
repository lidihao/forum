package com.hao.forum.entity;

import com.hao.forum.common.BaseEntity;

import java.util.Date;

public class Comment extends BaseEntity {
    private String id;
    private Date commentDate=new Date();
    private String commentContent;
    private boolean isDeleted=false;
    private String userName;
    private String postId;

    public Comment() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public Comment setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
        return  this;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public Comment setCommentContent(String commentContent) {
        this.commentContent = commentContent;
        return this;
    }

    public boolean isDeleted() {
        return isDeleted;
    }

    public Comment setDeleted(boolean deleted) {
        isDeleted = deleted;
        return this;
    }

    public String getUserName() {
        return userName;
    }

    public Comment setUserName(String userName) {
        this.userName = userName;
        return this;
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }
}
