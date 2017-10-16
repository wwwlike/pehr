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
    <title>缴费情况</title>
    <link rel="shortcut icon" href="favicon.ico"> <link href="/css/h/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/css/h/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/css/h/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/css/h/animate.css" rel="stylesheet">
    <link href="/css/h/style.css?v=4.0.0" rel="stylesheet"><base target="_blank">
	<style type="text/css">
	
	 div{
		padding-top: 7px;
		margin-bottom: 0;
	}
	</style>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>缴费情况</h5>
                        <div class="ibox-tools">
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form method="post"  id="formdata" class="form-horizontal">
                        	<input type="hidden" name="id" value="${bean.id}" >
                            <div class="form-group">
                                <label class="col-sm-1 control-label">缴费名称：</label>
                                <div class="col-sm-2 " style="">
                                   ${bean.title}
                                </div>
                                <label class="col-sm-1 control-label">缴费类别：</label>
                                <div class="col-sm-2">
                                       <citms:customLabel key="PAY_TYPE"  value="${bean.type}" />
                                </div>
                                <label class="col-sm-1 control-label">缴费金额：</label>
                                <div class="col-sm-2">
                                   ${bean.pay}
                                </div>
                                <label class="col-sm-1 control-label">是否押金：</label>
                                <div class="col-sm-2">
                                   ${bean.isBack?"是":"否"}
                                </div>
                            </div>
                             <div class="form-group">
                                <label class="col-sm-1 control-label">缴费日期：</label>
                                <div class="col-sm-2">
                                     <fmt:formatDate value="${bean.payDate}"/>
                                </div>
                            
                                <label class="col-sm-1 control-label">缴费对象：</label>
                                <div class="col-sm-7">
                                	<c:if test="${bean.schoolId!=null}">
                                	<b>学校：</b><citms:nameShow id="${bean.schoolId}" type="school"/>&nbsp;&nbsp;&nbsp;
                                	</c:if>
                                	
                                	<c:if test="${bean.beginYear!=null}">
                                	<b>学年：</b>	${bean.beginYear}年&nbsp;&nbsp;&nbsp;
                                	</c:if>
                                	
                                	<c:if test="${bean.majorId!=null}">
                                	<b>专业：</b>	<citms:nameShow id="${bean.majorId}" type="major"/>&nbsp;&nbsp;&nbsp;
                                	</c:if>
                                	
                                	
                                	<c:if test="${bean.sclassIds!=null}">
                                	<b>班级：</b>	<citms:nameShow id="${bean.sclassIds}" type="sclass"/>&nbsp;&nbsp;&nbsp;
                                	</c:if>
                                    
                                </div>
                            </div>
                        	  <div class="form-group">
                                <label class="col-sm-1 control-label">缴费说明：</label>
                                <div class="col-sm-11">
                                    ${bean.remark}
                                </div>
                            </div>  
                          <div class="hr-line-dashed"></div>
                            
                           <div class="form-group">
                                <label class="col-sm-1 control-label">应缴人数：</label>
                                <div class="col-sm-2">
                                    ${size}人
                                </div>
                                <label class="col-sm-1 control-label">已收人数：</label>
                                <div class="col-sm-2">
                                <c:set var="ysrs" value="0"></c:set>
                                <c:forEach items="${infos}" var="info">
                                	<c:if test="${info.detail.payStatus==1}">
                                	 <c:set var="ysrs" value="${ysrs+1}"></c:set>
                                	</c:if>
                                </c:forEach>
                                ${ysrs}人
                                </div>
                                <label class="col-sm-1 control-label">应缴总额：</label>
                                <div class="col-sm-2">
                                      <c:set var="total" value="0"></c:set>
                                <c:forEach items="${infos}" var="info">
                                	 <c:set var="total" value="${total+bean.pay}"></c:set>
                                </c:forEach>
                                ${total}元
                                    
                                </div>
                                <label class="col-sm-1 control-label">实收总额：</label>
                                <div class="col-sm-2">
                                   <c:set var="sssl" value="0"></c:set>
                                <c:forEach items="${infos}" var="info">
                                	 	<c:set var="sssl" value="${ysrs+info.detail.paid}"></c:set>
                                </c:forEach>
                                ${sssl}元
                                </div>
                            </div>
                            
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-6 col-sm-offset-5">
                                    <button class="btn btn-primary"  type="button">详情</button>
                                    <a target="_self"  href="/schoolPay/list" class="btn btn-white" type="button">返回</a>
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