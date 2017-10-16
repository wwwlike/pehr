<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>中部对外</title>
		<link rel="stylesheet" type="text/css" href="/css/identify.css" />
		<link rel="stylesheet" type="text/css" href="/css/layout.css" />
		<link rel="stylesheet" type="text/css" href="/css/account.css" />
		<link rel="stylesheet" type="text/css" href="/css/style.css" />
		<link rel="stylesheet" type="text/css" href="/css/control_index.css" />
		<link href="/css/h/font-awesome.css?v=4.4.0" rel="stylesheet">
		<link rel="shortcut" href="/favicon.ico" />
		<link rel="bookmark" href="/favicon.ico" type="image/x-icon" />
		<style type="text/css">
        .icon {
          /* 通过设置 font-size 来改变图标大小 */
          width: 1.5em; height: 1.5em;
          /* 图标和文字相邻时，垂直对齐 */
          vertical-align: -0.15em;
          /* 通过设置 color 来改变 SVG 的颜色/fill */
          fill: currentColor;
          /* path 和 stroke 溢出 viewBox 部分在 IE 下会显示
             normalize.css 中也包含这行 */
          overflow: hidden;
        }
   		 </style>

		<script type="text/javascript">
			function toLogin(){
				window.location.href='/login';
			}
		
		
		
		</script>
		<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="js/haidao.offcial.general.js"></script>
		<script type="text/javascript" src="js/select.js"></script>
		<script type="text/javascript" src="js/haidao.validate.js"></script>
		<script type="text/javascript" src="/css/fonts/iconFont/iconFont.js"></script>
		
		
	</head>

	<body>
		<div class="view-topbar">
			<div class="topbar-console">
				<div class="tobar-head fl">
					<a href="#" class="topbar-logo fl">
					<span><img src="Images/zfc4.png" width="20" height="20"/></span>
					</a>
					<a href="/index" class="topbar-home-link topbar-btn text-center fl"><span>${user.school==null?'中部对外':user.school.name}</span></a>
					
				</div>
				
			</div>
			<div class="topbar-info">
				<ul class="fl">
					<li class="fl dropdown topbar-notice topbar-btn">
					<a href="#" class="dropdown-toggle">
					<span class="icon-notice"></span>
					<span class="topbar-num have">0</span>
					<!--have表示有消息，没有消息去掉have-->
					</a>
					</li>
					<!--
										<li class="fl topbar-info-item strong">
					<div class="dropdown">
						<a href="#" class="dropdown-toggle topbar-btn">
						<span class="fl">工单服务</span>
						<span class="icon-arrow-down"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#">我的工单</a></li>
							<li><a href="#">提交工单</a></li>
						</ul>
					</div>
					</li>
					  -->
					<li class="fl topbar-info-item">
					<div class="dropdown">
						<a href="#" class="topbar-btn">
						<span class="fl text-normal">帮助与文档</span>
						<span class="icon-arrow-down"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#">模板开发手册</a></li>
							<li><a href="#">某某数据字典</a></li>
						</ul>
					</div>
					</li>
					<li class="fl topbar-info-item">
					<div class="dropdown">
						<a href="#" class="topbar-btn">
						<span class="fl text-normal">
							${user.name}
						<!--<sec:authentication property="name"/>-->
						</span>
						<span class="icon-arrow-down"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="login">退出</a></li>
						</ul>
					</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="view-body">
			<div class="view-sidebar">
				<div class="sidebar-content">
			
				<c:forEach var="u" items="${menus}">
					<div class="sidebar-nav">
						<div class="sidebar-title">
							<a href="#">
								<span class="icon"><b class="fl icon-arrow-down"></b></span>
								<span class="text-normal">${u.moduleName}</span>
							</a>
						</div>
						<ul class="sidebar-trans">
						<c:forEach var="menu" items="${u.subs}">
							<li>
							
							
								<a href="${menu.url}" target="mainPage" >
								
								<!-- <i class="fa ${menu.cls==null?'fa-check-square-o':menu.cls}"></i> -->
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="text-normal">
								<svg class="icon" aria-hidden="true">
                        				<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#${menu.cls}"></use>
                    			</svg>&nbsp;&nbsp;&nbsp;&nbsp;
									${menu.name}</span>
								</a>
							</li>
							</c:forEach>
						</ul>
					</div>
					</c:forEach>
					
				</div>
			</div>
			<div class="view-product background-color">
				<div class="background-color"> <!-- padding-big 间隔大 -->
				<iframe name="mainPage" src="/school/list" style="height:100%"  width="100%" height="100%" ></iframe>
				</div>
			</div>
		</div>

		<script>
			$(".sidebar-title").live('click', function() {
				if ($(this).parent(".sidebar-nav").hasClass("sidebar-nav-fold")) {
					$(this).next().slideDown(200);
					$(this).parent(".sidebar-nav").removeClass("sidebar-nav-fold");
				} else {
					$(this).next().slideUp(200);
					$(this).parent(".sidebar-nav").addClass("sidebar-nav-fold");
				}
			});
		</script>
	</body>

</html>