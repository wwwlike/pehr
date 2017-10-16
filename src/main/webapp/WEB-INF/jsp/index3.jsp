<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html class="AppTask">
	<head>
		<meta charset="UTF-8">
		<title>中部对外</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,
		minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="shortcut" href="/favicon.ico" />
		<link rel="bookmark" href="/favicon.ico" type="image/x-icon" />
		
		<script src="/mingdao/js/index.js" type="text/javascript" charset="utf-8"></script> 	
		
		
		<link rel="stylesheet" type="text/css" href="/mingdao/css/xiaoxi-basic.css"/>
		<link rel="stylesheet" type="text/css" href="/mingdao/css/font.css"/>
		<!-- -->
		<link rel="stylesheet" type="text/css" href="/css/mdIonc.css"/>
		<link rel="stylesheet" type="text/css" href="/css/mdQuery.css"/>
		<link rel="stylesheet" href="/plugins/layer/skin/default/layer.css">
		 
		<!--<link rel="stylesheet" type="text/css" href="/mingdao/css/dongtai.css"/>
	
		<script src="/mingdao/js/jquery.js" type="text/javascript" charset="utf-8"></script> -->
		<script src="/mingdao/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="/js/mingdao/mdQuery.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="/plugins/layer/layer.js"></script>
		
		<style>
			#tasks .switchCreate.taskListScroll { padding-right: 37px; }
			#tasks .switchCreate.taskListNoScroll { padding-right: 20px; }
		</style>
		<script type="text/javascript">
			//var schoolId=${user.school.id};
		</script>
	
	</head>
	<body>
		<div id="container" class="clearfix">
			<div class="header">
				<div class="header-left">
					<ul>
						<li><i class="iconfont">&#xe60a;</i></li>
						<li>中部对外</li>
						
					</ul>
				</div>
				<div class="header-daohang">
					<ul>
						<c:forEach var="module" items="${menus}" varStatus="status">
						<li class="headModule" href="/index?id=${module.mid}" style="${module.mid==mid?'background-color: #2B76C9;':''} ">${module.moduleName}</li>
						</c:forEach>						
					</ul>
				</div>
				<div class="header-right">
					<ul class="header-right-1">
						<li style="width: 180px;">
							<img src="/mingdao/img/touxiang.png" width="35px" height="35px" class="touxiang"/>
						<div id="quanquan-font2">
								${user.name}
							</div>
						<div class="clear">
							
						</div></li>
						
						<li style="position: relative;left: 30px;">
							<i class="iconfont plus">&#xe609;</i>
							<div class="plus xjrw">
								新建任务
							</div>
						</li>
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
							<li class="l-dh1 l-dhbianhui cldh1"><i class="iconfont img_tubiao-size">&#xe60d;</i></li>
							<li class="l-dh1 l-dhbianhui cldh2" ><i class="iconfont img_tubiao-size ">&#xe60b;</i></li>
							<li class="l-dh1 l-dhbianhui cldh3"><i class="iconfont img_tubiao-size users">&#xe60f;</i></li>
							<li class="l-dh1 l-dhbianhui cldh4"><i class="iconfont img_tubiao-size " >&#xe60e;</i></li>
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
				<!-- 	<iframe name="mainPage" src="/workspace/student" style="height:100%;border: none;border-width: 0px"  width="100%" height="100%" ></iframe>-->
				
					<div id="siteMain" class="boxSizing"> 
					<div class="taskCenterBox boxSizing borderContainer flexColumn" id="taskCenterBox"> 
						<!-- 任务标题 --> 
						<div class="taskType listTitle relative"> 
						<span class="taskTypeName overflow_ellipsis"> 
						<span class="taskTypeNameLabel">我的工作</span>
						<span class="taskNumCount">5</span> </span> 
						<ul class="myTaskTaskFilterList"> 
						<li data-type="all" class="ThemeColor3 ThemeBorderColor3 relative">学生</li>
						<li data-type="responsible" class="ThemeColor3 ThemeBorderColor3 relative">消息<i class="folderNewTip circle Hidden" data-count="0"></i></li>
						<li data-type="trust" class="ThemeColor3 ThemeBorderColor3 relative">动态<i class="folderNewTip circle Hidden" data-count="0"></i></li> 
						<li data-type="participate" class="ThemeColor3 ThemeBorderColor3 relative active">公告<i class="folderNewTip circle" data-count="1"></i></li> 
					</ul> </div> 
					
					
					
					<div id="tasks" class="boxSizing relative slideDetail"> 
						<div class="switchCreate taskListScroll"> 
						<span class="networkSwitch boderRadAll_3 ThemeColor3" id="networkSwitch"  > 
							<span class="networkLabel Hidden" data-tip="所有网络"><i class="icon-company"></i></span> 
							<span class="overflow_ellipsis networkName">所有网络</span> 
							<span class="icon-arrow-down-border"></span> 
							<ul class="networkSwitchList boderRadAll_3 boxShadow5 Hidden">
								<li data-projectid="all" class="ThemeColor3"  ><i class="icon-done_all"></i>所有网络</li>
								<li data-projectid="048e2c9e-9ae6-4089-8f8e-8464e7f2dbcd" class="ThemeBGColor3" ><i class="icon-company"></i>中科通达</li>
								<li data-projectid="" class="ThemeBGColor3"><i class="icon-task-person"></i>与好友协作</li>
							</ul>
						</span> 
						
						<div class="createNewTaskBtn ThemeColor3" style="display: block;"> 
							<span class="ThemeBGColor3 addIcon mRight5" id="addStudent"> <i class="icon-addnewcalendar"></i> </span> 新建
						</div> 
						
						<div id="advancedSearch"> 
							<span class="taskStatus spanComm"> 
								<label class="text"> ${queryData[0].label}</label>
								<i class="icon-arrow-down-border"></i> 
								<ul class="statusList boderRadAll_3 boxShadow5  Hidden"> 
								<c:forEach items="${queryData}" var="querySchool">
										<li class="taskStatusLi ThemeColor3 noBgColor"  key="${querySchool.key}" value="${querySchool.value}" data-status="0"><i class="icon-task-have-in"></i>${querySchool.label}
										<c:if test="${fn:length(querySchool.list)>0}">
											<i class="arrow-right arrorwRightComplete"></i>
											<div class="switchSubListDiv"> 
												<ul class="switchSubList"> 
													<c:forEach items="${querySchool.list}" var="sclass">
														<li class="taskCompleteFilter taskStatusLi" data-time="all">${sclass.label }</li>
																											<li class="taskCompleteFilter taskStatusLi" data-time="all">${sclass.label }</li>
													
																											<li class="taskCompleteFilter taskStatusLi" data-time="all">${sclass.label }</li>
													
																											<li class="taskCompleteFilter taskStatusLi" data-time="all">${sclass.label }</li>
													
																											<li class="taskCompleteFilter taskStatusLi" data-time="all">${sclass.label }</li>
													
																											<li class="taskCompleteFilter taskStatusLi" data-time="all">${sclass.label }</li>
																											<li class="taskCompleteFilter taskStatusLi" data-time="all">${sclass.label }</li>
																											<li class="taskCompleteFilter taskStatusLi" data-time="all">${sclass.label }</li>
																											<li class="taskCompleteFilter taskStatusLi" data-time="all">${sclass.label }</li>
													
													</c:forEach>
												</ul>
												</div>
										</c:if>
										
										</li>
								</c:forEach>
								</ul>
								<!-- 
								<li class="taskStatusLi ThemeColor3 noBgColor" data-status="0"><i class="icon-task-have-in"></i>进行中</li>
								<li class="taskStatusLi completeTaskStatus" data-status="1">
									<i class="icon-task-complete"></i><span class="statusName">已完成</span>  
									<i class="arrow-right arrorwRightComplete"></i>
										<div class="switchSubListDiv"> 
											<ul class="switchSubList"> 
												<li class="taskCompleteFilter taskStatusLi" data-time="all">所有已完成任务</li>
												<li class="taskCompleteFilterOnly noBgColor" data-time="recently">查看近期完成的任务</li>
												<li class="taskCompleteFilter taskStatusLi" data-time="today">今天</li>
												<li class="taskCompleteFilter taskStatusLi" data-time="yesterday">昨天</li>
												<li class="taskCompleteFilter taskStatusLi" data-time="week">一周</li>
												<li class="taskCompleteFilter taskStatusLi" data-time="month">一个月</li>
											</ul> </div> </li> 
								<li class="taskStatusLi taskAllStatus" data-status="-1" title="查看所有进行中和已完成的任务，按最近更新排序"><i class="icon-task-all"></i><span class="statusName">全部</span> 
								</li> </ul> </span> 
								 -->
							<span class="categoryFolder spanComm" data-refresh="true"> <label class="text">筛选 </label> <i class="icon-arrow-down-border"></i> <ul class="categoryFolderList boxShadow5 boderRadAll_3 Hidden"> <li class="onlyCategorys taskCompleteFilterOnly allowHover"> <i class="icon-task-label"></i> 标签 <i class="arrow-right arrorwRightComplete"></i> <div class="switchSubListDiv"> <ul class="switchSubList"></ul> </div> </li> </ul> </span> 
							<span class="taskSort spanComm"> <label class="text">按优先级排序</label> <i class="icon-arrow-down-border"></i> <ul class="sortList boxShadow5 boderRadAll_3 Hidden"> <li data-sort="0" class="noFolderSort ThemeColor3" title="查看即将到期的任务"><i class="icon-top-priority"></i>优先级</li> <li data-sort="2" class="unCompleteSort onlyUnCompleteSort" title="查看即将到期的任务"><i class="icon-task-calendar"></i>截止日期</li> <li data-sort="10" title="查看最近创建的或有新讨论的任务" class=""><i class="icon-task-update"></i>最近更新</li> <li data-sort="1" title="查看即将到期的任务按名称A-Z" class=""><i class="icon-task-a-to-z"></i>名称A-Z</li> <li data-sort="8" class="completeSort Hidden" title="查看最近完成的任务"><i class="icon-task-responsible"></i>完成日期</li> <li data-sort="3" title="查看最近创建的任务"><i class="icon-task-create-time"></i>创建日期</li> <li data-sort="5" class="noResponsibleTaskSort" title="按负责人分类"><i class="icon-task-person"></i>负责人</li> <li data-sort="4" class="noFolderSort" title="按项目分类"><i class="icon-task-folder-solid"></i>项目</li> </ul> </span> 
						</div> 
						</div>
						<div id="taskList" class="animatedFast">  
						
						<div class="pickFolderOrCategory boderRadAll_3 flexRow"><span class="flex mRight20"><span class="categoryItem" data-id="null">未关联标签<span class="categoryItemDel" data-tip="删除筛选项"><i class="icon-closeelement-bg-circle"></i></span></span></span><span class="cleanAdvancedSearch ThemeColor3">清除筛选条件</span></div>
						
						<div class="listStageTaskContent"> 
							<table cellpadding="0" cellspacing="0">  <tbody>
							
							
							
							  </tbody></table></div>
						
						</div></div>
					
					
					<div id="slideTaskDetail" class="fixedContainer " data-taskid="6af430ad-59c5-4326-ac48-662bd61b657a">
					<!-- 头部 -->
					<div class="topBar boxSizing borderClear"> 
					<span class="slideDetailTimer">
						<span class="updateAuthDisabled pointer textGreen updateSlideTaskTime" data-modify="2017-08-24" data-deadline="2017-08-25" id="deadline" data-taskid="6af430ad-59c5-4326-ac48-662bd61b657a" data-tip="设置截止日期"> <span class="icon-task-calendar"> <span class="slideDetailTimerText textGreen">提前1天完成</span> </span> </span> 
					</span> 
						<ul class="Right manipulation Relative"> 
						<li class="manipulationMore tip-bottom-left ThemeColor3" data-tip="更多操作"> <i class="icon-moreop"></i> </li> 
						<li id="slideDetailCloseBtn" class="ThemeColor3" data-tip="关闭"> <span class="slideDetailClose"> <i class="icon-task-delete"></i> </span> </li> 
						<li class="slideDetailLocked ThemeColor3"> <span class="slideDetailBarBtn"> <i class="icon-task-new-no-locked"></i> <span class="Font13">未锁定</span> </span> </li> 
						<li class="slideDetailNews ThemeColor3"> <span class="slideDetailBarBtn"> <i class="icon-mute-off"></i> <span class="Font13">已开启提醒</span> </span> </li> 
						<li class="slideDetailSubTask ThemeColor3"> <span class="updateAuthDisabled" id="showAddSubTask"> <i class="icon-task-card"></i> <span class="Font13">添加子任务</span></span>  </li> 
						<div class="createChecklist boderRadAll_3 boxShadow5 Hidden" id="createChecklist"> <div class="createChecklistTitle Font15">添加检查清单</div> <input class="createChecklistText ThemeBorderColor3" maxlength="100" type="text"> <span class="createChecklistBtn ThemeBGColor3 boderRadAll_3" id="createChecklistBtn">添加</span> </div>
						</ul></div>
						
						<div class="taskContent">  
						<!--	 -->
						<iframe name="mainPage" src="/student/info" style="height:100%;border: none;border-width: 0px"  width="100%" height="100%" ></iframe>
						</div>
						</div>
					</div>
					
					
<!--  -->
					
				</div>
		
				</div>
				
			</div>
		
	</body>
</html>

