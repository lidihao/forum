<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>注册</title>
	<meta author="lidihao">
	<link rel="stylesheet" type="text/css" href="/static/css/register-login.css">
</head>
<body>
<div id="box"></div>
<div class="cent-box register-box">
	<div class="cent-box-header">
		<h2 class="main-title">论坛注册</h2>
	</div>

	<div class="cont-main clearfix">
		<div class="index-tab">
			<div class="index-slide-nav">
				<a href="/login.jsp">登录</a>
				<a href="/register.jsp" class="active">注册</a>
				<div class="slide-bar slide-bar1"></div>				
			</div>
		</div>
		<c:if test="${!empty errorMsg}">
			<div style="color=red">${errorMsg}</div>
		</c:if>
		<c:if test="${!empty sucessMsg}">
			<div style="color=red">${sucessMsg}</div>
		</c:if>
		<form id="registerform" action="/user/register" method="post">
			<div class="login form">
				<div class="group">
					<div class="group-ipt user">
						<input type="text" name="userName" id="user" class="ipt" placeholder="选择一个用户名" required>
					</div>
					<div class="group-ipt password">
						<input type="password" name="passWord" id="password" class="ipt" placeholder="设置登录密码" required>
					</div>
					<div class="group-ipt phone_num">
						<input type="text" name="phoneNum" id="phone_num" class="ipt" placeholder="电话号码" required>
					</div>
				</div>
			</div>

			<div class="button">
				<button type="submit" class="login-btn register-btn" id="button">注册</button>
			</div>
		</form>
	</div>
</div>


<script src='/static/js/particles.js' type="text/javascript"></script>
<script src='/static/js/background.js' type="text/javascript"></script>
<script src='/static/js/jquery.min.js' type="text/javascript"></script>
<script src='/static/js/layer/layer.js' type="text/javascript"></script>
<script>
    // function getFormData($form) {
    //     var unindexed_array = $form.serializeArray();
    //     var indexed_array = {};
    //
    //     $.map(unindexed_array, function (n, i) {
    //         indexed_array[n['name']] = n['value'];
    //     });
    //
    //     return indexed_array;
    // }
    // $("#button").click(function(){
		// 		var mydata = getFormData($('#registerform'));
    //             $.ajax({
    //                 type: "POST",
    //                 contentType: "application/json; charset=utf-8",
    //                 url: "/user/register",
		// 			dataType:'json',
    //                 async: false,
    //                 data: JSON.stringify(mydata),
    //                 success: function(data) {
    //                     alert(data)
    //                 }
    //         })
    //     }
    // )
</script>
</body>
</html>