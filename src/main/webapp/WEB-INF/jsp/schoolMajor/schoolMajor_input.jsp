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
                        <h5>${bean==null?"新建":"编辑"}专业</h5>
                        <div class="ibox-tools">
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form method="post"  id="formdata" class="form-horizontal">
                        <input type="hidden" name="id" value="${bean.id}" >
                        <input type="hidden" name="school.id" value="${bean.school.id}" >
                        
                            <div class="form-group">
                                <label class="col-sm-2 control-label">专业名称</label>
                                <div class="col-sm-4">
                                    <input type="text" name="name" id="name" value="${bean.name}" class="form-control">
                                </div>
                                <label class="col-sm-2 control-label">专业类别</label>
                                <div class="col-sm-4">
                                       <citms:dbselect name="type" classCode="MAJOR_TYPE" showBlank="true" css="form-control" value="${bean.type}" ></citms:dbselect>
                                </div>
                            </div>
                            
                             <div class="form-group">
                                <label class="col-sm-2 control-label">学制年度</label>
                                <div class="col-sm-4">
                                    <input type="text" name="year" id="year" value="${bean.year}" class="form-control">
                                </div>
                                
                            </div>
                            
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">专业介绍</label>
                                <div class="col-sm-10">
                                   <textarea rows="5" name="text" style="width: 100%" class="form-control">${bean.text}</textarea>
                                </div>
                            </div>
                       
                        <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary"  type="submit">保存</button>
                                    <a target="_self"  href="/schoolMajor/list" class="btn btn-white" type="button">返回</a>
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
    <script type="text/javascript" src="/js/h/plugins/layer/layer.min.js"></script>
    <!-- iCheck -->
    <script src="/js/h/plugins/iCheck/icheck.min.js"></script>
     <script src="/js/h/plugins/validate/jquery.validate.min.js"></script>
    <script src="/js/h/plugins/validate/messages_zh.min.js"></script>
    
    <script>
    
    function remoteData(fieldName){
    	return {
    		 type:"post",
             url:"/schoolMajor/checkOnly",             //servlet
             data:{
               id:'${bean!=null?bean.id:null}',
               key:fieldName,
				   value:function(){return $("#"+fieldName+"").val();}
             } 
            } 
    };
    
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
            
            var icon = "<i class='fa fa-times-circle'></i> ";
            $("#formdata").validate({
                rules: {
                    name: {
                    	required:true,
                    	minlength:4,
                    	remote:remoteData('name')
                    	},
                    type:{
                    	required:true
                    },
                    year:{
                    	required:true,
                    	digits:true
                    }
                },
                submitHandler:function(){
                	$.ajax({
                		type: "post",
                		url: "/schoolMajor/save",
                		data:$("#formdata").serialize(),
                		success: function(data) {
                			$("#id").val(data.item.id);
                			layer.msg('成功保存', {icon: 1});
                	}})
                	
                },
                messages: {
                	name: {
                		required:icon + "请输入专业名称",
                		minlength: icon + "专业名称必须4个字符以上",
                		remote:icon +"专业名称已经存在"
                	},
                	type:{
                		required:icon + "请选择专业类别"
                	}, 
                    year: {
                        number:  "学制年度必须为数字",
                    }
                }
            });
            
            
        });
    </script>

</body>

</html>