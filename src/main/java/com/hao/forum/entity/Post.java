package com.hao.forum.entity;

import com.hao.forum.common.BaseEntity;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class Post extends BaseEntity {
    private String id;
    private Date postDate = new Date();
    private String content;
    private String contentSummary;
    private List<Attachment> attachments = new LinkedList<Attachment>();
    private List<Comment> comments = new LinkedList<Comment>();
    private boolean isDeleted = false;
    private String userName;
    private Long vistCount;
    private Long commentCount;
    private String boardTag;
    private String title;

    public Post() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getPostDate() {
        return postDate;
    }

    public Post setPostDate(Date postDate) {
        this.postDate = postDate;
        return this;
    }

    public String getContent() {
        return content;
    }

    public Post setContent(String content) {
        this.content = content;
        return this;
    }

    public List<Attachment> getAttachments() {
        return attachments;
    }

    public Post setAttachments(List<Attachment> attachments) {
        this.attachments = attachments;
        return this;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public Post setComments(List<Comment> comments) {
        this.comments = comments;
        return this;
    }

    public boolean isDeleted() {
        return isDeleted;
    }

    public Post setDeleted(boolean deleted) {
        isDeleted = deleted;
        return this;
    }

    public String getUserName() {
        return userName;
    }

    public Post setUserName(String userName) {
        this.userName = userName;
        return this;
    }

    public String getContentSummary() {
        return contentSummary;
    }

    public void setContentSummary(String contentSummary) {
        this.contentSummary = contentSummary;
    }

    public Long getVistCount() {
        return vistCount;
    }

    public void setVistCount(Long vistCount) {
        this.vistCount = vistCount;
    }

    public Long getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(Long commentCount) {
        this.commentCount = commentCount;
    }

    public String getBoardTag() {
        return boardTag;
    }

    public void setBoardTag(String boardTag) {
        this.boardTag = boardTag;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
