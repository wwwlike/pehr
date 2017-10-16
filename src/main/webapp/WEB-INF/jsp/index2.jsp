<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html class="AppTask">
	<head>
		<meta charset="UTF-8">
		<title>省级平台</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="shortcut" href="/favicon.ico" />
		<link rel="bookmark" href="/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/mingdao/css/xiaoxi-basic.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/mingdao/css/font.css"/>
		<!-- -->
		<link rel="stylesheet" type="text/css" href="/css/mdIonc.css"/>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mdQuery.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layer/skin/default/layer.css">
		<!--<link rel="stylesheet" type="text/css" href="/mingdao/css/dongtai.css"/>
		<script src="/mingdao/js/jquery.js" type="text/javascript" charset="utf-8"></script> -->
		<script src="${pageContext.request.contextPath}/mingdao/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/layer/layer.js"></script>
		<script src="${pageContext.request.contextPath}/mingdao/js/index.js" type="text/javascript" charset="utf-8"></script> 	
		<script src="${pageContext.request.contextPath}/js/zfc/news.js" type="text/javascript" charset="utf-8"></script> 	
		<style>
			#tasks .switchCreate.taskListScroll { padding-right: 37px; }
			#tasks .switchCreate.taskListNoScroll { padding-right: 20px; }
			
		.center-left-hr{
			height: 50px;width: 250px;
			position: fixed;
			border-right: 1px solid gainsboro;
		    border-top: 1px solid gainsboro;
		}
		.newsDiv{
			position: fixed;
			border-right: 1px solid gainsboro;
		    border-top: 1px solid gainsboro;
			overflow-y:scroll;
			width: 100%;
		}
					
		</style>
		<script type="text/javascript">
			function toLogin(){
				window.location.href='/login';
			}
		</script>
	
	</head>
	<body>
		<div id="container" class="clearfix">
			<div class="header">
				<div class="header-left">
					<ul>
						<li style="margin-top: -5px"><img src="Images/zfc5.png" width="30" height="30" /></li>
						<li>省级平台</li>
						
					</ul>
				</div>
				<div class="header-daohang">
					<ul>
						<c:forEach var="module" items="${menus}" varStatus="status">
							<li class="headModule" href="/index?id=${module.mid}" style="${module.mid==mid?'background-color: #2B76C9;':''} ">${module.moduleName}</li>
						</c:forEach>						
					</ul>
				</div>
				<div class="header-right" style="width: 300px">
					<ul class="header-right-1">
						<li style="width: 180px;">
							<img src="/mingdao/img/touxiang.png" width="35px" height="35px" class="touxiang"/>
						<div id="quanquan-font2">
								${user.name}
							</div>
						<div class="clear">
							
						</div>
						</li>
						
						<li style="position: relative;left:0px;">
							<i class="iconfont plus">&#xe608;</i>
							<div class="plus xjrw">
								<a href="/logout">退出</a>
							</div>
						</li>
						<!-- 
						<li style="position: relative;left: 60px;">
						<div class="bg-znss" id="bg-znss" tabindex="1" >
							<div class="bg-znsstb">
								<i class="iconfont" id="search">&#xe607;</i>
							</div>
							<div class="bg-znssfont">
								<span id="znss">
									智能搜索..
								</span>
								<input type="text" name="search" id="input-znss" placeholder="智能搜索.."/>
							</div>
							<div class="clear">
								
							</div>
						</div>
						</li>
						 -->
					</ul>
					<div class="renwukuang"  tabindex="2">
						<div class="rwksjx">
							<i class="iconfont" id="white-font">&#xe603;</i>
						</div>
						<div  class="renwuk">
							<div class="renwuk-1">
								<ul>
									<li class="rwk-1" href="">
										<i class="iconfont bluefont" >&#xe601;</i>
										<span id="black-font">
											创建学生
										</span>
									</li>
									<li class="rwk-1">
										<i class="iconfont bluefont" >&#xe605;</i>
										<span id="black-font">
											创建任务
										</span>
									</li>
									<li class="rwk-1">
										<i class="iconfont bluefont" >&#xe600;</i>
										<span id="black-font">
											创建日程
										</span>
									</li>
									<li class="rwk-1">
										<i class="iconfont bluefont" >&#xe601;</i>
										<span id="black-font">
											上传文件
										</span>
									</li>
									
								</ul>
							</div>
							<div class="renwuk-2">
								<ul>
									<li class="rwk-2">
										<i class="iconfont" style="color: #2B76C9;">&#xe60b;</i>
										<span id="black-font">
											邀请同事
										</span>
									</li>
									<li class="rwk-2">
										<i class="iconfont" style="color: #2B76C9;">&#xe60f;</i>
										<span id="black-font">
											创建群组
										</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="clear">
					
				</div>
			</div>
			
				<div class="center-left">
					<div class="center-left-header">
						<i class="iconfont sousuo">&#xe607;</i>
						<input class="sousuokuang" type="text" placeholder="搜索"/>
					</div>
					<div class="img_tubiao">
						<ul>
							<li class="l-dh1 l-dhbianhui" id="school" ><i class="iconfont img_tubiao-size">&#xe60d;</i></li>
							<li class="l-dh1 l-dhbianhui" id="sclass" ><i class="iconfont img_tubiao-size ">&#xe60b;</i></li>
							<li class="l-dh1 l-dhbianhui" id="user" ><i class="iconfont img_tubiao-size users">&#xe60f;</i></li>
							<li class="l-dh1 l-dhbianhui" id="student" ><i class="iconfont img_tubiao-size " >&#xe60e;</i></li>
						</ul>
					</div>
					
					<div class="center-left-daohang">
						<ul>
							<c:forEach var="module" items="${menus}" varStatus="status">
								<c:if test="${module.mid==mid}">
							<c:forEach var="menu" items="${module.subs}" varStatus="subStatus">		
								<li class="menuLi" style="" href="${menu.url}" >
								<a href="${menu.url}"  target="mainPage" >	</a>
									<i class="iconfont"  ></i>
									<span style="font-size: 12px;">${menu.name}</span>
								</li>
								</c:forEach>
								</c:if>
							</c:forEach>	
						</ul>
						<!-- 学校、班级、老师、学生 -->
						<div class="center-left-hr AppChat">
							<ul class="newsDiv news_school fancyHome" ></ul>
							<ul class="newsDiv news_sclass fancyHome"></ul>
							<ul class="newsDiv news_user fancyHome"></ul>
							<ul class="newsDiv news_student fancyHome"></ul>
						</div>
					</div>
					
					<div class="center-left-Box2 jihe yincang" >
						<div class="center-left-Bbox1">
							<div class="Box2-box1-xin">
								<div class="Box2-box1-header">
									<div class="Bbh-left">
										<i class="iconfont kminddle ssjx greyfont" style="font-size: 12px;">&#xe604;</i>
										<i class="iconfont kminddle xsjx greyfont" style="font-size: 12px;display: none;">&#xe602;</i>
										<span id="shierpxfont" >
											未关联部门用户
										</span>
									</div>
									<div class="Bbh-right">
										<span id="shisanpxfont">
											1
										</span>
									</div>
									<div class="clear">
										
									</div>
								</div>
								<div class="Box2-box1-middle">
									<img src="img/touxiang.png"/ width="48px" height="48px" class="Box2-box1-middle-touxiang" >
									<div class="Box2-box1-middle-mingzi">
										${user.name}
									</div>
									<div class="clear">
										
									</div>
								</div>
								<div class="Box2-box1-bottom" style="height: 20px;margin-top: 10px;font-size:13px ;margin-left: 15px;">
									1个联系人
								</div>
							</div>
							
						</div>
					</div>
					<div class="center-left-Box3 jihe yincang" >
						<div class="center-left-BBBbox1">
							
						</div>
					</div>
					<div class="center-left-Box4 jihe yincang" >
						<div class="center-left-BBbox1 bjhui" style="">
							<div class="box1-laba" style="margin-left: 18px;">
								<i class="iconfont" style="font-size: 32px;position: relative;top: 5px;left: 6px;color: white;">&#xe606;</i>
								
							</div>
							<div class="" style="float: left;margin-left: 15px;margin-top: 22px;font-size: 15px;">
									系统
							</div>
							<div class="clear">
								
							</div>
						</div>
						<div class="center-left-BBbox1 bjhui" >
							<div class="box1-laba" style="margin-left: 18px;">
								<i class="iconfont" style="font-size: 32px;position: relative;top: 5px;left: 6px;color: white;">&#xe601;</i>
								
							</div>
							<div class="" style="float: left;margin-left: 15px;margin-top: 22px;font-size: 15px;">
									动态
							</div>
							<div class="clear">
								
							</div>
						</div>
						<div class="center-left-BBbox1 bjhui" >
							<div class="box1-laba" style="margin-left: 18px;">
								<i class="iconfont" style="font-size: 32px;position: relative;top: 5px;left: 6px;color: white;">&#xe605;</i>
								
							</div>
							<div class="" style="float: left;margin-left: 15px;margin-top: 22px;font-size: 15px;">
									任务
							</div>
							<div class="clear">
								
							</div>
						</div>
						<div class="center-left-BBbox1" id="bjhui" >
							<div class="box1-laba" style="margin-left: 18px;">
								<i class="iconfont" style="font-size: 32px;position: relative;top: 5px;left: 6px;color: white;">&#xe600;</i>
								
							</div>
							<div class="" style="float: left;margin-left: 15px;margin-top: 22px;font-size: 15px;">
									日程
							</div>
							<div class="clear">
								
							</div>
						</div>
					</div>
					
					<div class="center-left-bottom" >
						<div class="pluskuangkuang-1" style="position: absolute;bottom:65px;left:20px;width: 200px;height: 90px;border: 1px solid gainsboro;box-shadow: 0px 0px 5px grey;display: none;outline: none;" tabindex="-1">
							<ul style="padding: 0px;margin: 0px;list-style-type: none;color: grey;">
								<li class="pluskuang-1" style="width: 185px;height:35px;text-align: left;padding-top: 10px;padding-left: 15px;">
								<i class="iconfont" style="font-size: 20px;">&#xe60d;</i>
									<span>发起聊天</span>
								</li>
								<li class="pluskuang-1" style="width: 185px;height:35px;text-align: left;padding-top: 10px;padding-left: 15px;">
								<i class="iconfont" style="font-size: 16px;">&#xe60f;</i>
									<span>创建群组</span>
								</li>
							</ul>
						</div>
						<div class="pluskuangkuang" >
							<i class="iconfont" style="position: relative;top: 9px;color: grey;">&#xe609;</i>
						</div>
					</div>
				</div>
				<div class="center-right">
				<!--  -->
				<c:forEach var="module" items="${menus}" varStatus="status">
						<c:if test="${module.mid==mid}">
						<c:forEach var="menu" items="${module.subs}" varStatus="subStatus">		
							<c:if test="${subStatus.index==0}">
							<iframe name="mainPage" id="mainPage" src="${menu.url}"  style="height:100%;border: none;border-width: 0px"  width="100%" height="100%"  ></iframe>
							
							</c:if>
							</c:forEach>
							</c:if>
				</c:forEach>
				</div>
		</div>
	</body>
	<script type="text/javascript">
	
	//模块点击
	$('.headModule').click(function(){
		location.href=$(this).attr('href');
	})
	//菜单点击
	$('.menuLi').click(function(){
		$('.menuLi').css("background-color","");
		$(this).css("background-color","#cfe8fc");
		mainPage.location.href=$(this).attr('href');
		
		
	})
	
	
	</script>
	
	
</html>

