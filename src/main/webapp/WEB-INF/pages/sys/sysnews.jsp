<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/18
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/common/taglibs.jspf" %>
<html>
<head>
    <title>新闻管理</title>
  <link rel="stylesheet" href="${ctx}/static/sys/css/style.css">
  <script src="${ctx}/static/common/jquery.jqGrid-3.8.2/js/jquery-1.4.2.min.js"></script>
  <link href="${ctx}/static/common/jquery.jqGrid-3.8.2/css/css/ui.jqgrid-bootstrap-ui.css" rel="stylesheet"/>
  <script src="${ctx}/static/common/jquery.jqGrid-3.8.2/js/i18n/grid.locale-en.js"></script>
  <script src="${ctx}/static/common/jquery.jqGrid-3.8.2/js/jquery.jqGrid.min.js"></script>
<script>
  $(document).ready(function(){

    pageInit();
  });

  function pageInit(){

  jQuery("#list2").jqGrid(
  {
  url : '${ctx}/sys-news/GetNewsList',
  datatype : "json",
  colNames : [ '标题', '分类', '日期', '点赞数', '评论数','操作'],
  colModel : [
  {name : 'title',index : 'title',width : 250,align : "center"},
  {name : 'catgory',index : 'catgory',width : 150,align : "center"},
  {name : 'date',index : 'date',width : 150,align : "center"},
  {name : 'goodNum',index : 'goodNum',width : 150,align : "center"},
  {name : 'commentNum',index : 'commentNum',width : 150,align : "center"},
    {name : 'id',index : 'id',width : 150,align : "center",formatter:function(cellvalue, options, rowObject){
      var msgsearch = '<a href="${ctx}/complain/init-search?complainBillCode='+cellvalue+'" >[查看]</a> &nbsp;&nbsp;';
      var msgdelete = '<a href="${ctx}/sys-news/DeleteNew?id='+cellvalue+'" >[删除]</a> &nbsp;&nbsp;';
      var msgmodify = '<a href="${ctx}/sys-news/ModifyNew?id='+cellvalue+'" >[修改]</a> &nbsp;&nbsp;';
      return msgsearch+msgdelete+msgmodify;
    }
    }
  ],
  rowNum : 10,
  height:'390',
  scroll: false,
  width: '100%',
  rowNum: 10,
  rowList : [ 10, 20, 30 ],
  pager : '#pager2',
  mtype : "post",
  viewrecords : true,
    prmNames:{
  page:"pageNumber",rows:"pageSize", sort:"sidx",order:"sord"
  },
    jsonReader: {
      root: "list",
      page:"pageSize",
      total:"pageNum",
      records:"size",
      repeatitems: false
    }


  });
    jQuery("#list2").jqGrid('navGrid', '#pager2', {edit : false,add : false,del : false});
  }


  function search(){
    //此处可以添加对查询数据的合法验证
    var orderId = $("#orderId").val();
    jQuery("#list2").jqGrid('setGridParam',{
      datatype:'json',
      postData:{'title':$("#title").val()}, //发送数据
      page:1
    }).trigger("reloadGrid"); //重新载入
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

  <div class="meduo">
    <div class="right-content" id="con_column_1">
      <div class="ck">
        <P id="searchNew">标题查询<input type="text" name="title" id="title"><input type="button" id="newsSearch" value="查询" onclick="search()"></P>

        <table width ="100%" border="1" cellspacing="0" cellpadding="0" id="list2"></table>
        <div id="pager2"></div>
        <%--<table>
          <tr id="head">
            <th>序号</th>
            <th>标题</th>
            <th>分类</th>
            <th>发表时间</th>
            <th>评论数</th>
            <th>点赞数</th>
            <th>操作</th>
          </tr>
        </table>--%>


      </div>

    </div>
  </div>
  </div>
</body>
</html>
