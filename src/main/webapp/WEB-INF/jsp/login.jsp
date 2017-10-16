<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
    <title>中部对外</title>
    <meta name="keywords" content="中部对外" />
    <meta name="description" content="学生信息管理系统" />
    <link href="css/layout.css" rel="stylesheet" />
    <link href="css/login.css" rel="stylesheet"/>
    <style>
        .ibar {
            display: none;
        }
    </style>
    <script type="text/javascript">
    if(window.top!=window.self){//存在父页面
    	parent.toLogin();
    }

    
    </script>
</head>

<body class="login-bg">
    <div class="main ">
        <!--登录-->
        <div class="login-dom login-max">
            <div class="logo text-center">
                <a href="#">
                    <img src="images/zfc4.png" width="180px" height="180px" />
                </a>
            </div>
            <div class="login container " id="login">
                <p class="text-big text-center logo-color">
                </p>
                <p class="text-center margin-small-top logo-color text-small">
                华中区国际高端人才选拔中心
                </p>
                <form class="login-form" action=""  method="post" autocomplete="off">
                    <div class="login-box border text-small" id="box">
                        <div class="name border-bottom">
                            <input type="text" placeholder="手机/邮箱/账号"  datatype="*" class="username" nullmsg="请填写帐号信息" />
                        </div>
                        <div class="pwd">
                            <input type="password" placeholder="密码" datatype="*" id="password" class="password" name="password" nullmsg="请填写帐号密码" />
                        </div>
                    </div>
                    <input type="button" onclick="login()" class="btn text-center login-btn" value="立即登录" />
                </form>
                <div class="forget">
                   
                    <a href="#" class="forget-pwd text-small fl"> 忘记登录密码？</a><a href="#" class="forget-new text-small fr" id="forget-new">注册账号</a>
                </div>
            </div>
        </div>
        <div class="footer text-center text-small ie" >
           武汉中部对外经济技术合作有限公司 Copyright 2013-2016 版权所有 ©whzbdw 2017-2018      <a href="#" target="_blank" >鄂ICP备88888888号-8</a>
            <span class="margin-left margin-right">|</span>
            <script src="#" language="JavaScript"></script>
        </div>
        <div class="popupDom">
            <div class="popup text-default">
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript">
    function popup_msg(msg) {
        $(".popup").html("" + msg + "");
        $(".popupDom").animate({
            "top": "0px"
        }, 400);
        setTimeout(function () {
            $(".popupDom").animate({
                "top": "-40px"
            }, 400);
        }, 2000);
    };
    
    function login(){
    	var username=$(".username").val();
    	var password=$(".password").val();
    	$.ajax({
    		type: "post",
    		url: "${pageContext.request.contextPath}/login",
    		data:{
    			'username':username,
    			'password':password
    		},
    		success: function(data) {
    			if(data=='error'){
    				alert("用户名或密码错误");
    			}else{
    				location.href="${pageContext.request.contextPath}/index";
    			}
    		}})
    };

    /*动画（注册）*/
    $(document).ready(function (e) {
        // $("input[name=username]").focus();
        // $('.login-form').Validform({
        // 	ajaxPost: true,
        // 	tiptype: function(msg) {
        // 		if (msg) popup_msg('' + msg + '');
        // 	},
        // 	callback: function(ret) {
        // 		popup_msg('' + ret.info + '');
        // 		if (ret.status == 1) {
        // 			if (ret.uc_user_synlogin) {
        // 				$("body").append(ret.uc_user_synlogin);
        // 			}
        // 			setTimeout("window.location='" + ret.url + "'", 2000);
        // 		}
        // 	}
        // })

    });
</script>
</html>