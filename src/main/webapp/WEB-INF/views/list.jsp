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
	<title>论坛首页</title>
	<meta name="keywords" content="">
	<meta name="description" content="">
	<link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/static/css/nprogress.css">
	<link rel="stylesheet" type="text/css" href="/static/css/style.css">
	<link rel="stylesheet" type="text/css" href="/static/css/font-awesome.min.css">
	<link rel="apple-touch-icon-precomposed" href="/static/images/icon.png">
	<link rel="shortcut icon" href="/static/images/favicon.ico">
	<script src="/static/js/jquery-2.1.4.min.js"></script>
</head>
<body class="user-select">
<p id="boardName" style="display: none"><c:out value="${boardName}"></c:out></p>
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
		<div class="content" id="newestPostArticle">
			<div class="title">
				<h3><c:out value="${boardName}"></c:out>最新发布</h3>
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
	</div>
	<div id="gotop"><a class="gotop"></a></div>
</footer>
<script src="/static/js/bootstrap.min.js" type="application/javascript"></script>
<script src="/static/js/createBoardTag.js" type="application/javascript"></script>
<script src="/static/js/createArticleContext.js" type="application/javascript"></script>
<script type="application/javascript">
    var boardName = "";
    $(document).ready(function() {
		boardName = $("#boardName").text()
        createBoardTag();
        getPostByTag()
    })
    function getPostByTag() {
        $.ajax({
            url:"/post/list",
            type:"POST",
            data:"index="+0+"&boardName="+boardName,
            success:function(result){
                createNewestArticleContent(result);
            }
        });
    }
</script>
</body>
</html>