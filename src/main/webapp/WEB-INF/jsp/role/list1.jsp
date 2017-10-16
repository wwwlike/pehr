<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="utf-8">
		<title>控制台</title>
		<link rel="stylesheet" type="text/css" href="/css/identify.css" />
		<link rel="stylesheet" type="text/css" href="/css/layout.css" />
		<link rel="stylesheet" type="text/css" href="/css/account.css" />
		<link rel="stylesheet" type="text/css" href="/css/style.css" />
		<link rel="stylesheet" type="text/css" href="/css/control_index.css" />
		
</head>
<body>
				<div class="info-center">
		            <div class="manage-head">
		                <h6 class="padding-left manage-head-con">角色管理</h6>
		            </div>
		            <div class="offcial-table input-table table-margin clearfix">
		                <div class="tr-th clearfix">
		                    <div class="th w5 text-center"><!--<input class="margin-top-15" type="checkbox" />--></div>
		                    <div class="th w20">订单号</div>
		                    <div class="th w20">产品</div>
		                    <div class="th w15">创建时间</div>
		                    <div class="th w15">支付/开通时间</div>
		                    <div class="th w10">
		                    	支付状态
		                    	<!--<div class="select-table status-table fl status-left">
					        		<div>
					        			<input class="status-total" type="text" readonly="readonly" value="已支付">
					        			<span class="bg-img"></span>
					        		</div>
					        		<ul>
					        			<li><a href="#">所有状态</a></li>
					        			<li class="on"><a href="#">已支付</a></li>
					        		</ul>
					        	</div>-->
		                    </div>
		                    <div class="th w10">金额</div>
		                    <div class="th w5 text-center">操作</div>
		                </div>
		                			            <div class="tr non-info show border-bottom-none">
			            	<span>没查询到符合条件的记录</span>
			            </div>
			            		            </div>
		        </div>
		        <div class="show-page padding-big-right hidden">
					<div class="page">
											</div>
		        </div>
</body>

</html>