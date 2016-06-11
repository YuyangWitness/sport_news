<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/10
  Time: 20:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/common/taglibs.jspf" %>
<html>
<head>
    <title>系统管理</title>
  <link rel="stylesheet" href="${ctx}/static/sys/css/style.css">


  <script type="text/javascript" src="${ctx}/static/sys/js/date.js"></script>
  <script src="${ctx}/static/common/jquery.jqGrid-3.8.2/js/jquery-1.4.2.min.js"></script>
  <link href="${ctx}/static/common/jquery.jqGrid-3.8.2/css/ui.jqgrid.css" rel="stylesheet"/>
  <script src="${ctx}/static/common/jquery.jqGrid-3.8.2/js/i18n/grid.locale-en.js"></script>
  <script src="${ctx}/static/common/jquery.jqGrid-3.8.2/js/jquery.jqGrid.min.js"></script>


  <script>
    $(document).ready(function(){
      $("#one1,#one2,#one3,#one4,#one5").click(function(){
        $("#con_one_6").css("display","none")
      })
      $("#one0").click(function(){
        $("#con_one_6").css("display","block")
      })


    });

    function pageInit(){
      jQuery("#list2").jqGrid(
              {
                url : '${ctx}/sys-news/GetNewsList',
                datatype : "json",
                colNames : [ '标题', '分类', '日期', '点赞数', '评论数'],
                colModel : [
                  {name : 'title',index : 'title',width : 250},
                  {name : 'catgory',index : 'catgory',width : 150},
                  {name : 'subDate',index : 'subDate',width : 150},
                  {name : 'goodNum',index : 'goodNum',width : 150,align : "right"},
                  {name : 'commentNum',index : 'commentNum',width : 150,align : "right"}

                ],
                rowNum : 10,
                height:'390',
                scroll: false,
                width: '100%',
                rowNum: 10,
                rowList : [ 10, 20, 30 ],
                pager : '#pager2',
                sortname : 'id',
                mtype : "post",
                viewrecords : true,
                sortorder : "desc",
                prmNames:{
                  page:"pageNumber",rows:"pageSize", sort:"sidx",order:"sord"
                }
              });
      jQuery("#list2").jqGrid('navGrid', '#pager2', {edit : false,add : false,del : false});
    }
  </script>
  <style>
    #list2{
      margin: 5% auto;
      width: 700px;
      border: 2px solid #234686;
     border-radius: 10px;
    }

    #head{
      border-bottom: 1px solid #234686;
    }
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
<div class="content" id="con_one_6" style="display:block;">
  <div class="meduo">
    <div class="hyy">

    </div>
  </div>
</div>


<div class="content"id="con_one_2" style="display:none;">
  <div class="left-column">
    <div class="service">
      <h5>财务管理</h5>
    </div>
    <div class="tab3" id="tab3">
      <dl class="call">
        <div class="medo medo1">
          <dt>收费中心</dt>
          <dd id="colum1" onclick="setTab('colum',1)" ><a href="#">水费</a></dd>
          <dd id="colum2" onclick="setTab('colum',2)"><a href="#">电费</a></dd>
          <dd id="colum3" onclick="setTab('colum',3)"><a href="#">燃气费</a></dd>
          <dd id="colum4" onclick="setTab('colum',4)"><a href="#">电视费</a></dd>
          <dd id="colum5" onclick="setTab('colum',5)"><a href="#">电梯费</a></dd>
          <dd id="colum6" onclick="setTab('colum',6)"><a href="#">卫生费</a></dd>
        </div>
      </dl>
    </div>
  </div>

  <div class="meduo meduo1">
    <div class="right-content" id="con_colum_1">
      <center>
        <span style="font-size:100px;"> 7</span>
      </center>
    </div>
    <div class="right-content" id="con_colum_2" style="display:none">
      <center>
        <span style="font-size:100px;"> 8</span>
      </center>
    </div>
    <div class="right-content" id="con_colum_3" style="display:none">
      <center>
        <span style="font-size:100px;"> 9</span>
      </center>
    </div>
    <div class="right-content" id="con_colum_4" style="display:none">
      <center>
        <span style="font-size:100px;"> 10</span>
      </center>
    </div>
    <div class="right-content" id="con_colum_5" style="display:none">
      <center>
        <span style="font-size:100px;">11</span>
      </center>
    </div>
    <div class="right-content" id="con_colum_6" style="display:none">
      <center>
        <span style="font-size:100px;">12</span>
      </center>
    </div>
  </div>
</div>
<div class="content"id="con_one_3" style="display:none;">
  <div class="left-column">
    <div class="service">
      <h5>家政服务</h5>
    </div>
    <div class="tab4" id="tab4">
      <dl class="call">
        <div class="medo medo2">
          <dt>服务中心</dt>
          <dd id="colun1" onclick="setTab('colun',1)" ><a href="#">租房服务</a></dd>
          <dd id="colun2" onclick="setTab('colun',2)"><a href="#">售房服务</a></dd>
          <dd id="colun3" onclick="setTab('colun',3)"><a href="#">客户服务</a></dd>
          <dd id="colun4" onclick="setTab('colun',4)"><a href="#">纠纷服务</a></dd>
          <dd id="colun5" onclick="setTab('colun',5)"><a href="#">法律服务</a></dd>
          <dd id="colun6" onclick="setTab('colun',6)"><a href="#">民生服务</a></dd>
        </div>
      </dl>
    </div>
  </div>


  <div class="meduo meduo2">
    <div class="right-content" id="con_colun_1">
      <center>
        <span style="font-size:100px;"> 13</span>
      </center>
    </div>
    <div class="right-content" id="con_colun_2" style="display:none">
      <center>
        <span style="font-size:100px;"> 14</span>
      </center>
    </div>
    <div class="right-content" id="con_colun_3" style="display:none">
      <center>
        <span style="font-size:100px;"> 15</span>
      </center>
    </div>
    <div class="right-content" id="con_colun_4" style="display:none">
      <center>
        <span style="font-size:100px;"> 16</span>
      </center>
    </div>
    <div class="right-content" id="con_colun_5" style="display:none">
      <center>
        <span style="font-size:100px;">17</span>
      </center>
    </div>
    <div class="right-content" id="con_colun_6" style="display:none">
      <center>
        <span style="font-size:100px;">18</span>
      </center>
    </div>
  </div>
</div>
<div class="content"id="con_one_4" style="display:none;">
  <div class="left-column">
    <div class="service">
      <h5>资源管理</h5>
    </div>
    <div class="tab5" id="tab5">
      <dl class="call">
        <div class="medo medo3">
          <dt>资源管理</dt>
          <dd id="colunm1" onclick="setTab('colunm',1)" ><a href="#">节约用水</a></dd>
          <dd id="colunm2" onclick="setTab('colunm',2)"><a href="#">节约用电</a></dd>
          <dd id="colunm3" onclick="setTab('colunm',3)"><a href="#">注意防水</a></dd>
          <dd id="colunm4" onclick="setTab('colunm',4)"><a href="#">注意防火</a></dd>
          <dd id="colunm5" onclick="setTab('colunm',5)"><a href="#">关紧门窗</a></dd>
          <dd id="colunm6" onclick="setTab('colunm',6)"><a href="#">务要扰民</a></dd>
        </div>
      </dl>
    </div>
  </div>
  <div class="meduo meduo3">
    <div class="right-content" id="con_colunm_1">
      <center>
        <span style="font-size:100px;"> 19</span>
      </center>
    </div>
    <div class="right-content" id="con_colunm_2" style="display:none">
      <center>
        <span style="font-size:100px;"> 20</span>
      </center>
    </div>
    <div class="right-content" id="con_colunm_3" style="display:none">
      <center>
        <span style="font-size:100px;"> 21</span>
      </center>
    </div>
    <div class="right-content" id="con_colunm_4" style="display:none">
      <center>
        <span style="font-size:100px;"> 22</span>
      </center>
    </div>
    <div class="right-content" id="con_colunm_5" style="display:none">
      <center>
        <span style="font-size:100px;">23</span>
      </center>
    </div>
    <div class="right-content" id="con_colunm_6" style="display:none">
      <center>
        <span style="font-size:100px;">24</span>
      </center>
    </div>
  </div>
</div>



<div class="content"id="con_one_5" style="display:none;">
  <div class="left-column">
    <div class="service">
      <h5>系统管理</h5>
    </div>
    <div class="tab6" id="tab6">
      <dl class="call">
        <div class="medo medo4">
          <dt>系统管理</dt>
          <dd id="colnm1" onclick="setTab('colnm',1)" ><a href="#">系统设置</a></dd>
          <dd id="colnm2" onclick="setTab('colnm',2)"><a href="#">内容设置</a></dd>
          <dd id="colnm3" onclick="setTab('colnm',3)"><a href="#">栏目设置</a></dd>
          <dd id="colnm4" onclick="setTab('colnm',4)"><a href="#">功能设置</a></dd>
          <dd id="colnm5" onclick="setTab('colnm',5)"><a href="#">页面管理</a></dd>
          <dd id="colnm6" onclick="setTab('colnm',6)"><a href="#">退出管理</a></dd>
        </div>
      </dl>
    </div>
  </div>
  <div class="meduo meduo4">
    <div class="right-content" id="con_colnm_1" style="display:none">
      <center>
        <span style="font-size:100px;"> 25</span>
      </center>
    </div>
    <div class="right-content" id="con_colnm_2" style="display:none">
      <center>
        <span style="font-size:100px;"> 26</span>
      </center>
    </div>
    <div class="right-content" id="con_colnm_3" style="display:none">
      <center>
        <span style="font-size:100px;"> 27</span>
      </center>
    </div>
    <div class="right-content" id="con_colnm_4" style="display:none">
      <center>
        <span style="font-size:100px;"> 28</span>
      </center>
    </div>
    <div class="right-content" id="con_colnm_5" style="display:none">
      <center>
        <span style="font-size:100px;">29</span>
      </center>
    </div>
    <div class="right-content" id="con_colnm_6" style="display:none">
      <center>
        <span style="font-size:100px;">30</span>
      </center>
    </div>
  </div>
</div>
</body>
</html>
