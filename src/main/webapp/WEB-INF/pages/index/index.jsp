<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/22
  Time: 12:09
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

<!-- Start of Search Wrapper -->
<div class="search-area-wrapper">
  <div class="search-area container">
    <h3 class="search-header">Do you like sport?</h3>
    <p class="search-tag-line">If you like it,Welcome to our website!You can achieve many informations!</p>

  </div>
</div>
<!-- End of Search Wrapper -->
<!-- Start of Page Container -->
<div class="page-container">
  <div class="container">
    <div class="row">

      <!-- start of page content -->
      <div class="span8 page-content">

        <!-- Basic Home Page Template -->
        <div class="row separator">
          <section class="span4 articles-list">
            <h3>头条新闻</h3>
            <ul class="articles">
            <c:forEach items="${Head}" var="head">
              <li class="article-entry standard">
                <h4><a href="${ctx}/user/init-news?id=${head.id}">${head.title}</a></h4>
                <span class="article-meta">${head.date}</span>
              </li>
            </c:forEach>
            </ul>
          </section>


          <section class="span4 articles-list">
            <h3>新闻</h3>
            <ul class="articles">
              <c:forEach items="${News}" var="news">
              <li class="article-entry standard">
                <h4><a href="${ctx}/user/init-news?id=${news.id}">${news.title}</a></h4>
                <span class="article-meta">${news.date}</span>

              </li>
              </c:forEach>

            </ul>
          </section>
        </div>
      </div>
      <!-- end of page content -->

      <!-- start of sidebar -->
      <aside class="span4 page-sidebar">
        <section class="span4 articles-list">
          <h3>最新评论</h3>
          <ul class="articles">
            <c:forEach items="${Comment}" var="comment">
              <li class="article-entry standard">
                <h4><a href="">${comment.new_id}</a></h4>
                <span class="article-meta">${comment.content}</span>
                <span class="like-count">${comment.date}</span>
              </li>
            </c:forEach>

          </ul>
        </section>

      </aside>
      <!-- end of sidebar -->
    </div>
  </div>
</div>
<!-- End of Page Container -->
</body>
</html>
