<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 18-12-18
  Time: 下午1:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>创建论坛版块</title>
    <script>
        function mySubmit(){
            with(document){
                var boardName = getElementById("board.boardName");
                if(boardName.value == null || boardName.value.length ==0){
                    alert("版块名称不能为空，请填上.");
                    boardName.focus();
                    return false;
                }else if(boardName.value.length > 150){
                    alert("版块名称最大长度不能超过50个字符，请调整.");
                    boardName.focus();
                    return false;
                }

                var boardDesc = getElementById("board.boardDesc");
                if(boardDesc.value != null && boardDesc.value.length > 255){
                    alert("版块描述最大长度不能超过255个字符，请调整.");
                    boardDesc.focus();
                    return false;
                }

                return true;
            }

        }
    </script>
</head>
<body>
    <form action="<c:url value="/admin/addBoard"/>" method="post" onsubmit="return mySubmit()">
        <div class="login form">
            <div class="group">
                <div class="group-ipt user">
                    <input type="text" name="boardName" id="user" class="ipt" placeholder="版块名称" required>
                </div>
                <div class="group-ipt password">
                    <textarea type="password" name="description" id="password" class="ipt" placeholder="版块简介" required></textarea>
                </div>
            </div>
        </div>

        <div class="button">
            <button type="submit" class="login-btn register-btn" id="button">注册</button>
        </div>
    </form>
</body>
</html>
