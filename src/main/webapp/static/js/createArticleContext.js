function createNewestArticleContent(result) {
    var postPage =result.extend.postPage;
    var article = "  <article class=\"excerpt excerpt-1\">" +
        "<header><a class=\"cat\"><i></i></a>" +//文章标签
        "<h2><a  target=\"_blank\" ></a>\n" +
        "</h2>" +
        "</header>" +
        "<p class=\"meta\">" +
        "<time class=\"time\"><i class=\"glyphicon glyphicon-time\"></i></time>" +
        "<span class=\"views\"><i class=\"glyphicon glyphicon-eye-open\"></i> 216</span> <a class=\"comment\" href=\"##comment\" title=\"评论\" target=\"_blank\" ><i class=\"glyphicon glyphicon-comment\"></i> 4</a>" +
        "</p>" +
        "<p class=\"note\"></p>\n" +
        "</article>";
    var content = $("#newestPostArticle");
    for(var i=0;i<postPage.length;i++) {
        var post = postPage[i];
        var title = post.title;
        var postDate = getMyDate(post.postDate);
        var degest = post.contentSummary;
        var postId = post.id;
        var url = "/post/get?postId="+postId;

        var articleContent = $(article);
        articleContent.find(".focus").attr("href",url);
        articleContent.find(".cat").attr("href",url).text(post.boardTag)//文章标签
        articleContent.find("h2 a").attr("href",url).text(title)
        articleContent.find("p time").text(postDate)
        //articleContent.find("p span").append()
        articleContent.find(".note").html(degest)

        content.append(articleContent)
    }
    console.log(result)
}