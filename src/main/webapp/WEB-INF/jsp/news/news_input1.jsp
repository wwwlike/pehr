<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/citms.tld" prefix="citms" %>

<!DOCTYPE html>
<html class="AppChat">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>layout 后台大布局 - Layui</title>

  <link rel="shortcut icon" href="favicon.ico"> 
  <link href="/css/h/bootstrap.min.css?v=3.3.5" rel="stylesheet">
  <link href="/css/h/font-awesome.css?v=4.4.0" rel="stylesheet">
  <link href="/css/h/animate.css" rel="stylesheet">
  <link href="/css/h/style.css?v=4.0.0" rel="stylesheet"><base target="_blank">
  <link rel="stylesheet" type="text/css" href="/css/news.css"/>
  
  <script src="/mingdao/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>

  <script src="/js/h/plugins/layer/laydate/laydate.js"></script>
  <script src="/js/h/plugins/iCheck/icheck.min.js"></script>
  <script src="/js/h/plugins/validate/jquery.validate.min.js"></script>
  <script src="/js/h/plugins/validate/messages_zh.min.js"></script>


</head>
<body class="fancyHome">


<div id="sessionWinList" class="sessionWinList relativeContainer">
	<div class="sessionWin  isLoading" data-id="undefined" id="sw-undefined" data-type="undefined"> 
		<div class="TxtCenter TxtMiddle mTop10 mBottom10 w100">
			<div class="divCenter MdLoader MdLoader--middle">
				<svg class="MdLoader-circular">
					<circle class="MdLoader-path" stroke-width="3" cx="15" cy="15" r="12"></circle>
				</svg>
			</div>
		</div>
	</div> 
<div id="chatInvite" class="sessionWin inviteWin"> 
	<div class="inviteContainer"> 
		<p class="inviteTitle">还没有新的联系人，通过下面的方式邀请吧！</p> 
		<div class="inviteContainerInner"></div> 
	</div> 
</div> 
<div id="noSession" class="sessionWin noSession"> 
	<div class="chat" style="top: 0;"> 
		<div class="detail"> 
			<img src="/modules/mdpublic/chat/resource/images/noSession.png" alt="选择chatHome聊天对象"> 
			<div>您好，欢迎使用明道</div> 
		</div> 
	</div> 
	<div class="ThemeBG layerBlured"></div> 
</div> 
<div class="sessionWin active">  
	<div class="sessionHeader clearfix">  
		<div class="pullRight sessionAction" style="width:338px;"> 
			<span class="chatIconButton chatIconButton-groupInfoSwitch js-groupSwitchSide tip-bottom-left ThemeColor3" data-tip="显示会话详情"> 
				<i class="icon-sidebar-up"></i> 
			</span> 
			<span class="chatIconButton btnCreateGroup ThemeColor3 tip-bottom-left" data-tip="发起聊天"> 
				<i class="icon-chat-person-add"></i> 
			</span> 
			<div class="searchHeader" style="width:229px;"> 
				<div class="searchInputContainer"> 
					<input type="text" class="searchInput ThemeBorderColor3 js-searchBarInput" placeholder="搜索文件或聊天记录"> 
					<span class="searchIcon icon-search"></span> 
					<div class="GroupInfoSearchClose js-cleanSearchKeyword"> 
						<span class="icon-task-delete js-searchBarClose"></span> 
					</div> 
				</div> 
			</div> 
		</div> 
		<a href="/user_1371b080-e78e-4691-926d-20a59d152bfa" class="pullLeft sessionHeader-name" target="_blank">胡蝶</a>  
	</div> 
	<div class="chat"> 
	<!--聊天窗口-->
		<div class="msgPanel"> 
			<div class="nano has-scrollbar"> 
				<div class="msgList nano-content" tabindex="0" style="right: -5px;"> 
					<div class="btnLoadMore listStatus noMoreTip">没有更早的历史消息了</div>
					<div  class="msgItem">
						<div class="Message">
							<div class="Message-timestamp" >
								<div class="Message-timestamp-content" data-reactid=".e.1.0">4月24日 08:26</div>
							</div>
							<div class="Message-container msgContent" style="padding:15px 20px 5px;" >
								<div class="Message-toolbar-wrapper">
									<div class="Message-toolbar js-messageToolbar">
										<div class="Message-toolbarItem">
											<span class="Message-toolbarItemBtn ThemeColor3" data-tip="回复此段">
												<i class="icon-quote-left"></i>
											</span>
										</div>
										<div class="Message-toolbarItem">
											<span class="Message-toolbarItemBtn ThemeColor3" data-tip="创建为动态" >
												<i class="icon-dynamic-empty"></i>
											</span>
										</div>
										<div class="Message-toolbarItem" >
											<span class="Message-toolbarItemBtn ThemeColor3" data-tip="更多" >
												<i class="icon-more_horiz" ></i>
											</span>
											<noscript ></noscript>
										</div>
									</div>
								</div>
								<div class="Message-from" >
									<img class="Message-from-avatar" src="https://dn-mdpic.qbox.me/UserAvatar/55302f56-e38f-4ecc-826c-07ee19055b90.jpg?imageView2/1/w/100/h/100/q/100" alt="胡蝶" >
								</div>
								<div class="Message-body" >
									<div class="Message-title">
										<div class="Message-from-name" >胡蝶</div>
									</div>
									<div class="Message-content" >
										<div class="text" >超哥，今天是不是我进行走查代码</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 
					<div data-time="2017-04-24 08:44:44.240" class="msgItem" data-id="14929946842384" data-waiting-id="0"><div class="Message" data-cardid="" data-reactid=".f"><div class="Message-timestamp" data-reactid=".f.1"><div class="Message-timestamp-content" data-reactid=".f.1.0">4月24日 08:44</div></div><div class="Message-container msgContent" style="padding:15px 20px 5px;" data-reactid=".f.2"><div class="Message-toolbar-wrapper" data-reactid=".f.2.0"><div class="Message-toolbar js-messageToolbar" data-reactid=".f.2.0.0"><div class="Message-toolbarItem" data-reactid=".f.2.0.0.0"><span class="Message-toolbarItemBtn ThemeColor3" data-tip="回复此段" data-reactid=".f.2.0.0.0.0"><i class="icon-quote-left" data-reactid=".f.2.0.0.0.0.0"></i></span></div><div class="Message-toolbarItem" data-reactid=".f.2.0.0.1"><span class="Message-toolbarItemBtn ThemeColor3" data-tip="创建为动态" data-reactid=".f.2.0.0.1.0"><i class="icon-dynamic-empty" data-reactid=".f.2.0.0.1.0.0"></i></span></div><div class="Message-toolbarItem" data-reactid=".f.2.0.0.3"><span class="Message-toolbarItemBtn ThemeColor3" data-tip="更多" data-reactid=".f.2.0.0.3.0"><i class="icon-more_horiz" data-reactid=".f.2.0.0.3.0.0"></i></span><noscript data-reactid=".f.2.0.0.3.1"></noscript></div></div></div><div class="Message-from" data-reactid=".f.2.1"><img class="Message-from-avatar" src="https://dn-mdpic.qbox.me/UserAvatar/14db40d9-bca8-4c93-a232-06ce1a17466a.png?imageView2/1/w/100/h/100/q/100" alt="董立超" data-reactid=".f.2.1.0"></div><div class="Message-body" data-reactid=".f.2.2"><div class="Message-title" data-reactid=".f.2.2.0"><div class="Message-from-name ThemeColor3" data-reactid=".f.2.2.0.0">我</div></div><div class="Message-content" data-reactid=".f.2.2.1"><div class="text" data-reactid=".f.2.2.1.1">好吧，目前就我们2个轮流吧。<br></div></div></div></div></div></div>
					 -->
					<!--  
					<div data-time="2017-09-20 11:39:09.615" class="msgItem" data-id="15058787496132" data-waiting-id="0"><div class="Message" data-cardid="30607d75-6b93-4c25-8666-8703fa254036" data-reactid=".g" recurtime=""><div class="Message-timestamp" data-reactid=".g.1"><div class="Message-timestamp-content" data-reactid=".g.1.0">昨天 11:39</div></div><div class="Message-container msgContent" style="padding:15px 20px 5px;" data-reactid=".g.2"><div class="Message-toolbar-wrapper" data-reactid=".g.2.0"><div class="Message-toolbar js-messageToolbar" data-reactid=".g.2.0.0"><div class="Message-toolbarItem" data-reactid=".g.2.0.0.3"><span class="Message-toolbarItemBtn ThemeColor3" data-tip="更多" data-reactid=".g.2.0.0.3.0"><i class="icon-more_horiz" data-reactid=".g.2.0.0.3.0.0"></i></span><noscript data-reactid=".g.2.0.0.3.1"></noscript></div></div></div><div class="Message-from" data-reactid=".g.2.1"><img class="Message-from-avatar" src="https://dn-mdpic.qbox.me/UserAvatar/14db40d9-bca8-4c93-a232-06ce1a17466a.png?imageView2/1/w/100/h/100/q/100" alt="董立超" data-reactid=".g.2.1.0"></div><div class="Message-body" data-reactid=".g.2.2"><div class="Message-title" data-reactid=".g.2.2.0"><div class="Message-from-name ThemeColor3" data-reactid=".g.2.2.0.0">我</div></div><div class="Message-content" data-reactid=".g.2.2.1"><div class="Message-card Message-card--moreInfo" data-reactid=".g.2.2.1.1"><div class="Message-cardHeader" data-reactid=".g.2.2.1.1.0"><div class="Message-cardHeader-title" data-reactid=".g.2.2.1.1.0.0"><span data-reactid=".g.2.2.1.1.0.0.0">日程</span><span data-reactid=".g.2.2.1.1.0.0.1"> </span><span data-reactid=".g.2.2.1.1.0.0.2">: </span><span data-reactid=".g.2.2.1.1.0.0.3"> </span><span class="js-messageCardTitle" data-reactid=".g.2.2.1.1.0.0.4">东津公安和双实采集业务讲解及交接</span></div></div><div class="Message-cardBody" data-reactid=".g.2.2.1.1.2"><div class="Message-cardDetail" data-reactid=".g.2.2.1.1.2.0"><div class="Message-cardDetailItem" data-reactid=".g.2.2.1.1.2.0.0"><div data-reactid=".g.2.2.1.1.2.0.0.0">时间：</div><div class="js-messageCardCalendarTime" data-reactid=".g.2.2.1.1.2.0.0.1">9月20日&nbsp;-&nbsp;9月20日</div></div><div class="Message-cardDetailItem Message-cardDetail-membersItem" data-reactid=".g.2.2.1.1.2.0.1"><div data-reactid=".g.2.2.1.1.2.0.1.0">发起人/成员：</div><div class="Message-cardDetail-members js-messageCardCalendarManager" data-reactid=".g.2.2.1.1.2.0.1.1"><div class="Avatar-size24 Message-cardDetail-charger"><img data-accountid="843f8da4-28de-4873-9113-daa652697e64" src="https://dn-mdpic.qbox.me/UserAvatar/14db40d9-bca8-4c93-a232-06ce1a17466a.png?imageView2/1/w/100/h/100/q/90" class="AvatarImages"></div><div class="Message-cardDetail-membersCount"><span class="Message-cardDetail-membersCountText">1</span></div></div></div></div></div></div></div></div></div></div></div> 
					 -->
				</div> 
				<div class="nano-pane" style="display: block;">
					<div class="nano-slider" style="transform: translate(0px, 0px); height: 58px;"></div>
				</div>
			</div> 
			<div class="js-toBottom icon-bottom toBottom ThemeColor3 hide"></div>
		</div> 
					
		<div class="reactChatInput">
			<div class="chatActionContainer" >
				<div class="inputContainer">
					<div class="addToolbar ThemeBorderColor3 ThemeBGColor3 addToolbarHover" >
						<div class="icnoBtn">
							<i class="icon-add-bold" ></i>
						</div>
						<noscript></noscript>
					</div>
					<div class="inputWrapper" >
						<div style="display:none;" class="quoteMessageContainer highlight ThemeColor3 ThemeBGColor3 ThemeBorderColor3" >
							<div class="text" >
								<span > “ </span>
								<span > </span>
								<span >: </span>
								<span > ” </span>
							</div>
							<i class="icon-closeelement" data-reactid=".c.0.1.0.1"></i>
						</div>
						<div class="chatMessage-textarea FormControl" >
							<textarea placeholder="说点什么…" class="ming Textarea chatMessage-textarea" style="min-height: 34px; max-height: 94px; height: 0px;" ></textarea>
						</div>
					</div>
					<div class="sendToolbar" >
						<div class="icnoBtn-laugh icnoBtn tip-top" data-tip="发表情" >
							<i class="icon-chat-laugh" ></i>
						</div>
						<div class="icnoBtn-file icnoBtn tip-top" data-tip="发送本地文件" >
							<i class="icon-chat-clip" ></i>
							<noscript></noscript>
						</div>
						<div class="icnoBtn tip-top btnCapture" data-tip="截屏" >
							<i class="icon-outil_capture" ></i>
						</div>
						<div class="icnoBtn tip-top" data-tip="抖动ta的屏幕" >
							<i class="icon-chat-shake" ></i>
						</div>
					</div>
				</div>
				<div class="chatAction">
					<div class="tip-top" data-tip="点击切换输入方式">
						<span>使用</span>
						<span > </span>
						<span data-reactid=".c.1.0.2">Enter换行，Ctrl+Enter发送</span></div></div></div></div> </div> <!--右侧聊天群组成员--><div class="sessionInfo "> <div class="nano"> <div class="nano-content SessionInfoIndex">   <div class="GroupInfoItem GroupInfoItem--noFiles"> <div class="GroupInfoItem-header"> <span class="GroupInfoItem-headerIcon"> 文件 </span> <span class="GroupInfoItem-entry js-showSlideInfo ThemeColor3" style="display: none;"> 所有文件<i class="icon-sidebar-more"></i> </span> </div> <div class="GroupInfoItem-body"> <div class="GroupInfoItem-fileList"><div class="noDataContent">聊天中暂无文件</div></div> </div> </div> </div> </div> <div class="js-slideInfoBar SlideInfoBar"></div> <div class="js-slideInfoSearchBar SlideInfoBar"><div class="groupInfoSearch"> <div class="searchTabList Hidden"> <ul> <li class="searchTabBox"> <span class="searchTab ThemeBorderColor3 ThemeColor3 active" data-type="4">聊天记录<span class="searchTabNum"></span></span> </li> <li class="searchTabBox"> <span class="searchTab ThemeBorderColor3 ThemeColor3" data-type="2">文件<span class="searchTabNum"></span></span> </li> <li class="searchTabBox  hide"> <span class="searchTab ThemeBorderColor3 ThemeColor3" data-type="1">成员<span class="searchTabNum"></span></span> </li> </ul> </div> <div class="searchContent nano"> <div class="nano-content"> <div class="searchInfoMembers searchContent-item  active"></div> <div class="searchInfoFiles searchContent-item"></div> <div class="searchInfoMessages searchContent-item"></div> <div class="searchDefaultInfo"> <div><img src="/modules/mdpublic/chat/resource/images/search_default.png" style="width:60px" alt=""> </div> <p>搜索成员、文件或聊天记录</p> </div> </div> </div></div></div></div></div></div>
		
		
</body>
</html>		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		