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
        .w-e-text-container {
            height: anto !important; /*!important是重点，因为原div是行内样式设置的高度300px*/
        }
    </style>
    <script type="text/javascript" src="/static/js/jquery-2.1.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/wangEditor.css">
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
                <div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
    <div id="editor">
        <h4>请输入标题</h4>
        <p>请输入正文</p>
    </div>
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
        //getBoardTag
        $(document).ready(function(){
            $('#editor').css({
                "width":"60%",
                "height":"700px",
                "margin":"auto"
            });
            $(".w-e-text-container").css({
                "height":"700px"
            })
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
                $("#articleTitle").attr("value","");
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
            var titleInput="<br><br><div style='margin:3px'>\n" +
                "\t\t\t\t<div class=\"input-group\">\n" +
                "\t\t\t\t\t<span class=\"input-group-btn\">\n" +
                "\t\t\t\t\t\t<button class=\"btn btn-default\" type=\"button\">\n" +
                "\t\t\t\t\t\t\t文章标题\n" +
                "\t\t\t\t\t\t</button>\n" +
                "\t\t\t\t\t</span>\n" +
                "\t\t\t\t\t<input id='articleTitle' type=\"text\" class=\"form-control\">\n" +
                "\t\t\t\t</div><!-- /input-group -->\n" +
                "\t\t\t</div><!-- /.col-lg-6 --><br>"
            boardTagContains.append($(titleInput)).append("<span style=\"background-image: url(/static/images/upload.jpg)\">上传图片<span>")
        }

        function postArticle() {
            var articleTitle = $("#articleTitle").val();
            if(typeof(tag)=="undefined"){
                alert("请选择分类标签");
                return;
            }
            if(articleTitle==""||articleTitle==null){
                alert("请添加标题");
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
            // var postData = "userName="+userName+"&content="+htmlContent+
            //         "&contentSummary="+degest+"&boardTag="+tag;

            var postData = {
                userName:userName,
                content:htmlContent,
                contentSummary:degest,
                boardTag:tag,
                title:articleTitle
            }
            $.ajax({
                url:"/post/add",
                type:"POST",
                contentType:"application/json;charset=utf-8",
                data:JSON.stringify(postData),
                dataType:'json',
                success:function (result) {
                    if(result.code==100){
                        alert("保存成功")
                    }else{
                        alert("发布失败，请重试!!!")
                    }
                }
            })
        }

    </script>

</body>
</html>
