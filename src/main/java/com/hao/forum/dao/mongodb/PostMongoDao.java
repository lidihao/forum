package com.hao.forum.dao.mongodb;

import com.github.pagehelper.Page;
import com.hao.forum.entity.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PostMongoDao {
    @Autowired
    private MongoTemplate mongoTemplate;

    protected Page<Post> queryPostPagable(int pageIndex,int pageSize,Query query){
        if (pageIndex<=0)
            pageIndex = 1;

        Page<Post> page = new Page<>();
        int count = (int) mongoTemplate.count(query,"post");
        int pageNum = Math.round((float)count/pageSize);
        if(pageIndex>pageNum)
            pageIndex = pageNum;
        page.setTotal(count);
        page.setPages(pageNum);
        page.setPageNum(pageIndex).setPageSize(pageSize);
        List<Post> postList = mongoTemplate.find(query,Post.class);
        page.addAll(postList);
        return page;
    }

    public Page<Post> queryPostPagableOrderBy(int pageIndex, int pageSize, Sort.Order... orders){
        Query query =new Query(Criteria.where("isDeleted").is(0));
        query.fields().exclude("content").exclude("attachments").exclude("comments");
        query.with(new PageRequest(pageIndex,pageSize));
        query.with(new Sort(orders));
        return queryPostPagable(pageIndex,pageSize,query);
    }
}
