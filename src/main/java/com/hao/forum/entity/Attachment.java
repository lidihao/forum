package com.hao.forum.entity;

import com.hao.forum.common.BaseEntity;

public class Attachment extends BaseEntity {
    String realName;
    String url;

    public Attachment() {
    }

    public String getRealName() {
        return realName;
    }

    public Attachment setRealName(String realName) {
        this.realName = realName;
        return this;
    }

    public String getUrl() {
        return url;
    }

    public Attachment setUrl(String url) {
        this.url = url;
        return this;
    }
}
