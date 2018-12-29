function createBoardTag() {
    $.ajax({
        url:"/board/listAllBoardName",
        type:"POST",
        success:function(result){
            console.log(result)
            var boardTagContent = $("#boardTag").append("<li><a href='/'>首页</a></li>");;
            var tag = "<li><a></a></li>";
            var tagList = result.extend.nameList;
            var url = "/listpostbytag/"
            $.each(tagList,function (index,val) {
                var boardTag=$(tag);
                var a =boardTag.find("a")
                console.log(a)
                a.attr("href",url+"?boardName="+val)
                a.text(val)
                console.log(a)
                boardTagContent.append(boardTag)
            })
        }
    });
}

function getMyDate(str){
    var oDate = new Date(str),
        oYear = oDate.getFullYear(),
        oMonth = oDate.getMonth()+1,
        oDay = oDate.getDate(),
        oHour = oDate.getHours(),
        oMin = oDate.getMinutes(),
        oSen = oDate.getSeconds(),
        oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);//最后拼接时间
    return oTime;
}
//补0操作
function getzf(num){
    if(parseInt(num) < 10){
        num = '0'+num;
    }
    return num;
}