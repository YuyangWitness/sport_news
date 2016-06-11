<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/21
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/common/taglibs.jspf" %>
<html>
<head>
    <title>添加管理员</title>
  <link rel="stylesheet" href="${ctx}/static/sys/css/style.css">
  <script src="${ctx}/static/common/jquery.jqGrid-3.8.2/js/jquery-1.4.2.min.js"></script>

  <style>
    #AdminAdd{margin: 20px auto; width:50%;}
    #AdminAdd dl{margin: 10px auto; width: 50%;}
  </style>
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

<div class="content"id="con_one_2">
  <div class="left-column">
    <div class="service">
      <h5>用户管理</h5>
    </div>
    <div class="tab3" id="tab3">
      <dl class="call">
        <div class="medo medo1">
          <dd id="colum1"><a href="${ctx}/user/init-user">用户管理</a></dd>
          <dd id="colum2"><a href="${ctx}/admin/init-admin">管理员管理</a></dd>
          <dd id="colum3"><a href="${ctx}/admin/init-addadmin">添加管理员</a></dd>
        </div>
      </dl>
    </div>
  </div>


  <div class="meduo meduo1">
    <div class="right-content" id="con_colum_1">
      <form action="${ctx}/admin/addadmin" method="post">
        <div id="AdminAdd">
          <input type="text" value="${admin.id}" name="id" style="display:none;"/>
          <p style="font-size: large; text-align: center; font-weight: 700;">管理员编辑</p>
          <dl>用户名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="username" value="${admin.username}"></dl>
          <dl>密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="password" value="${admin.password}"></dl>
          <dl>角色&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <select name="role">
                <c:if test="${admin.role.equals('1')}">
                <option value="1" selected="selected">普通管理员</option>
                 <option value="2">编辑管理员</option>
                </c:if>

                <c:if test="${admin.role.equals('2')}">
                  <option value="1" >普通管理员</option>
                  <option value="2" selected="selected">编辑管理员</option>
                </c:if>

                <c:if test="${null==admin.role}">
                  <option value="1" >普通管理员</option>
                  <option value="2">编辑管理员</option>
                </c:if>
              </select>
          </dl>
          <dl>
          <c:choose>
            <c:when test="${null == admin.id || admin.id.isEmpty()}">
              <input type="submit" value="添加管理员"></dl>
            </c:when>
          <c:otherwise>
            <input type="submit" value="修改管理员"></dl>
          </c:otherwise>
          </c:choose>
        </div>

      </form>
    </div>
  </div>
</div>
</body>
</html>
