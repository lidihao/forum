package com.hao.forum.entity;

import com.hao.forum.common.BaseEntity;

import java.util.Date;

public class Comment extends BaseEntity {
    private Long commentID;
    private Date commentDate;
    private String commentContent;
    private boolean isDeleted;
    private String userName;
    public Comment() {
    }

    public Long getCommentID() {
        return commentID;
    }

    public Comment setCommentID(Long commentID) {
        this.commentID = commentID;
        return this;
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
}
