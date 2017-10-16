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
    <title>H+ 后台主题UI框架 - 数据表格</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

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
                        <h5>角色管理</h5>
                        <div class="ibox-tools ">
                            <a href="/role/input" target="_self" class="btn btn-primary btn-xs">添加行</a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr>
                                    <th>角色名称</th>
                                    <th>角色说明</th>
                                    <th>角色等级</th>
                                    <th>是否开放</th>
                                </tr>
                            </thead>
                            <tbody>
                               	<c:forEach var="bean" items="${list}">
                                <tr class="gradeU">
                                    <td>${bean.name}</td>
                                    <td>${bean.text}</td>
                                    <td class="center">${bean.level}</td>
                                    <td class="center">${bean.schoolUse}</td>
                                    </c:forEach>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>角色名称</th>
                                    <th>角色说明</th>
                                    <th>角色等级</th>
                                    <th>是否开放</th>
                                </tr>
                                </tr>
                            </tfoot>
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