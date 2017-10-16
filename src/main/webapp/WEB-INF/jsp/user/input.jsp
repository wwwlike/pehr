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
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

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
                        <h5>用户编辑</h5>
                        <div class="ibox-tools">
                            <a href="/user/list" target="_self" class="btn btn-primary btn-xs">返回</a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form method="post" action="/user/save" id="formdata" class="form-horizontal">
                        <c:if test="${bean!=null&&bean.id!=null}">
                           <input type="hidden" name="id" value="${bean.id}">
                        </c:if>
                        
                            <div class="form-group">
                                <label class="col-sm-2 control-label">用&nbsp;户&nbsp;名:</label>
                                <div class="col-sm-4">
                                    <input type="text" name="username" value="${bean.username}" class="form-control">
                                </div>
                                <label class="col-sm-2 control-label">姓　　名:</label>
                                <div class="col-sm-4">
                                    <input type="text" name="name" value="${bean.name}" class="form-control">
                                </div>
                             </div>   
                             
                             <div class="form-group">
                                 <label class="col-sm-2 control-label">联系电话:</label>
                                <div class="col-sm-4">
                                    <input type="text" name="phoneNum"  value="${bean.phoneNum}" class="form-control">
                                </div>
                              <label class="col-sm-2 control-label">电子邮箱:</label>
                                <div class="col-sm-4">
                                    <input type="text" name="email" value="${bean.email}" class="form-control">
                                </div>
                              </div>
                            
                             <div class="form-group">
                                <label class="col-sm-2 control-label">所在校区:</label>
                               <div class="col-sm-4">
                                    <select class="form-control m-b" name="school.id">
                                        <option value="">请选择</option>
                                       	<c:forEach var="school" items="${schools}">
                                       		<option value="${school.id}" ${school.id==bean.school.id?'selected':'' }>${school.name}</option>
                                       	</c:forEach>
                                    </select>
                                </div>
                                
                                <label class="col-sm-2 control-label">角色类型:</label>
                                <div class="col-sm-4">
                                    <select class="form-control m-b" name="role.id">
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
                                            <input readonly class="form-control layer-date" value='${bean.joinDate}' name="joinDate "id="_joinDate">
                                            <label class="laydate-icon inline demoicon" onclick="laydate({elem: '#_joinDate'});"></label>
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
                                    <button class="btn btn-primary" id="ajaxSubmit" type="button">保存</button>
                                    <button class="btn btn-white" type="button">返回</button>
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
    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
            
            
            $("#ajaxSubmit").click(function(){
            	$.ajax({
            		type: "get",
            		url: "/user/save",
            		data:$("#formdata").serialize(),
            		success: function(data) {
            			
            			alert(data.msg);
            		}})
            	
            });	

            
            
        });
        
        
   
    </script>

</body>

</html>