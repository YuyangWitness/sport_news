<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/23
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/common/taglibs.jspf" %>
<html>
<head>
    <title>体育新闻</title>
  <link rel="stylesheet" href="style.css"/>
  <link rel='stylesheet' id='bootstrap-css-css'  href='${ctx}/static/index/css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
  <link rel='stylesheet' id='responsive-css-css'  href='${ctx}/static/index/css/responsive5152.css?ver=1.0' type='text/css' media='all' />
  <link rel='stylesheet' id='pretty-photo-css-css'  href='${ctx}/static/index/js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
  <link rel='stylesheet' id='main-css-css'  href='${ctx}/static/index/css/main5152.css?ver=1.0' type='text/css' media='all' />
  <link rel='stylesheet' id='custom-css-css'  href='${ctx}/static/index/css/custom5152.html?ver=1.0' type='text/css' media='all' />
  <script type='text/javascript' src='${ctx}/static/index/js/jquery-1.8.3.min.js'></script>


</head>
<body>
<!-- Start of Header -->
<div class="header-wrapper">
  <header>
    <div class="container">


      <div class="logo-container">
        <!-- Website Logo -->
        <a href="index-2.html"  title="Knowledge Base Theme">
          <%--<img src="images/logo.png" alt="Knowledge Base Theme">--%>
        </a>
        <span class="tag-line">体育新闻网站</span>
      </div>


      <!-- Start of Main Navigation -->
      <nav class="main-nav">
        <div class="menu-top-menu-container">
          <ul id="menu-top-menu" class="clearfix">
            <c:choose>
              <c:when test="${null==UserNum}">
                <li class="current-menu-item"><a href="${ctx}/user/init-admin">登录/注册</a></li>
              </c:when>
              <c:otherwise>
                <li class="current-menu-item"><a href="#">你好！${UserNum.name}</a></li>
                <li class="current-menu-item"><a href="${ctx}/user/logout">注销</a></li>
              </c:otherwise>
            </c:choose>
            <li class="current-menu-item"><a href="${ctx}/user/init-index">主页</a></li>
            <c:forEach items="${catgory}" var="catgory">
              <li><a href="${ctx}/user/init-catgory?catgory=${catgory.id}">${catgory.catgory}</a></li>
            </c:forEach>
            <%-- <li><a href="home-categories-articles.html">Home 3</a></li>
             <li><a href="articles-list.html">Articles List</a></li>
             <li><a href="faq.html">FAQs</a></li>
             <li><a href="#">Skins</a></li>
             <li><a href="#">More</a></li>
             <li><a href="contact.html">Contact</a></li>--%>
          </ul>
        </div>
      </nav>
      <!-- End of Main Navigation -->

    </div>
  </header>
</div>
<!-- End of Header -->
<div id="news" style="width: 80%; margin: 20px auto; border-top: 1px solid gainsboro; ">
  <div id="title" style="width:80%;margin: 5px auto; border-bottom: 1px solid gainsboro; ">
    <h2 style="text-align: center;">${news.title}</h2>
    <p style="text-align: right; font-size: medium;">${news.date}</p>
  </div>
  <div id="content" style="width:80%;margin: 5px auto; padding: 10px;border-bottom: 1px solid gainsboro;">
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${news.content}</p>
    <c:choose>
      <c:when test="${null == news.picname || news.picname.isEmpty()}">
      </c:when>
      <c:otherwise>
        <img src="${ctx}/uploadFiles/News/${news.picname}">
      </c:otherwise>
    </c:choose>
  </div>
  <div id="good" style="width: 20%; margin: 5px auto;">
    <img src="${ctx}/static/picture/good.jpg" id="goodpic">
    <p style="text-align: center;" id="goodnum">已点赞${news.goodNum}</p>
    <input type="text" value="${news.id}" style="display: none;" id="newsid">
  </div>
  <c:choose>
    <c:when test="${null==UserNum}">
      <div id="comment" style="width:80%;margin: 5px auto; padding: 10px; border-top: 1px solid gainsboro;">
        <c:forEach items="${comment}" var="comment">
          <div class="commentList" style=" border-top: 1px solid gainsboro;">
            <span>${comment.name}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>${comment.date}</span>
            <p>${comment.content}</p>
          </div>
        </c:forEach>

      </div>
    </c:when>
    <c:otherwise>
      <div id="comment" style="width:80%;margin: 5px auto; padding: 10px; border-top: 1px solid gainsboro;">
          <p id="add">发表评论：<textarea id="commentText" style="width: 50%;" name="content"></textarea>
            <input type="button" value="发表评论" id="addcomment">
          </p>
        <c:forEach items="${comment}" var="comment">
          <div class="commentList" style=" border-top: 1px solid gainsboro;">
            <span>${comment.name}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>${comment.entry_date}</span>
            <p>${comment.content}</p>
          </div>
        </c:forEach>

      </div>
    </c:otherwise>
  </c:choose>

</div>
</body>
<script>
$("#goodpic").click(function(){
  $.ajax({
    type:"POST",
    url:"${ctx}/sys-news/updateGood",
    data:{id:$("#newsid").val()},
    dataType:"json",
    success:function(text){
         $("#goodnum").text("已点赞"+text);
    }
  });
})

  $("#addcomment").click(function(){
    $.ajax({
      type:"POST",
      url:"${ctx}/sys-comment/Insert-comment",
      data:{new_id:$("#newsid").val(),content:$("#commentText").val()},
      dataType:"json",
      success:function(text){


        window.location.href ="${ctx}/user/init-news?id="+text.id;

      }
    });


  });
</script>
</html>
