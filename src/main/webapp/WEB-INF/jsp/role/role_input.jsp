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
    <title>角色编辑</title>
    <link rel="shortcut icon" href="favicon.ico"> <link href="/css/h/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/css/h/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/css/h/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/css/h/animate.css" rel="stylesheet">
    <link href="/css/h/style.css?v=4.0.0" rel="stylesheet"><base target="_blank">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>角色编辑</h5>
                        <div class="ibox-tools">
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form method="post" action="/role/save" id="formdata" class="form-horizontal">
                        <input type="hidden" name="id" value="${bean.id}" >
                        <input type="hidden" name="school.id" value="${bean.school.id}" >
                        
                            <div class="form-group">
                                <label class="col-sm-2 control-label">角色名称</label>
                                <div class="col-sm-4">
                                    <input type="text" name="name" value="${bean.name}" class="form-control">
                                </div>
                                <label class="col-sm-2 control-label">学校使用</label>
                                <div class="col-sm-4">
                                	<label class="checkbox-inline i-checks">
                                        <input type="checkbox" name="schoolUse" ${user.school!=null?'disabled':''} value="1" ${(bean.schoolUse||(user.school!=null&&bean==null))?'checked':''} /><i></i> 勾选后开放给学校使用
                                                                             <span class="help-block m-b-none"></span>
                                        
                                     </label>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">角色使用说明</label>
                                <div class="col-sm-10">
                                   <textarea rows="5" name="text" style="width: 100%" class="form-control">${bean.text}</textarea>
                                  <span class="help-block m-b-none">帮助了解该角色的使用说明</span>
                                </div>
                            </div>
                            
                            <c:forEach var="resource" items="${resources}">
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">${resource.moduleName} ${subs}</label>
                                <div class="col-sm-10">
                                
                                	<div class="col-sm-10">
                                	  <c:forEach var="sub" items="${resource.subs}" >
                                    	<label class="checkbox-inline i-checks">
                                        <input type="checkbox" name="ids" value="${sub.id}"  ${sub.checked?'checked':''} /><i></i> ${sub.name}
                                        </label>
                                      </c:forEach>
                                   
                               	 </div>
                                
                                </div>
                            </div>
                            </c:forEach>
                       
                        <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" id="ajaxSubmit" type="button">保存内容</button>
                                    <a target="_self"  href="/role/list" class="btn btn-white" type="button">返回</a>
                                </div>
                            </div>
                         </form>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
       
    <!-- 全局js -->
    <script src="/js/h/jquery.min.js?v=2.1.4"></script>
    <script src="/js/h/bootstrap.min.js?v=3.3.5"></script>

    <!-- 自定义js -->
    <script src="/js/h/content.js?v=1.0.0"></script>
    
    <script src="/js/h/plugins/validate/jquery.validate.min.js"></script>
    
    <script type="text/javascript" src="/js/h/plugins/layer/layer.min.js"></script>
    
    <!-- iCheck -->
    <script src="/js/h/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
            
            
            $("#ajaxSubmit").click(function(){
            	$.ajax({
            		type: "get",
            		url: "/role/save",
            		data:$("#formdata").serialize(),
            		success: function(data) {
            			
            			$("#id").val(data.item.id);
            			
            			layer.msg('成功保存', {icon: 1});
            			
            		}})
            });	
            
        });
        
        
   
    </script>

</body>

</html>