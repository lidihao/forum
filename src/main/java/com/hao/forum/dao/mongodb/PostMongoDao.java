package com.hao.forum.dao.mongodb;

import com.github.pagehelper.Page;
import com.hao.forum.entity.Post;
import javafx.geometry.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PostMongoDao extends BaseMongoDao<Post> {
    public Page<Post> queryPostPagableOrderBy(int pageIndex, int pageSize, Sort.Order... orders){
        Query query =new Query(Criteria.where("isDeleted").is(false));//查找没有被删除的帖子
        query.fields().exclude("content").exclude("attachments").exclude("comments");
        query.with(new PageRequest(pageIndex,pageSize));
        query.with(new Sort(orders));
        return queryPostPagable(pageIndex,pageSize,query,"post",Post.class);
    }
    public void insertPost(Post post){
        mongoTemplate.insert(post);
    }

    protected List<Post> getPostByQuery(Query query){
        return mongoTemplate.find(query,Post.class,"post");
    }
    public Post getPostById(String postId){
        Query query = new Query(Criteria.where("id").is(postId));
        query.fields().exclude("contentSummary");
        List<Post> postList= getPostByQuery(query);
        if(postList!=null){
            return postList.get(0);
        }else {
            return null;
        }
    }
    public Page<Post> listPostByBoardName(int pageIndex, int pageSize,String boardName,Sort.Order... orders){
        Query query =new Query(Criteria.where("boardTag").is(boardName));
        query.fields().exclude("content").exclude("attachments").exclude("comments");
        query.with(new PageRequest(pageIndex,pageSize));
        query.with(new Sort(orders));
        return queryPostPagable(pageIndex,pageSize,query,"post",Post.class);
    }
}
