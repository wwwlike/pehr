<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/citms.tld" prefix="citms" %>
<!DOCTYPE html>
<html>
<head>
	<title>班级管理</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <meta name="keywords" content="">
    <link rel="shortcut icon" href="favicon.ico"> <link href="/css/h/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/css/h/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/css/h/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/css/h/animate.css" rel="stylesheet">
    <link href="/css/h/style.css?v=4.0.0" rel="stylesheet"><base target="_blank">
</head>

<!-- 

public String name;//班级名称
	public String no;//班级编号
	public School school;
	public String status;
	public SchoolMajor major; //专业
	public Integer beginYear;//入学年份
	public Integer num;//班级人数
	public String  area;//班级所在地区，来自字典和school的地区可能不一样
	public User user;//辅导员
 -->


<body >
    <div class="wrapper row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <form method="post" action="/schoolClass/save" id="formdata" class="form-horizontal">
                        	<input type="hidden" name="id" id="id" value="${bean.id}" class="form-control">
                        	<input type="hidden" name="school.id" value="${bean.school==null?school.id:bean.school.id}" class="form-control">
                        	
                            <div class="form-group">
                                <label class="col-sm-2 control-label">班级名称</label>
                                <div class="col-sm-4">
                                    <input type="text" name="name" value="${bean.name}" class="form-control">
                                </div>
                                <label class="col-sm-2 control-label">所属校区</label>
                                <div class="col-sm-4">
                                	<input type="text" readonly="readonly" value="${bean.name==null?school.name:bean.school.name}" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">班级编号</label>
                                <div class="col-sm-4">
                                    <input type="text" name="no" value="${bean.no}" class="form-control">
                                </div>
                               
                                <label class="col-sm-2 control-label">所属专业</label>
                                <div class="col-sm-4">
                                 <select name="major.id" class="form-control">
                                      <c:forEach var="major" items="${majors}" varStatus="s" >
                                    	<option value="${major.id}" ${bean!=null&&major.id==bean.major.id?"selected":""}>${major.name}</option>
                                        </c:forEach>
                                        </select>
                                </div>
                            </div>
                            
                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label">入学年份</label>
                                <div class="col-sm-4">
                                    <citms:dbselect classCode="YEAR" css="form-control" name="beginYear" value="${bean.beginYear}"></citms:dbselect>
                                </div>
                            
                                <label class="col-sm-2 control-label">开班地区</label>
                                <div class="col-sm-4">
                                    <citms:dbselect classCode="AREA"  css="form-control" name="area" value="${bean.area}"></citms:dbselect>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label">辅导员</label>
                                <div class="col-sm-4">
                                    <select name="user.id"  class="form-control">
                                      <c:forEach var="user" items="${users}" varStatus="s" >
                                    	<option value="${user.id}" ${bean!=null&&user.id==bean.user.id?"selected":""}>${user.name}</option>
                                        </c:forEach>
                                      </select>
                                </div>
                            </div>
                           
                        <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" id="ajaxSubmit" type="button">保存</button>
                                    <!-- 
                                    <button class="btn btn-white" type="submit">关闭</button>
                                     -->
                                </div>
                            </div>
                         </form>
                                    </div>
                                </div>
                            </div>
                    </div>
       
    <!-- 全局js -->
    <script src="/js/h/jquery.min.js?v=2.1.4"></script>
    <script src="/js/h/bootstrap.min.js?v=3.3.5"></script>

    <!-- 自定义js -->
    <script src="/js/h/content.js?v=1.0.0"></script>

    <!-- iCheck -->
    <script src="/js/h/plugins/iCheck/icheck.min.js"></script>
    <script type="text/javascript" src="/js/h/plugins/layer/layer.min.js"></script>
    
    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
            
            
            $("#ajaxSubmit").click(function(){
            	$.ajax({
            		type: "get",
            		url: "/schoolClass/save",
            		data:$("#formdata").serialize(),
            		success: function(data) {
            			$("#id").val(data.item.id);
            			//parent.location.reload();
            			layer.msg('成功保存', {icon: 1});
            		},
            		error:function(XMLHttpRequest, data, errorThrown){
            			alert("没有权限访问");
            		}
            	
            	})
            });	

        });
        
        
   
    </script>

</body>

</html>