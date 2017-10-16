<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户管理</title>
    <link rel="shortcut icon" href="favicon.ico"> <link href="/css/h/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/css/h/font-awesome.css?v=4.4.0" rel="stylesheet">
    <!-- Data Tables -->
    <link href="/css/h/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/css/h/animate.css" rel="stylesheet">
    <link href="/css/h/style.css?v=4.0.0" rel="stylesheet"><base target="_blank">
	<link rel="stylesheet" type="text/css" href="/css/style.css" />

</head>

<body class="gray-bg">
		            
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title manage-head-con padding-left">
                        <h5>员工管理</h5>
                        <div class="ibox-tools ">
                            <a href="/user/input" target="_self" class="btn btn-primary btn-xs">添加行</a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr>
                                    <th>员工姓名</th>
                                    <th>所在校区</th>
                                    <th>用户角色</th>
                                    <th>联系电话</th>
                                    <th>用户状态</th>
                                    <th>邮箱</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                               	<c:forEach var="bean" items="${list}">
                                <tr class="gradeU">
                                    <td>${bean.name}</td>
                                    <td>${bean.school!=null?bean.school.name:"中部对外"}</td>
                                    <td class="center">${bean.role.name}</td>
                                    <td class="center">${bean.phoneNum}</td>
                                    <td class="center">${bean.status}</td>
                                    <td class="center">${bean.email}</td>
                                    <td class="center">
                                    <a href="/user/input?id=${bean.id}" target="_self" class="btn btn-primary btn-xs">编辑</a>&nbsp;&nbsp;
                                    <a href="/user/stop?id=${bean.id}" target="_self" class="btn btn-primary btn-xs">停用</a>&nbsp;&nbsp;
                                    </td>
                                    </c:forEach>
                                </tr>
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

    <!-- 自定义js -->
    <script src="/js/h/content.js?v=1.0.0"></script>


    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function () {
            $('.dataTables-example').dataTable();
        });

       
    </script>
                    
                    </body></html>