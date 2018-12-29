package com.hao.forum.dao.mongodb;

import com.github.pagehelper.Page;
import com.hao.forum.entity.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;

import java.util.List;

public class BaseMongoDao<E> {
    @Autowired
    protected MongoTemplate mongoTemplate;
    protected Page<E> queryPostPagable(int pageIndex, int pageSize, Query query,String collectionName,Class<E> clazz){
        if (pageIndex<0)
            pageIndex = 0;

        Page<E> page = new Page<>();
        int count = (int) mongoTemplate.count(query,collectionName);//查取总帖子数
        int pageNum = Math.round((float)count/pageSize);
        if(pageIndex>pageNum)
            pageIndex = pageNum;
        page.setTotal(count);
        page.setPages(pageNum);
        page.setPageNum(pageIndex).setPageSize(pageSize);
        List<E> postList = mongoTemplate.find(query,clazz,collectionName);//根据查询条件查找
        page.addAll(postList);
        return page;
    }
}
