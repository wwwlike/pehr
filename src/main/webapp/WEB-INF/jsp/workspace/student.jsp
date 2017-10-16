<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html  class="AppTask">
	<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>学生信息工作台</title>
	
		<link rel="stylesheet" type="text/css" href="/mingdao/css/xiaoxi-basic.css"/>
		<link rel="stylesheet" type="text/css" href="/mingdao/css/font.css"/>
		<link rel="stylesheet" type="text/css" href="/css/mdIonc.css"/>
		<link rel="stylesheet" type="text/css" href="/css/mdQuery.css"/>
		<link rel="stylesheet" href="/plugins/layer/skin/default/layer.css">
		 
		<script src="/mingdao/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="/js/mingdao/mdQuery.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="/plugins/layer/layer.js"></script>
		
			<script src="/js/h/plugins/layer/laydate/laydate.js"></script>
    <script src="/js/h/plugins/validate/jquery.validate.min.js"></script>
    <script src="/js/h/plugins/validate/messages_zh.min.js"></script>
    <script src="/plugins/handlebars-v3.0.3.js"></script>
    
    <script type="text/javascript">
		function toLogin(){
			    	parent.toLogin();
		}
    </script>
		<style type="text/css">
		
		
		</style>
	</head>
	<body>
		
		<div id="siteMain" class="boxSizing"> 
					<div class="taskCenterBox boxSizing borderContainer flexColumn" id="taskCenterBox"> 
						<!-- 任务标题 --> 
						<div class="taskType listTitle relative"> 
						<span class="taskTypeName overflow_ellipsis"> 
						<span class="taskTypeNameLabel">&nbsp;工作台台&nbsp;&nbsp;</span>
						<span class="taskNumCount"></span> </span> 
						<ul class="myTaskTaskFilterList"> 
						<li data-type="all" class="ThemeColor3 ThemeBorderColor3 relative active">学生管理</li>
						<!-- <li data-type="responsible" class="ThemeColor3 ThemeBorderColor3 relative">消息<i class="folderNewTip circle Hidden" data-count="0"></i></li>
						<li data-type="trust" class="ThemeColor3 ThemeBorderColor3 relative">动态<i class="folderNewTip circle Hidden" data-count="0"></i></li> 
						<li data-type="participate" class="ThemeColor3 ThemeBorderColor3 relative ">公告<i class="folderNewTip circle" data-count="1"></i></li>
						 --> 
					</ul> </div> 
					
					<div id="tasks" class="boxSizing relative "> <!-- slideDetail -->
						<div class="switchCreate taskListScroll"> 
						<!-- 
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
						 -->
						<div class="createNewTaskBtn ThemeColor3" style="display: block;"> 
							<span class="ThemeBGColor3 addIcon mRight5" id="addStudent"> <i class="icon-addnewcalendar"></i> </span> 新建
						</div> 
						
						<div id="advancedSearch"> 
							<span class="taskStatus spanComm"> 
								<label class="text">${queryData[0].label}</label>
								<i class="icon-arrow-down-border"></i> 
								<ul class="statusList boderRadAll_3 boxShadow5  Hidden" >
								<c:forEach items="${queryData}" var="querySchool">
									<li class="taskStatusLi completeTaskStatus" label="${querySchool.label}" key="${querySchool.key}" value="${querySchool.value}">
									<i class="icon-task-complete"></i><span class="statusName">${querySchool.label}</span> 
									
									<c:if test="${fn:length(querySchool.list)>0}">
									<i class="arrow-right arrorwRightComplete"></i>
										<div class="switchSubListDiv"> 
											<ul class="switchSubList"> 
												<c:forEach items="${querySchool.list}" var="sclass">
												<li class="taskCompleteFilter taskStatusLi" label="${sclass.label}" key="${sclass.key}" value="${sclass.value}" data-time="all">${sclass.label}</li>
												</c:forEach>
											</ul> 
										</div> 
									
									</c:if>
									</li> 
								</c:forEach>
								</ul>
								</span>
								
							<span class="filter spanComm" data-refresh="true"> 
								<label class="text">筛选 </label> <i class="icon-arrow-down-border"></i> 
								<ul class="statusList boderRadAll_3 boxShadow5  Hidden" >
								<c:forEach items="${filterData}" var="filter">
									<li class=" completeTaskStatus" label="${filter.label}" key="${filter.key}" value="${filter.value}">
									<i class="icon-task-complete"></i><span class="statusName">${filter.label}</span> 
									
									<c:if test="${fn:length(filter.list)>0}">
									<i class="arrow-right arrorwRightComplete"></i>
										<div class="switchSubListDiv"> 
											<ul class="switchSubList"> 
												<c:forEach items="${filter.list}" var="sclass">
												<li class="taskCompleteFilter filterLi" label="${sclass.label}" key="${sclass.key}" value="${sclass.value}" data-time="all">${sclass.label}</li>
												</c:forEach>
											</ul> 
										</div> 
									
									</c:if>
									</li> 
								</c:forEach>
								</ul>
								
								
								 </span> 
							<span class="taskSort spanComm"> <label class="text">按优先级排序</label> <i class="icon-arrow-down-border"></i> <ul class="sortList boxShadow5 boderRadAll_3 Hidden"> <li data-sort="0" class="noFolderSort ThemeColor3" title="查看即将到期的任务"><i class="icon-top-priority"></i>优先级</li> <li data-sort="2" class="unCompleteSort onlyUnCompleteSort" title="查看即将到期的任务"><i class="icon-task-calendar"></i>截止日期</li> <li data-sort="10" title="查看最近创建的或有新讨论的任务" class=""><i class="icon-task-update"></i>最近更新</li> <li data-sort="1" title="查看即将到期的任务按名称A-Z" class=""><i class="icon-task-a-to-z"></i>名称A-Z</li> <li data-sort="8" class="completeSort Hidden" title="查看最近完成的任务"><i class="icon-task-responsible"></i>完成日期</li> <li data-sort="3" title="查看最近创建的任务"><i class="icon-task-create-time"></i>创建日期</li> <li data-sort="5" class="noResponsibleTaskSort" title="按负责人分类"><i class="icon-task-person"></i>负责人</li> <li data-sort="4" class="noFolderSort" title="按项目分类"><i class="icon-task-folder-solid"></i>项目</li> </ul> </span>
							<span class="taskSort spanComm center-left-header" style="margin-top:-5px"> 
								<i class="iconfont sousuo">&#xe607;</i>
								<input class="sousuokuang" type="text" placeholder="搜索"/>
							</span>
							 
						</div> 
						</div>
						<div id="taskList" class="animatedFast" style="display: none">  
						<!--  暂时删除赛选条件标签 下拉滚动显示不全因为这个标签  -->
						<div  class="pickFolderOrCategory boderRadAll_3 flexRow">
							<span class="flex mRight20 filterSpan">
							</span>
							<!--  -->
							<span class="cleanAdvancedSearch ThemeColor3" onclick="clearFilter()">清除筛选条件</span>
						</div>
						<!--  加上面的就要加这个 -->
						</div>
						<div class="k2RightContent flex k2MainContent Relative transitions boxSizing removeDetail" >
							<!-- 标题 begin -->
							<div class="k2Toolbar boxSizing"  style="right: 18px;">
								<span class="selectAll boderRadAll_3" data-tip="全选" >
									<i class="icon-task-status-ok hide" ></i>
								</span>
								<span class="k2ToolbarSingle" >
									<span class="k2ToolbarLabel" >
										<span>基本信息</span>
									</span>
									<div class="k2ToolbarRight transitions" >
										<span class="editTime ellipsis" >联系方式</span>
										<span class="editTime ellipsis"><span >学校</span><i class="ThemeColor3 icon-gonext" ></i></span>
										<span class="editTime ellipsis" >班级</span>
									</div>
								</span>
							</div>
							<!-- 标题end   class=noContextMenu noSelect cursorDefault noMultiItemsSelected  -->
							<div id="k2listContainer"  class="k2list" >
							<div class="nano has-scrollbar" >
							<div class="nano-content k2listScrollContent" tabindex="0" style="right: -17px;">
								<ul class="clearfix" style="position:relative;height: 100%"  ><!-- active first-child  fadeInUp noSelect nodeItem-->
									<!-- 动态增加li
									<li class="flexRow  ani0 ">
										<span class="noSelectPoint"></span>
										<span class="selectBox">
											<span class="select boderRadAll_3" >
												<i class="icon-task-status-ok" ></i>
											</span>
										</span>
										<img alt="" class="listViewImg" src="" >
										<span class="listName ellipsis" title="" >襄阳市道路交通安全隐患</span>
										<span class="flex" ></span>
										<span class="createName ellipsis cursorDefault">董立超</span>
										<span class="createTime ellipsis cursorDefault"><span >2017-03-31</span>
										<span >&nbsp;</span></span><span class="size">506 MB</span>
									</li> -->
									
									
								</ul>
							</div>
								<div class="nano-pane" style="display: block;">
									<div class="nano-slider" style="height: 23px; transform: translate(0px, 0px);">
								
								</div></div>
								
								</div></div>
								
								</div></div>
						</div>
						
					
					<div id="slideTaskDetail" class="fixedContainer " style="right: -760px">
					<!-- 头部 -->
					<div class="topBar boxSizing borderClear"> 
					<span class="slideDetailTimer">
						<span class="updateAuthDisabled pointer textGreen updateSlideTaskTime" > <span class="icon-task-calendar"> <span class="slideDetailTimerText textGreen">个人信息</span> </span> </span> 
					</span> 
						<ul class="Right manipulation Relative"> 
							<li class="manipulationMore tip-bottom-left ThemeColor3" data-tip="更多操作"> <i class="icon-moreop"></i> </li> 
							<li class="slideDetailNews ThemeColor3"> <span class="slideDetailBarBtn"> <i class="icon-mute-off"></i> <span class="Font13">删除</span> </span> </li>
							<!--
							<li id="slideDetailCloseBtn" class="ThemeColor3" data-tip="关闭"> <span class="slideDetailClose"> <i class="icon-task-delete"></i> </span> </li> 
							<li class="slideDetailLocked ThemeColor3"> <span class="slideDetailBarBtn"> <i class="icon-task-new-no-locked"></i> <span class="Font13">未锁定</span> </span> </li> 
							<li class="slideDetailNews ThemeColor3"> <span class="slideDetailBarBtn"> <i class="icon-mute-off"></i> <span class="Font13">已开启提醒</span> </span> </li> 
							<li class="slideDetailSubTask ThemeColor3"> <span class="updateAuthDisabled" id="showAddSubTask"> <i class="icon-task-card"></i> <span class="Font13">添加子任务</span></span>  </li> 
							<div class="createChecklist boderRadAll_3 boxShadow5 Hidden" id="createChecklist"> <div class="createChecklistTitle Font15">添加检查清单</div> <input class="createChecklistText ThemeBorderColor3" maxlength="100" type="text"> <span class="createChecklistBtn ThemeBGColor3 boderRadAll_3" id="createChecklistBtn">添加</span> </div>
							 -->
						</ul></div>
						
						<div class="taskContent">  
						<!--	 -->
						<iframe name="mainPage" src="" style="height:100%;border: none;border-width: 0px"  width="100%" height="100%" ></iframe>
						</div>
						</div>
					</div>
		
		
	</body>
	

	
	
</html>