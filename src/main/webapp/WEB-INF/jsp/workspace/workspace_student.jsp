<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>

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
								<label class="text">进行中</label>
								<i class="icon-arrow-down-border"></i> 
								<ul class="statusList boderRadAll_3 boxShadow5  Hidden"> 
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
					
					
					<div id="slideTaskDetail" class="fixedContainer" data-taskid="6af430ad-59c5-4326-ac48-662bd61b657a">
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