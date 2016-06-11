<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/9
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/static/common/taglibs.jspf" %>
<html lang="en" class="login-content" data-ng-app="materialAdmin">
<head>
    <title>用户登录界面</title>

<%--    <%@include file="/WEB-INF/pages/common/import-js-jquery-validation-engine.jspf" %>--%>

    <link rel="shortcut icon" type="image/x-icon" href="${ctx}/static/user/favicon.ico" />
    <!-- Vendor CSS -->
    <link href="${ctx}/static/user/css/material-design-iconic-font/css/material-design-iconic-font.min.css" rel="stylesheet" type="text/css">
    <!-- CSS -->
    <link href="${ctx}/static/user/css/app.min.1.css" rel="stylesheet" type="text/css">
</head>
<body class="login-content" data-ng-controller="loginCtrl as lctrl">

<div class="lc-block" id="l-login" data-ng-class="{'toggled':lctrl.login === 1}">
    <h1 class="lean">登录</h1>

    <div class="input-group m-b-20">
    		<span class="input-group-addon">
    			<i class="zmdi zmdi-account"></i>
    		</span>
        <div class="fg-line">
            <input id="loginName" type="text" class="form-control" placeholder="Username" regex="^\w{3,16}$"/>
        </div>
    </div>

    <div class="input-group m-b-20">
    		<span class="input-group-addon">
    			<i class="zmdi zmdi-male"></i>
    		</span>
        <div class="fg-line">
            <input id="loginPassword" type="password" class="form-control" placeholder="Password" regex="^\w+"/>
        </div>
    </div>

    <div class="clearfix"></div>

    <div class="checkbox">
        <label>
            <input type="checkbox" value="" />
            <i class="input-helper">
                保持登录状态
            </i>
        </label>
    </div>

    <a href="" class="btn btn-login btn-danger btn-float" id="login">
        <i class="zmdi zmdi-arrow-forward"></i>
    </a>

    <ul class="login-navigation">
        <li class="bgm-red" data-ng-click="lctrl.login = 0; lctrl.register = 1">Register</li>
        <li data-block="#l-forget-password" class="bgm-orange" data-ng-click="lctrl.login = 0; lctrl.forgot = 1">Forgot Password?</li>
    </ul>
  <%--  <input type="submit" id="login" style="display: none">--%>

</div>


<form action="${ctx}/user/register" method="post">
<div class="lc-block" id="l-register" data-ng-class="{ 'toggled': lctrl.register === 1 }" data-ng-if="lctrl.register === 1">
    <h1 class="lean">注册用户</h1>

    <div class="input-group m-b-20">
    		<span class="input-group-addon">
    			<i class="zmdi zmdi-account"></i>
    		</span>
        <div class="fg-line">
            <input name="username" type="text" class="form-control" placeholder="Username" regex="^\w{3,16}$"/>
        </div>
    </div>

    <div class="input-group m-b-20">
    		<span class="input-group-addon">
    			<i class="zmdi zmdi-email"></i>
    		</span>
        <div class="fg-line">
            <input name="email" type="text" class="form-control" placeholder="Email Address" regex="^\w+@\w+\.[a-zA-Z]+(\.[a-zA-Z]+)?$"/>
        </div>
    </div>

    <div class="input-group m-b-20">
    		<span class="input-group-addon">
    			<i class="zmdi zmdi-email"></i>
    		</span>
        <div class="fg-line">
            <input name="name" type="text" class="form-control" placeholder="Your Name" />
        </div>
    </div>

    <div class="input-group m-b-20">
    		<span class="input-group-addon">
    			<i class="zmdi zmdi-male"></i>
    		</span>
        <div class="fg-line">
            <input name="password" type="password" class="form-control" placeholder="Password" regex="^\w+"/>
        </div>
    </div>

    <div class="clearfix"></div>

    <div class="checkbox">
        <label>
            <input type="checkbox" value=""/>
            <i class="input-helper"></i>
            接受许可协议
        </label>
    </div>

    <a href="" class="btn btn-login btn-danger btn-float" onclick="$('#register').click()"><i class="zmdi zmdi-arrow-forward"></i></a>

    <ul class="login-navigation">
        <li data-block="#l-login" class="bgm-green" data-ng-click="lctrl.register = 0; lctrl.login = 1">Login</li>
        <li data-block="#l-forget-password" class="bgm-orange" data-ng-click="lctrl.register = 0; lctrl.forgot = 1">Forgot Password?</li>
    </ul>
    <input type="submit" id="register" style="display: none">
</div>
</form>

<div class="lc-block" id="l-forget-password" data-ng-class="{ 'toggled': lctrl.forgot === 1 }" data-ng-if="lctrl.forgot === 1">
    <h1 class="lean">用户中心</h1>
    <p class="text-left">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu risus. Curabitur commodo lorem fringilla enim feugiat commodo sed ac lacus.</p>
    <div class="input-group m-b-20">
        <span class="input-group-addon"><i class="zmdi zmdi-email"></i></span>
        <div class="fg-line">
            <input type="text" class="form-control" placeholder="Email Address" regex="^\w+@\w+\.[a-zA-Z]+(\.[a-zA-Z]+)?$"/>
        </div>
    </div>

    <a href="" class="btn btn-login btn-danger btn-float"><i class="zmdi zmdi-arrow-forward"></i></a>

    <ul class="login-navigation">
        <li data-block="#l-login" class="bgm-green" data-ng-click="lctrl.forgot = 0; lctrl.login = 1">Login</li>
        <li data-block="#l-register" class="bgm-red" data-ng-click="lctrl.forgot = 0; lctrl.register = 1">Register</li>
    </ul>
</div>
</body>

<script src="${ctx}/static/user/js/bower_components/jquery/dist/jquery.min.js"></script>
<script src="${ctx}/static/user/js/log.js"></script>
<!-- Angular -->
<script src="${ctx}/static/user/js/bower_components/angular/angular.min.js"></script>
<script src="${ctx}/static/user/js/bower_components/angular-resource/angular-resource.min.js"></script>
<script src="${ctx}/static/user/js/bower_components/angular-animate/angular-animate.min.js"></script>


<!-- Angular Modules -->
<script src="${ctx}/static/user/js/bower_components/angular-ui-router/release/angular-ui-router.min.js"></script>
<script src="${ctx}/static/user/js/bower_components/angular-loading-bar/src/loading-bar.js"></script>
<script src="${ctx}/static/user/js/bower_components/oclazyload/dist/ocLazyLoad.min.js"></script>
<script src="${ctx}/static/user/js/bower_components/angular-bootstrap/ui-bootstrap-tpls.min.js"></script>

<!-- Common js -->
<script src="${ctx}/static/user/js/bower_components/angular-nouislider/src/nouislider.min.js"></script>
<script src="${ctx}/static/user/js/bower_components/ng-table/dist/ng-table.min.js"></script>

<!-- Placeholder for IE9 -->
<!--[if IE 9 ]>
<script src="${ctx}/static/user/js/bower_components/jquery-placeholder/jquery.placeholder.min.js"></script>
<![endif]-->
<!-- App level -->
<script src="${ctx}/static/user/js/app.js"></script>
<script src="${ctx}/static/user/js/controllers/main.js"></script>
<script src="${ctx}/static/user/js/controllers/ui-bootstrap.js"></script>
<script src="${ctx}/static/common/jquery-1.12.1.min.js"></script>

<!-- Template Modules -->
<script src="${ctx}/static/user/js/modules/form.js"></script>

<script>
    $("#login").click(function(){
        $.ajax({
          type:"POST",
          url:"${ctx}/user/login",
          data:{username:$("#loginName").val(),password:$("#loginPassword").val()},
          dataType:"json",
          success:function(text){
              if(text=="0"){
                  $("#loginPassword").val("");
                  alert("用户不存在");
              }else if(text=="1"){
                  window.location.href ="${ctx}/user/init-index"
              }else{
                  $("#loginPassword").val("");
                  alert("密码错误");
              }



          }

        });
    });
</script>
</html>
