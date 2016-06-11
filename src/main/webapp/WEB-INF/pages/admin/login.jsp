<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/25
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/common/taglibs.jspf" %>
<html>
<head>
    <title>管理员登录</title>
  <SCRIPT src="${ctx}/static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></SCRIPT>
  <STYLE>
    body{
  background: #ebebeb;
  font-family: "Helvetica Neue","Hiragino Sans GB","Microsoft YaHei","\9ED1\4F53",Arial,sans-serif;
  color: #222;
  font-size: 12px;
  }
  *{padding: 0px;margin: 0px;}
  .top_div{
  background: #008ead;
  width: 100%;
  height: 400px;
  }
  .ipt{
  border: 1px solid #d3d3d3;
  padding: 10px 10px;
  width: 290px;
  border-radius: 4px;
  padding-left: 35px;
  -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
  box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
  -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
  -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
  transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
  }
  .ipt:focus{
  border-color: #66afe9;
  outline: 0;
  -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
  box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
  }
  .u_logo{
  background: url("${ctx}/static/admin/images/username.png") no-repeat;
  padding: 10px 10px;
  position: absolute;
  top: 43px;
  left: 40px;

  }
  .p_logo{
  background: url("${ctx}/static/admin/images/password.png") no-repeat;
  padding: 10px 10px;
  position: absolute;
  top: 12px;
  left: 40px;
  }
  a{
  text-decoration: none;
  }
  .tou{
  background: url("${ctx}/static/admin/images/tou.png") no-repeat;
  width: 97px;
  height: 92px;
  position: absolute;
  top: -87px;
  left: 140px;
  }
  .left_hand{
  background: url("${ctx}/static/admin/images/left_hand.png") no-repeat;
  width: 32px;
  height: 37px;
  position: absolute;
  top: -38px;
  left: 150px;
  }
  .right_hand{
  background: url("${ctx}/static/admin/images/right_hand.png") no-repeat;
  width: 32px;
  height: 37px;
  position: absolute;
  top: -38px;
  right: -64px;
  }
  .initial_left_hand{
  background: url("${ctx}/static/admin/images/hand.png") no-repeat;
  width: 30px;
  height: 20px;
  position: absolute;
  top: -12px;
  left: 100px;
  }
  .initial_right_hand{
  background: url("${ctx}/static/admin/images/hand.png") no-repeat;
  width: 30px;
  height: 20px;
  position: absolute;
  top: -12px;
  right: -112px;
  }
  .left_handing{
  background: url("${ctx}/static/admin/images/left-handing.png") no-repeat;
  width: 30px;
  height: 20px;
  position: absolute;
  top: -24px;
  left: 139px;
  }
  .right_handinging{
  background: url("${ctx}/static/admin/images/right_handing.png") no-repeat;
  width: 30px;
  height: 20px;
  position: absolute;
  top: -21px;
  left: 210px;
  }

  </STYLE>

  <SCRIPT type="text/javascript">
  $(function(){
  //得到焦点
	$("#password").focus(function(){
  $("#left_hand").animate({
    left: "150",
  top: " -38"
  },{step: function(){
  if(parseInt($("#left_hand").css("left"))>140){
    $("#left_hand").attr("class","left_hand");
  }
  }}, 2000);
  $("#right_hand").animate({
    right: "-64",
  top: "-38px"
  },{step: function(){
  if(parseInt($("#right_hand").css("right"))> -70){
    $("#right_hand").attr("class","right_hand");
  }
  }}, 2000);
  });
  //失去焦点
	$("#password").blur(function(){
    $("#left_hand").attr("class","initial_left_hand");
    $("#left_hand").attr("style","left:100px;top:-12px;");
    $("#right_hand").attr("class","initial_right_hand");
    $("#right_hand").attr("style","right:-112px;top:-12px");
  });
  });

     function login(){
      $.ajax({
                type:"POST",
                url:"${ctx}/admin/adminlogin",
                data:{username:$("#username").val(),password:$("#password").val()},
                dataType:"json",
                success:function(text){
                  if(text=="0"){
                    $("#password").val("");
                    alert("用户不存在");
                  }else if(text=="1"){
                    window.location.href ="${ctx}/sys-news/Getindex"
                  }else{
                    $("#password").val("");
                    alert("密码错误");
                  }



                }

      });
     }
  </script>
  </head>
<body>
<DIV class="top_div"></DIV>
<DIV style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 200px; text-align: center;">
  <DIV style="width: 165px; height: 96px; position: absolute;">
    <DIV class="tou"></DIV>
    <DIV class="initial_left_hand" id="left_hand"></DIV>
    <DIV class="initial_right_hand" id="right_hand"></DIV></DIV>
  <P style="padding: 30px 0px 10px; position: relative;"><SPAN
          class="u_logo"></SPAN>         <INPUT class="ipt" type="text" placeholder="请输入用户名" id="username">
  </P>
  <P style="position: relative;"><SPAN class="p_logo"></SPAN>
    <INPUT class="ipt" id="password" type="password" placeholder="请输入密码" >
  </P>
  <DIV style="height: 50px; line-height: 50px; margin-top: 30px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
    <P style="margin: 0px 35px 20px 45px;">
        <input id="submit" onclick="login()" type="button" value="登录" style="background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;">
           </SPAN>         </P></DIV></DIV>

</body>
  </html>
