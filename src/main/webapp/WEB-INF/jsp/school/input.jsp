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
    

    <title>H+ 后台主题UI框架 - 基本表单</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="/css/h/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/css/h/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/css/h/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/css/h/animate.css" rel="stylesheet">
    <link href="/css/h/style.css?v=4.0.0" rel="stylesheet"><base target="_blank">
</head>

<body >
    <div class="wrapper row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <form method="post" action="/school/save" id="formdata" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">校区名称</label>
                                <div class="col-sm-4">
                                    <input type="text" name="name" class="form-control">
                                </div>
                                <label class="col-sm-2 control-label">所在城市</label>
                                <div class="col-sm-4">
                                
                                <citms:dbselect name="area" classCode="AREA" css="form-control"  ></citms:dbselect>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">详细地址</label>
                                <div class="col-sm-10">
                                    <input type="text" name="address" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">开设专业</label>
                                <div class="col-sm-10">
                                      <c:forEach var="major" items="${majors}" varStatus="s" >
                                    <label class="checkbox-inline i-checks" >
                                        <input type="checkbox" name="major[${s.index}].id" value="${major.id}" /><i></i> ${major.name}
                                        
                                        </label>
                                        </c:forEach>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">校区简介</label>
                                <div class="col-sm-10">
                                   <textarea rows="5" name="text" style="width: 100%" class="form-control"></textarea>
                                </div>
                            </div>
                        <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" id="ajaxSubmit" type="button">保存</button>
                                    <button class="btn btn-white" type="submit">关闭</button>
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
    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
            
            
            $("#ajaxSubmit").click(function(){
            	$.ajax({
            		type: "get",
            		url: "/school/save",
            		data:$("#formdata").serialize(),
            		success: function(data) {
            			
            			alert(data.msg);
            		}})
            });	

        });
        
        
   
    </script>

</body>

</html>