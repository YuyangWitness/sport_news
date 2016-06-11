<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/19
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/common/taglibs.jspf" %>
<html>
<head>
    <title>新闻编辑</title>
  <link rel="stylesheet" href="${ctx}/static/sys/css/style.css">
  <script src="${ctx}/static/common/jquery.jqGrid-3.8.2/js/jquery-1.4.2.min.js"></script>
  <style>
    #newEdit{margin: 20px auto; width: 50%;}

    #newEdit dl{margin-top: 50px;}
  </style>
  <script>
    function deletepic(){
      $("#picname").remove();
      $("#pic").val("");
    }
  </script>
</head>
<body>
<div class="top"> <img class="logo" src="${ctx}/static/sys/images/logo.png">
  <div class="tab1" id="tab1">
    <div class="menu">
      <ul class="nav">
        <c:if test="${null!=adminUserName}">
          <li id="one0">
            <p>你好！${adminUserName}</p>
          </li>
          <li id="one0">
            <a href="${ctx}/admin/loginout"> <p>注销</p></a>
          </li>
        </c:if>
        <li id="one0"><a href="${ctx}/sys-news/Getindex"><img src="${ctx}/static/sys/images/1430958346122214_06.png">
          <p>回到首页</p>
        </a></li>
        <li  id="one1"><a href="${ctx}/sys-news/GetNews"><img src="${ctx}/static/sys/images/14309583461214_06.png">
          <p>新闻管理</p>
        </a></li>

        <c:if test="${adminRole=='0'||adminRole=='1'}">
          <li id="one2"><a href="${ctx}/sys-catgory/init-catgory"><img src="${ctx}/static/sys/images/14309583461214_08.png">
            <p>分类管理</p>
          </a></li>
          <li id="one3"><a href="${ctx}/sys-comment/init-comment"><img src="${ctx}/static/sys/images/14309583461214_16.png">
            <p>评论管理</p>
          </a></li>
          <li id="one4"><a href="${ctx}/sys-headline/init-head"><img src="${ctx}/static/sys/images/14309583461214_18.png">
            <p>头条管理</p>
          </a></li>
        </c:if>

        <c:if test="${adminRole=='0'}">
          <li id="one5"><a href="${ctx}/admin/init-admin"><img src="${ctx}/static/sys/images/14309583461214_10.png">
            <p>用户管理</p>
          </a></li>
        </c:if>
      </ul>
    </div>
  </div>
</div>

<div class="content" id="con_one_1">
  <div class="left-column">
    <div class="service">
      <h5>新闻管理</h5>
    </div>
    <div class="tab2" id="tab2">
      <dl class="call">
        <div class="medo">

          <dd id="column1"><a href="${ctx}/sys-news/GetNews">查询新闻</a></dd>
          <dd id="column2"><a href="${ctx}/sys-news/GetNewsEdit">发表新闻</a></dd>
        </div>
      </dl>
    </div>
  </div>
  <div class="meduo meduo1">
    <div class="right-content" id="con_colum_1">
      <form action="${ctx}/sys-news/insertNew" method="post" enctype="multipart/form-data">
      <div id="newEdit">
        <input type="text" value="${news.id}" name="id" style="display:none;"/>
        <p style="font-size: large; text-align: center; font-weight: 700;">新闻编辑</p>
          <dl>标题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="text" name="title" value="${news.title}">
          </dl>
      <dl><p> 内容</p>
        <textarea name="content" style="width: 500px; height: 700px;">${news.content}</textarea>
      </dl>
      <dl>分类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <select name="catgory">
          <c:forEach items="${catgory}" var="catgory">
          <c:if test="${catgory.id==news.catgory}">
            <option value="${catgory.id}" selected="selected">${catgory.catgory}</option>
          </c:if>
            <c:if test="${catgory.id!=news.catgory}">
              <option value="${catgory.id}">${catgory.catgory}</option>
            </c:if>
          </c:forEach>
        </select>
      </dl>
        <c:choose>
        <c:when test="${null == news.id || news.id.isEmpty()}">
      <dl>上传图片&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="file" name="file" value="">
      </dl>
        </c:when>
        <c:otherwise>
          <c:if test="${null != news.picname||news.picname!=''}">
          <p id="picname">${news.picname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="${ctx}/static/picture/icon.png" onclick="deletepic()"></p><input style="display: none;" type="text" id="pic" name="pic" value="${news.picname}">
          </c:if>
          <dl>上传图片&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="file" name="file" value="">
          </dl>
        </c:otherwise>
        </c:choose>
        <dl>
        <input type="submit" value="发表新闻">
        </dl>
      </div>
      </form>
    </div>
  </div>
  </div>
</body>
</html>
