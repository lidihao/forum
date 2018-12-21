package com.hao.forum.entity;

import com.hao.forum.common.BaseEntity;

import java.util.Date;

public class Board extends BaseEntity {
    private Long boardId;
    private String boardName;
    private String description;
    private Date createDate;
    private boolean isDeleted;
    private Long userId;

    public Board() {
    }

    public Long getBoardId() {
        return boardId;
    }

    public void setBoardId(Long boardId) {
        this.boardId = boardId;
    }

    public String getBoardName() {
        return boardName;
    }

    public void setBoardName(String boardName) {
        this.boardName = boardName;
    }

    public String getDescription() {
        return description;
    }

    public Board setDescription(String description) {
        this.description = description;
        return this;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public Board setCreateDate(Date createDate) {
        this.createDate = createDate;
        return this;
    }

    public boolean isDeleted() {
        return isDeleted;
    }

    public Board setDeleted(boolean deleted) {
        isDeleted = deleted;
        return this;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
