<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>字典管理</title>
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
            <aside class="aside-md bg-white b-r" id="subNav">
				<header class="dk header">
                  <button class="btn btn-icon btn-default btn-sm pull-right" onclick="selectClassInput()"><i class="fa fa-plus"></i></button>
                  <div class="wrapper b-b header"><b>选项管理</b></div>
                </header>              <ul class="nav nav-pills nav-stacked no-radius">
               <c:forEach var="selectClass" items="${list}">
                <li class="b-b b-light ${selectClass.id==selected.id?'active':''} "><a href="/selectClass/list?id=${selectClass.id}"><i class="fa fa-chevron-right pull-right m-t-xs text-xs icon-muted"></i>${selectClass.name}(${selectClass.code})</a></li>
                </c:forEach>
                
              </ul>
            </aside>
            <aside>
              <section class="vbox">
                <header class="header bg-white b-b clearfix">
                  <div class="row m-t-sm">
                    <div class="col-sm-8 m-b-xs">
                      <a href="#subNav" data-toggle="class:hide" class="btn btn-sm btn-default active"><i class="fa fa-caret-right text fa-lg"></i><i class="fa fa-caret-left text-active fa-lg"></i></a>
                      <div class="btn-group">
                        <button type="button" class="btn btn-sm btn-default" title="Refresh"><i class="fa fa-refresh"></i></button>
                        <button type="button" class="btn btn-sm btn-default" title="Remove"><i class="fa fa-trash-o"></i></button>
                        <button type="button" class="btn btn-sm btn-default" title="Filter" data-toggle="dropdown"><i class="fa fa-filter"></i> <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                          <li><a href="#">系统</a></li>
                          <li><a href="#">自定义</a></li>
                          <li class="divider"></li>
                        </ul>
                      </div>
                      <a href="#"  class="btn btn-sm btn-default" onclick="selectClassInput('${selected.id}')"><i class="fa fa-plus"></i> ${selected.open==true?'编辑':'查看'}</a>
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
                    <div class="table-responsive"  >
                      <table class="table table-striped m-b-none">
                        <thead>
                          <tr>
                            <th width="20"><input type="checkbox"></th>
                            <th class="th-sortable" data-toggle="class">类别名称</th>
                            <th>级别</th>
                            <th>内容</th>
                            <th>标识</th>
                          </tr>
                        </thead>
                        <tbody style="height: 100%">
                        
                        <c:forEach var="detail" items="${selected.details}">
                          <tr>
                            <td><input type="checkbox" name="ids" value="2"></td>
                            
                            <td>${selected.name}</td>
                            <td>${detail.school==null?"系统":"自定义"}</td>
                            <td>${detail.label}</td>
                            <td>${detail.value}</td>
                          </tr>
                          </c:forEach>
                          
                          
                        </tbody>
                      </table>
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
                      <ul class="pagination pagination-sm m-t-sm m-b-none">
                        <li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
                      </ul>
                    </div>
                  </div>
                </footer>
                 -->
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
  function selectClassInput(id){
	  layer.open({
	    type: 2,
	    title: id==null?'新增选项':'编辑选项',
	    shadeClose: true,
	    shade: 0.8,
	    area: ['800px', '60%'],
	    content: '/selectClass/input?id='+id,
	    end: function () {
            location.reload();
        }
	  
	  //iframe的url
	  }); 
  }
  </script>
  <!-- 
  <script src="/js/slimscroll/jquery.slimscroll.min.js"></script>
     -->
        </body></html>