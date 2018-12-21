package com.hao.forum.service;

import com.github.pagehelper.Page;
import com.hao.forum.common.SysConstant;
import com.hao.forum.dao.mongodb.PostMongoDao;
import com.hao.forum.dao.redis.KVredisDao;
import com.hao.forum.entity.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PageService {
    @Autowired
    private PostMongoDao postMongoDao;
    @Autowired
    private KVredisDao kVredisDao;
    public Page<Post> getPostPagableOrderBy(int pageIndex, int pageSize, Sort.Order...orders){
        Page<Post> pages = postMongoDao.queryPostPagableOrderBy(pageIndex,pageSize,orders);
        pages.forEach((e)->{
            e.setVistCount((Long) kVredisDao.get(SysConstant.POST_PREFIX+"visitCount"));
//            e.setCommentCount((Long) kVredisDao.get(SysConstant.POST_PREFIX+"commentCount"));
                }
        );
        return pages;
    }


}
