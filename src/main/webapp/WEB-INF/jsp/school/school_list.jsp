<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/citms.tld" prefix="citms" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>学校管理</title>
		<link rel="stylesheet" href="/css/h/bootstrap.min.css" type="text/css" />
 		<link rel="stylesheet" href="/css/h/animate.css" type="text/css" />
  		<link rel="stylesheet" href="/css/h/font-awesome.min.css" type="text/css" />
  		<link rel="stylesheet" href="/css/font.css" type="text/css" />
   		<link rel="stylesheet" href="/css/app.css" type="text/css" />
	</head>
	<body>
	  <section class="vbox">
   	 <section>
      <section class="hbox stretch">
        <!-- .aside -->
        <!-- /.aside -->
        <section id="content">
          <section class="hbox stretch">
          <c:if test="${user.school==null}">
            <aside class="aside-md bg-white b-r" id="subNav">
              	<header class="dk header">
                  <button class="btn btn-icon btn-default btn-sm pull-right" onclick="addSchool()"><i class="fa fa-plus"></i></button>
                  <div class="wrapper b-b header"><b>校区</b></div>
                </header>
              <ul class="nav nav-pills nav-stacked no-radius">
                 <c:forEach var="school" items="${list}">
                <li class="b-b b-light ${school.id==bean.id?'active':''} "><a href="/school/list?id=${school.id}">
                <i class="fa fa-chevron-right pull-right m-t-xs text-xs fa-inbox"></i>${school.name}</a></li>
                </c:forEach>
              </ul>
            </aside>
           </c:if>
            
            <aside>
              <section class="vbox">
                <header class="header bg-white b-b clearfix">
                  <div class="row m-t-sm">
                    <div class="col-sm-8 m-b-xs">
                     <c:if test="${user.school==null}">
                     	 <a href="#subNav" data-toggle="class:hide" class="btn btn-sm btn-default active"><i class="fa fa-caret-right text fa-lg"></i><i class="fa fa-caret-left text-active fa-lg"></i></a>
                      </c:if>
                      <div class="btn-group">
                        <button type="button" class="btn btn-sm btn-default" title="Refresh"><i class="fa fa-refresh"></i></button>
                        <button type="button" class="btn btn-sm btn-default" title="Remove"><i class="fa fa-trash-o"></i></button>
                        <button type="button" class="btn btn-sm btn-default" title="Filter" data-toggle="dropdown"><i class="fa fa-filter"></i> <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                          <li><a href="#">Action</a></li>
                          <li><a href="#">Another action</a></li>
                          <li><a href="#">Something else here</a></li>
                          <li class="divider"></li>
                          <li><a href="#">Separated link</a></li>
                        </ul>
                      </div>
                      <a class="btn btn-sm btn-default" onclick="inputClass(null,'${bean.id}')"><i class="fa fa-plus"></i> 新建班级</a>
                    </div>
                    <div class="col-sm-4 m-b-xs">
                      <div class="input-group">
                        <input type="text" class="input-sm form-control" placeholder="Search">
                        <span class="input-group-btn">
                          <button class="btn btn-sm btn-default" type="button">Go!</button>
                        </span>
                      </div>
                    </div>
                  </div>
                </header>
                   <section class="scrollable wrapper w-f">
                  <section class="panel panel-default">
                    <div class="table-responsive" style="height: 600px" >
                       <div class="wrapper wrapper-content animated "><!--  -->
                       
                       <div class="row">
            <div class="col-sm-12">
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true">基本信息</a>
                        </li>
                        <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">学校介绍</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane active">
                            <div class="panel-body">
                            
                              <div class="form-group">
                                   <div class="col-sm-2 " ><strong>校区名称：</strong></div>
		                			 <div class="col-sm-4 pull-left">${bean.name}</div>
		                			 <div class="col-sm-2"><strong>所在区域：</strong></div>
		                             <div class="col-sm-4"><citms:customLabel key="area" value="${bean.area}"/></div>
                              </div>
                             <div class="hr-line-dashed"></div>
                           <div class="form-group">
                             <div class="col-sm-2 " ><strong>校区地址：</strong></div>
                			 <div class="col-sm-4 ">${bean.address}</div>
                			 <div class="col-sm-2"><strong>开设专业：</strong></div>
                             <div class="col-sm-4"><c:forEach var="major" items="${bean.majors}" >${major.name }&nbsp;&nbsp;</c:forEach> </div>
                             </div>
                            </div>
                            
                            
                            <div class="table-responsive">
                      <table class="table table-striped m-b-none">
                        <thead>
                          <tr>
                            <th class="th-sortable" data-toggle="class">班级名称</th>
                            <th>班级专业</th>
                            <th>教学地区</th>
                            <th>辅导员</th>
                            <th>入学年份</th>
                            <th>操作</th>
                          </tr>
                        </thead>
                        <tbody style="height: 100%">
                        
                        <c:forEach var="ban" items="${bean.classList}">
                          <tr>
                            <td>${ban.name}</td>
                            <td>${ban.major.name}</td>
                            <td><citms:customLabel key="area" value="${ban.area}"/>   </td>
                            <td>${ban.user.name}</td>
                            <td>${ban.beginYear}</td>
                            <td>
                            <a href="#" target="_self" onclick="inputClass('${ban.id}','')" class="btn btn-primary btn-xs">查看</a>
                            </td>
                          </tr>
                          </c:forEach>
                          
                          
                        </tbody>
                      </table>
                    </div>
                            
                            
                        </div>
                        <div id="tab-2" class="tab-pane">
                            <div class="panel-body">
                               ${bean.text}
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
        </div>
                      
                      
                      
                    </div>
                  </section>
                </section>
                <!-- 
                <footer class="footer bg-white b-t">
                  <div class="row text-center-xs">
                    <div class="col-md-6 hidden-sm">
                      <p class="text-muted m-t">Showing 20-30 of 50</p>
                    </div>
                    <div class="col-md-6 col-sm-12 text-right text-center-xs">                
                     
                    </div>
                  </div>
                </footer> -->
              </section>
            </aside>
          </section>
          <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>
        </section>
        <aside class="bg-light lter b-l aside-md hide" id="notes">
          <div class="wrapper">Notification</div>
        </aside>
      </section>
    </section>
  </section>
  <script src="/js/jquery.js"></script>
  <!-- Bootstrap -->
  <script src="/js/h/bootstrap.min.js"></script>
  <!-- App -->
  <script src="/js/app.js"></script>
  <script src="/js/app.plugin.js"></script>
  
  <script type="text/javascript" src="/js/h/plugins/layer/layer.min.js"></script>
  <script type="text/javascript">
  function addSchool(){
//iframe层
	  parent.layer.open({
	    type: 2,
	    title: '新增校区',
	    shadeClose: true,
	    shade: 0.8,
	    area: ['800px', '60%'],
	    content: '/school/input' ,
	    end: function () {
	    	  parent.mainPage.location.reload();
        }
	  }); 
  }
  
  
  function inputClass(classId,schoolId){
	//iframe层
		 parent.layer.open({
		    type: 2,
		    title: classId==null?'新建班级':'编辑班级',
		    shadeClose: true,
		    shade: 0.8,
		    area: ['800px', '60%'],
		    content: '/schoolClass/input?id='+classId+'&schoolId='+schoolId,
		    end: function () {
		    	  parent.mainPage.location.reload();
	        }
		  }); 
	  }
  </script>
  <!-- 
  <script src="/js/slimscroll/jquery.slimscroll.min.js"></script>
     -->
        </body></html>