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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>专业管理</title>
    <link rel="shortcut icon" href="favicon.ico"> <link href="/css/h/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/css/h/font-awesome.css?v=4.4.0" rel="stylesheet">
    <!-- Data Tables -->
    <link href="/css/h/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/css/h/animate.css" rel="stylesheet">
    <link href="/css/h/style.css?v=4.0.0" rel="stylesheet"><base target="_blank">
	<link rel="stylesheet" type="text/css" href="/css/style.css" />

</head>

<body class="gray-bg">
		            
    <div class="wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title manage-head-con padding-left">
                        <h5>专业管理</h5>
                        <div class="ibox-tools ">
                            <a href="/schoolMajor/input" target="_self" class="btn btn-primary btn-xs">新建专业</a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr>
                                    <th>专业名称</th>
                                    <th>专业类型</th>
                                    <th>学制年度</th>
                                    <th>启用状态</th>
                                    <th>对口校区</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                               	<c:forEach var="bean" items="${list}">
                                <tr class="gradeU" id="${bean.id}">
                                    <td>${bean.name}</td>
                                    <td class="center"><citms:customLabel key="MAJOR_TYPE" value="${bean.type}"></citms:customLabel>  </td>
                                    <td class="center">${bean.year}年</td>
                                    <td class="center">${bean.status==1?"启用":"停止"}</td>
                                    <td>${bean.school!=null?bean.school.name:"所有校区"}</td>
                                    <td class="center">
                                    <a href="/schoolMajor/input?id=${bean.id}" target="_self" class="btn btn-warning btn-xs">编辑</a>&nbsp;&nbsp;
                                    <button onclick="changeStatus('${bean.id}','0')" class="btn btn-warning btn-xs">删除</button>&nbsp;&nbsp;

                                </tr>
                                </c:forEach>
                            </tbody>
                           
                        </table>

                    </div>
                </div>
            </div>
        </div>
       </div>
                    <!-- 全局js -->
    <script src="/js/h/jquery.min.js?v=2.1.4"></script>
    <script src="/js/h/bootstrap.min.js?v=3.3.5"></script>
    <script src="/js/h/plugins/jeditable/jquery.jeditable.js"></script>
    <!-- Data Tables -->
    <script src="/js/h/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="/js/h/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="/js/h/plugins/layer/layer.min.js"></script>
    
    <!-- 自定义js -->
    <script src="/js/h/content.js?v=1.0.0"></script>


    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function () {
            $('.dataTables-example').dataTable();
        });

        
        function changeStatus(id,value){
        	$.ajax({
    			async:true,
    			type: "get",
    			url:"/schoolMajor/changeStatus",
    			data:{'id':id,'value':value},
    			success: function(data) {
    				if(data.status==value){
    					layer.msg('删除成功', {icon: 1});
    					$("#"+id).remove();
    				}
    			}
        	
        })
        };
    </script>
                    
                    </body></html>