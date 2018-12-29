package com.hao.forum.service;

import com.github.pagehelper.Page;
import com.hao.forum.common.Msg;
import com.hao.forum.common.SysConstant;
import com.hao.forum.dao.mongodb.PostMongoDao;
import com.hao.forum.entity.Post;
import com.hao.forum.util.HtmlUtil;
import org.apache.lucene.document.*;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class PostService {
    @Autowired
    private IndexWriter indexWriter;
    @Autowired
    private PostMongoDao postMongoDao;
    protected void indexPost(String text,String id) throws IOException {
        Document document = new Document();
        document.add(new StringField("id",id,Field.Store.YES));
        document.add(new TextField("content",text,Field.Store.NO));
        indexWriter.addDocument(document);
        indexWriter.commit();
    }

    private String html2text(String html) throws Exception {
        return HtmlUtil.getText(html);
    }

    public Msg doAddPost(Post post){
        Msg msg=null;
        postMongoDao.insertPost(post);
        String html=post.getContent();
        try {
            String text = html2text(html);
            indexPost(post.getId(),text);
            msg = Msg.success();
        } catch (Exception e) {
            msg=Msg.fail();
        }
        return msg;
    }

    public Msg doGetPostPage(int index){
        Page<Post> postPage=postMongoDao.queryPostPagableOrderBy(index,SysConstant.PAGE_SIZE,
                new Sort.Order(Sort.Direction.DESC,"postDate"));
        return Msg.success().add("postPage",postPage);
    }

    public Post doFindPostById(String id){
        return postMongoDao.getPostById(id);
    }

    public Page<Post> dolistPostByBoardName(String boardName,int index){
        return postMongoDao.listPostByBoardName(index,SysConstant.PAGE_SIZE,boardName,
                new Sort.Order(Sort.Direction.DESC,"postDate"));
    }
}
