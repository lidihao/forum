<%@ page language="java" contentType="text/html;charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>show</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/static/css/style.css">
<link rel="stylesheet" type="text/css" href="/static/css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="images/icon.png">
<link rel="shortcut icon" href="images/favicon.ico">
<script src="/static/js/jquery-2.1.4.min.js"></script>
<script src="/static/js/jquery.lazyload.min.js"></script>
</head>
<p id="postId" style="display: none"><c:out value="${postId}"></c:out></p>
<body class="user-select single">
<header class="header">
	<nav class="navbar navbar-default" id="navbar">
		<div class="container">
			<div class="header-topbar hidden-xs link-border">
				<ul class="site-nav topmenu">
					<shiro:user>
						<li>欢迎[<shiro:principal />]到来</li>
						<li><a href="<c:url value="/user/logout"/>">注销</a></li>
					</shiro:user>
					<shiro:guest>
						<li><a href="<c:url value="/login.jsp"/>">登录</a></li>
						<li><a href="<c:url value="/register.jsp"/>">注册</a></li>
					</shiro:guest>
					<shiro:hasRole name="admin">
						<li><a href="<c:url value="/forum/addBoardPage.html"/>">新建论坛版块</a></li>
						<li><a href="<c:url value="/forum/setBoardManagerPage.html"/>">论坛版块管理员</a></li>
						<li><a href="<c:url value="/forum/userLockManagePage.html"/>">用户锁定/解锁</a></li>
					</shiro:hasRole>
					<shiro:hasRole name="boardadmin">
						<li><a href="<c:url value="/forum/setBoardManagerPage.html"/>">查看版块所有文章</a></li>
						<li><a href="">查看所有回复</a></li>
					</shiro:hasRole>
					<li><a href="/article/edit"><button type="button" class="btn btn-primary btn-xs">写文章</button></a></li>
				</ul>
				勤记录 懂分享</div>
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar" aria-expanded="false"> <span class="sr-only"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
				<h1 class="logo hvr-bounce-in"><a href="/index.html" title="论坛">论坛</a></h1>
			</div>
			<div class="collapse navbar-collapse" id="header-navbar">
				<form class="navbar-form visible-xs" action="/Search" method="post">
					<div class="input-group">
						<input type="text" name="keyword" class="form-control" placeholder="请输入关键字" maxlength="20" autocomplete="off">
						<span class="input-group-btn">
		<button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
		</span> </div>
				</form>
				<ul class="nav navbar-nav navbar-right" id="boardTag">
					<%--<li><a data-cont="论坛" title="论坛" href="/index">首页</a></li>--%>
					<!--动态生成-->
				</ul>
			</div>
		</div>
	</nav>
</header>
<section class="container">
<div class="content-wrap">
<div class="content">
  <header class="article-header" id="postHeader">
  </header>
  <article class="article-content" id="postcontent">

		  <!--<script>                  window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "2", "bdMiniList": false, "bdPic": "", "bdStyle": "1", "bdSize": "32" }, "share": {} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=0.js?cdnversion=' + ~(-new Date() / 36e5)];</script>-->
  </article>
  <%--<div class="article-tags">标签：<a href="#list/2/" rel="tag" >DTcms博客</a><a href="#list/3/" rel="tag" >木庄网络博客</a><a href="#list/4/" rel="tag" >独立博客</a><a href="#list/5/" rel="tag" >修复优化</a>--%>
	<%--</div>--%>
  <div class="relates">
	<div class="title">
	  <h3>相关推荐</h3>
	</div>
	<ul>
	  <%--<li><a href="#" title="" >用DTcms做一个独立博客网站（响应式模板）-MZ-NetBlog主题</a></li>--%>
	  <%--<li><a href="#" title="" >用DTcms做一个独立博客网站（响应式模板）-MZ-NetBlog主题</a></li>--%>
	  <%--<li><a href="#" title="" >用DTcms做一个独立博客网站（响应式模板）-MZ-NetBlog主题</a></li>--%>
	  <%--<li><a href="#" title="" >用DTcms做一个独立博客网站（响应式模板）-MZ-NetBlog主题</a></li>--%>
	  <%--<li><a href="#" title="" >用DTcms做一个独立博客网站（响应式模板）-MZ-NetBlog主题</a></li>--%>
	  <%--<li><a href="#" title="" >用DTcms做一个独立博客网站（响应式模板）-MZ-NetBlog主题</a></li>--%>
	  <%--<li><a href="#" title="" >用DTcms做一个独立博客网站（响应式模板）-MZ-NetBlog主题</a></li>--%>
	  <%--<li><a href="#" title="" >用DTcms做一个独立博客网站（响应式模板）-MZ-NetBlog主题</a></li>--%>
	</ul>
  </div>

	<p style="display:none;" id="userName"><shiro:principal /></p>
  <div class="title" id="comment">
	<h3>评论</h3>
  </div>
  <div id="respond">

		<div class="comment">
			<div class="comment-box">
				<form id="comment-form" name="comment-form">
					<textarea placeholder="您的评论或留言（必填）" name="commentContent" id="comment-textarea" cols="100%" rows="3" tabindex="3"></textarea>
					<input name="userName" type="text" style="display: none" id="commentUserName">
					<input name="postId" type="text" style="display: none" id="commentPostId">
				</form>
				<div class="comment-ctrl">
				<div class="comment-prompt" style="display: none;"> <i class="fa fa-spin fa-circle-o-notch"></i> <span class="comment-prompt-text">评论正在提交中...请稍后</span> </div>
				<div class="comment-success" style="display: none;"> <i class="fa fa-check"></i> <span class="comment-prompt-text">评论提交成功...</span> </div>
				<button name="comment-submit" id="comment-submit" tabindex="4">评论</button>
			</div>
			</div>
		</div>
		
	</div>
  <div id="postcomments">
	  <ol id="comment_list" class="commentlist"></ol>
  </div>
</div>
</div>
	<aside class="sidebar">
		<div class="widget widget_search">
			<form class="navbar-form" action="/Search" method="post">
				<div class="input-group">
					<input type="text" name="keyword" class="form-control" size="35" placeholder="请输入关键字" maxlength="15" autocomplete="off">
					<span class="input-group-btn">
		<button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
		</span> </div>
			</form>
		</div>
		<div class="widget widget_hot">
			<h3>最新评论文章</h3>
			<ul>
				<li><a title="用DTcms做一个独立博客网站（响应式模板）" href="#" ><span class="thumbnail">
				<img class="thumb" data-original="images/201610181739277776.jpg" src="images/201610181739277776.jpg" alt="用DTcms做一个独立博客网站（响应式模板）"  style="display: block;">
			</span><span class="text">用DTcms做一个独立博客网站（响应式模板）</span><span class="muted"><i class="glyphicon glyphicon-time"></i>
				2016-11-01
			</span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i>88</span></a></li>
			</ul>
		</div>
	</aside>
</section>
<footer class="footer">
<div class="container">
 <p>Copyright &copy; 2016.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a> </p>
</div>
<div id="gotop"><a class="gotop"></a></div>
</footer>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/jquery.ias.js"></script>
<script src="/static/js/scripts.js"></script>
<script src="/static/js/createBoardTag.js"></script>
<script>
	var postId;
	$(document).ready(function () {
		postId = $("#postId").text();
		getPostContent();
		createBoardTag();
		$("#comment-submit").click(function () {
			postComment();
        })
		createCommentPage();
    })
	function getPostContent() {
		$.ajax({
			url:"/post/get/"+postId,
			type:"POST",
            success:function (result) {
			    console.log(result);
			    createPostHeader(result);
				createPostContent(result);

            }
		})
    }

    function createPostHeader(result) {
	    var post = result.extend.post
		var headerHtml =
            "\t<div class=\"article-meta\"> <span class=\"item article-meta-time\">\n" +
            "\t  <time class=\"time\" data-toggle=\"tooltip\" data-placement=\"bottom\" id='time'><i class=\"glyphicon glyphicon-time\"></i></time>\n" +
            "\t  </span> <span class=\"item article-meta-source\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"\" data-original-title=\"来源：帝豪论坛\"><i class=\"glyphicon glyphicon-globe\"></i> </span> " +
			"<span class=\"item article-meta-category\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"\" data-original-title=\"MZ-NetBlog主题\"><i class=\"glyphicon glyphicon-list\"></i> <a id=\"boardtag\" ></a></span> <span class=\"item article-meta-views\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"\" data-original-title=\"浏览量：219\"><i class=\"glyphicon glyphicon-eye-open\"></i> 219</span> <span class=\"item article-meta-comment\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"\" data-original-title=\"评论量\"><i class=\"glyphicon glyphicon-comment\"></i> 4</span> </div>"
		var header = $("#postHeader")
		var title = $("<h1 class=\"article-title\"></h1>\n")
		title.text(post.title)
		header.append(title)
		var headerContent = $(headerHtml)
		headerContent.find("#time").text(getMyDate(post.postDate))
		headerContent.find("#boardtag").text(post.boardTag)
		header.append(headerContent)
    }

    function createPostContent(result) {
		var postContent=result.extend.post.content;
		var article = $("#postcontent").html(postContent);
    }

    var login = "http://localhost:8081/login.jsp"
    function postComment() {
	    var userName=$("#userName").text()
		$("#commentUserName").attr("value",userName)
		$("#commentPostId").attr("value",postId)
	    var commentData = $("#comment-form").serialize()
		console.log(commentData)
        $.ajax({
            url:"/add/Comment",
            type:"POST",
			data:commentData,
            success:function (result) {
                console.log(result)
				if (result.code==300){
                    $(location).attr('href',login );
				}else {
                    $(".comment-success").css({
                        "display": "block"
                    })

                    window.setTimeout(function () {
                        $(".comment-success").css({
                            "display": "none"
                        })
                    }, 2000)
                }
            }
        })
    }

    function createCommentPage(){
        $.ajax({
            url:"/comment/listByPage",
            type:"POST",
            data:"index="+0+"&postId="+postId,
            success:function (result) {
                console.log(result)
				renderCommentPage(result)
            }
        })
	}
	function renderCommentPage(result) {
        var commentString = "<li class=\"comment-content\">" +
			"<div class=\"comment-main\" id='commentContent'>" +
			"<p><a class=\"address\" id='commentusr'></a>" +
			"<span class=\"time\" id='commenttime'></span><br></p>" +
			"</div></li>"
		var commentList = $("#comment_list")
		var commentPage = result.extend.commentPage
		for (var i = 0;i<commentPage.length;i++){
            var comment=$(commentString)
			comment.find("#commentusr").text(commentPage[i].userName)
			comment.find("#commenttime").text("("+getMyDate(commentPage[i].commentDate)+")")
			comment.find("#commentContent").append($("<p>"+commentPage[i].commentContent+"</p>"));
            commentList.append(comment)
		}
    }
</script>
</body>
</html>
