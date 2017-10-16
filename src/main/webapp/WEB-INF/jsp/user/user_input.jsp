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
    

    <title>用户添加表单</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="/css/h/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/css/h/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/css/h/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/css/h/animate.css" rel="stylesheet">
    <link href="/css/h/style.css?v=4.0.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>用户编辑</h5>
                        <div class="ibox-tools">
                          
                           
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form id="inputForm" method="post" class="form-horizontal">
                        <input type="hidden" name="id" id="id" value="${bean.id}">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">用&nbsp;户&nbsp;名:</label>
                                <div class="col-sm-4">
                                    <input type="text" name="username" value="${bean.username}" class="form-control"/>
                                </div>
                                <label class="col-sm-2 control-label">姓　　名:</label>
                                <div class="col-sm-4">
                                    <input type="text" name="name" id="name" value="${bean.name}" class="form-control"/>
                                </div>
                             </div>   
                             
                             <div class="form-group">
                                 <label class="col-sm-2 control-label">联系电话:</label>
                                <div class="col-sm-4">
                                    <input type="text" name="phoneNum"  id="phoneNum" value="${bean.phoneNum}"  class="form-control"/>
                                </div>
                              <label class="col-sm-2 control-label">电子邮箱:</label>
                                <div class="col-sm-4">
                                    <input type="text" name="email" id="email" value="${bean.email}" class="form-control" />
                                </div>
                              </div>
                            
                             <div class="form-group">
                                <label class="col-sm-2 control-label">所在校区:</label>
                               <div class="col-sm-4">
                               <c:if test="${user.school!=null}">
                                    <input type="hidden" name="school.id" value="${bean.school!=null?bean.school.id:user.school.id}" class="form-control" />
                               		<label class=" control-label">${bean.school!=null?bean.school.name:user.school.name}</label>
                               </c:if>
                                <c:if test="${user.school==null }">
                                    <select class="form-control m-b" name="school.id">
                                        <option value="">请选择</option>
                                       	<c:forEach var="school" items="${schools}">
                                       		<option value="${school.id}" ${school.id==bean.school.id?'selected':'' }>${school.name}</option>
                                       	</c:forEach>
                                    </select>
                                  </c:if>
                                </div>
                                
                                <label class="col-sm-2 control-label">角色类型:</label>
                                <div class="col-sm-4">
                                    <select class="form-control m-b" name="role.id" id="role_id">
                                        <option value="">请选择</option>
                                       	<c:forEach var="role" items="${roles}">
                                       		<option value="${role.id}" ${role.id==bean.role.id?'selected':'' } >${role.name}</option>
                                       	</c:forEach>
                                    </select>
                                </div>
                               
                            </div>
                            
                             <div class="form-group">
                               <label class="col-sm-2 control-label">入职日期：</label>
                                        <div class="col-sm-4">
                                            <input readonly  class="form-control layer-date" value='${bean.joinDate}'  name="joinDate"  id="_joinDate">
                                            <label class="laydate-icon inline demoicon" onclick="laydate({elem: '#_joinDate',format:'YYYY-MM-DD'});"></label>
                                        </div>
                                <label class="col-sm-2 control-label">紧急联系人:</label>
                                <div class="col-sm-4">
                                    <input type="text" name="contact" value="${bean.contact}" class="form-control">
                                </div>
                                </div>
                            <div class="form-group">
                                 <label class="col-sm-2 control-label">紧急联系电话:</label>
                                <div class="col-sm-4">
                                    <input type="text" name="contactPhoneNum"  value="${bean.contactPhoneNum}" class="form-control">
                                </div>
                            </div>
                            
                            
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">个人说明</label>
                                <div class="col-sm-10">
                                   <textarea rows="5" name="text" style="width: 100%" class="form-control" >${bean.text}</textarea>
                                  <span class="help-block m-b-none">帮助了解该角色的使用说明</span>
                                </div>
                            </div>
                            
                        <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-warning btn-xs"  type="submit">保存</button>
                                     <a href="/user/list" target="_self" class="btn btn-warning btn-xs">返回</a>
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
	<script src="/js/h/plugins/layer/laydate/laydate.js"></script>
    <!-- iCheck -->
    <script src="/js/h/plugins/iCheck/icheck.min.js"></script>
    <script type="text/javascript" src="/js/h/plugins/layer/layer.min.js"></script>
    <script src="/js/h/plugins/validate/jquery.validate.min.js"></script>
    <script src="/js/h/plugins/validate/messages_zh.min.js"></script>
    <script>
   
    
    function remoteData(fieldName){
    	return {
    		 type:"post",
             url:"/user/checkOnly",             //servlet
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
            $("#inputForm").validate({
                rules: {
                    username: {
                    	required:true,
                    	minlength:6,
                    	remote:remoteData('username')
                    	},
                    phoneNum:{
                    	required:true,
                    	remote:remoteData('phoneNum')
                    },
                    "role.id":{
                    	required: true
                    },
                    name: {
                        required: true,
                        minlength:2
                    },
                    email: {
                        required: true,
                        email: true,
                        remote:remoteData('email')
                    }
                  
                },
                submitHandler:function(){
                	$.ajax({
                		type: "get",
                		url: "/user/save",
                		data:$("#inputForm").serialize(),
                		success: function(data) {
                			$("#id").val(data.item.id);
                			layer.msg('成功保存', {icon: 1});
                		}})
                },
                messages: {
                	name: {
                		required:icon + "请输入你的姓名"
                		},
                	"role.id": {
                    		required:icon + "请选择用户角色类型"
                    		},
                	phoneNum:{
                		required:icon + "请输入你的联系方式",
                		remote:icon +"联系方式已经存在"
                	}, 
                    username: {
                        required:  "请输入您的用户名",
                        minlength: icon + "用户名必须六个字符以上",
                    	remote:icon+"用户名已经存在"
                    },
                    email: {
                    	required:icon + "请输入您的E-mail",
                		remote:icon +"email已存在"
                    }
                }
            });
        });
      
    </script>

</body>

</html>