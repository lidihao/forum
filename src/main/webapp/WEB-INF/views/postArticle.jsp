<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>写文章</title>
    <style>
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 100px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            padding: 12px 16px;

        }
        .thumbnail
        {
            margin-bottom: 10px;
        }
        </style>
    <script type="text/javascript" src="/static/js/jquery-2.1.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
</head>
<body>
    <p style="display: none" id="userName"><shiro:principal/></p>
    <div id="header" style="width: 100%;height: 100px">
        <h2 style="float: left;">论坛</h2>
        <ul style="float: right;margin-right: 50px">
            <li style="display: inline;margin: 10px"><a href="/index"> <span>首页</span></a></li>
            <li style="display: inline;margin: 10px">
                <!-- 按钮触发模态框 -->
                <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#postModal">发布</button>
                <!-- 模态框（Modal） -->
                <div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel"><span>发布文章</span></h4>
                            </div>
                            <div class="modal-body">
                                <span class="modal-title" id="ModalLabel">分类标签</span>
                                <br>
                                <div id="boardTagContain">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary" id="postButton">提交更改</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
            </li>
        </ul>
    </div>
    <div id="editor" style="width: 60%;margin: auto;">
        <h4>请输入标题</h4>
        <p>请输入正文</p>
    </div>
    <button id="editorSetBtn">设置内容</button>
    <button id="editorGetBtn1">获取内容1</button>
    <button id="editorGetBtn2">获取内容2</button>
    <!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
    <script type="text/javascript" src="/static/js/wangEditor.js"></script>
    <script type="text/javascript">
        var editor = new WangEditor('#editor')
        // 或者 var editor = new E( document.getElementById('editor') )
	    editor.customConfig.uploadImgServer = '/img/upload';
        editor.customConfig.uploadFileName = 'img';
        editor.customConfig.uploadImgTimeout = 3000;
        editor.customConfig.zIndex=10;
	    editor.customConfig.uploadImgHooks = {
            before: function (xhr, editor, files) {
            // 图片上传之前触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，files 是选择的图片文件

            // 如果返回的结果是 {prevent: true, msg: 'xxxx'} 则表示用户放弃上传
            // return {
            //     prevent: true,
            //     msg: '放弃上传'
            // }
            },
            success: function (xhr, editor, result) {
            // 图片上传并返回结果，图片插入成功之后触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
            },
            fail: function (xhr, editor, result) {
            // 图片上传并返回结果，但图片插入错误时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
            },
            error: function (xhr, editor) {
            // 图片上传出错时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
            },
            timeout: function (xhr, editor) {
            // 图片上传超时时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
            },

            // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
            // （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
            customInsert: function (insertImg, result, editor) {
            // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
            // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果

            // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
            var url = result.data
            insertImg(url)

            // result 必须是一个 JSON 格式字符串！！！否则报错
            }
        }
        editor.create()
        $("#editorSetBtn").click(function(){
            //这是设置编辑器内容
            editor.txt.html("dsafdfadsfdafdsfds");
        })
        $("#editorGetBtn1").click(function(){
            //获取编辑器的内容，带样式
            //一般使用这个获取数据，通过ajax发送给服务端　，然后服务端以Ｓtring接收，保存到数据库．
            alert(editor.txt.html());
        })
        $("#editorGetBtn2").click(function(){
            //获取编辑器的内容，不带样式，纯文本
            alert(editor.txt.text());
        })
        //getBoardTag
        $(document).ready(function(){
            $.ajax({
                url:"/board/listAllBoardName",
                type:"POST",
                success:function(result){
                    createBoardTag(result);
                }
            });
            $("#postButton").click(function () {
                postArticle();
                tag=undefined;
            })
        });


        var tag = undefined;
        function createBoardTag(result) {
            var boardTagContains = $("#boardTagContain");
            var tagList = result.extend.nameList;
            var i=0;
            var row = $("<div></div>");
            while(i<tagList.length){
                var col = $("<input class='btn btn-default' type='button' style='margin:3px'>");
                col.attr("value",tagList[i++]);
                col.click(function (event) {
                   tag = event.target.value;
                });
                row.append(col);
                if(i%5==0||i==tagList.length){
                    boardTagContains.append(row);
                    row=$("<div class='row'></div>").append($("<br>"))
                }
            }
        }

        function postArticle() {
            if(typeof(tag)=="undefined"){
                alert("请选择分类标签");
                return;
            }
            var htmlContent = editor.txt.html();
            var pattern = /.*?(&lt;!more&gt).*?/;
            var textContent = editor.txt.text();
            var matchers = pattern.exec(textContent);
            var degest = "";
            if(matchers!=null)
                degest=matchers[0];
            var userName = $("#userName").text();
            var postData = "userName="+userName+"&content="+htmlContent+
                    "&contentSummary="+degest+"&boardTag="+tag;
            $.ajax({
                url:"/post/add",
                type:"POST",
                data:postData,
                success:function (result) {
                    if(result.code=100){
                        $("＃postModal").modal('hide');
                    }else{
                        alert("发布失败，请重试!!!")
                    }
                }
            })
        }

    </script>

</body>
</html>
