<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>论坛登录</title>
	<link rel="stylesheet" type="text/css" href="/static/css/register-login.css">
</head>
<body>
<div id="box"></div>
<div class="cent-box">
	<div class="cent-box-header">
		<h2 class="main-title">论坛登录</h2>
	</div>

	<div class="cont-main clearfix">
		<div class="index-tab">
			<div class="index-slide-nav">
				<a href="/login.jsp" class="active">登录</a>
				<a href="/register.jsp">注册</a>
				<div class="slide-bar"></div>				
			</div>
		</div>
		<c:if test="${!empty errorMsg}">
			<div style="color=red">${errorMsg}</div>
		</c:if>
		<c:if test="${!empty sucessMsg}">
			<div style="color=red">${sucessMsg}</div>
		</c:if>
		<form action="/user/login" method="post">
			<div class="login form">
				<div class="group">
					<div class="group-ipt email">
						<input type="text" name="userName" id="userName" class="ipt" placeholder="用户名" required>
					</div>
					<div class="group-ipt password">
						<input type="passWord" name="passWord" id="password" class="ipt" placeholder="输入您的登录密码" required>
					</div>
				</div>
			</div>

			<div class="button">
				<button type="submit" class="login-btn register-btn" id="button">登录</button>
			</div>

			<%--<div class="remember clearfix">--%>
				<%--<label class="forgot-password">--%>
					<%--<a href="#">忘记密码？</a>--%>
				<%--</label>--%>
			<%--</div>--%>
		</form>
	</div>
</div>

<script src='/static/js/particles.js' type="text/javascript"></script>
<script src='/static/js/background.js' type="text/javascript"></script>
<script src='/static/js/jquery.min.js' type="text/javascript"></script>
<script src='/static/js/layer/layer.js' type="text/javascript"></script>
<script src='/static/js/index.js' type="text/javascript"></script>
</body>
</html>