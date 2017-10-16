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
    <title>缴费</title>
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
                        <h5>${bean==null?"新建":"编辑"}缴费</h5>
                        <div class="ibox-tools">
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form method="post"  id="formdata" class="form-horizontal">
                        <input type="hidden" id="id" name="id" value="${bean.id}" >
                            <div class="form-group">
                                <label class="col-sm-2 control-label">缴费名称</label>
                                <div class="col-sm-4">
                                    <input type="text" name="title" id="title" value="${bean.title}" class="form-control">
                                </div>
                                <label class="col-sm-2 control-label">缴费类别</label>
                                <div class="col-sm-4">
                                       <citms:dbselect name="type" classCode="PAY_TYPE" showBlank="true" css="form-control" value="${bean.type}" ></citms:dbselect>
                                </div>
                            </div>
                            
                             <div class="form-group">
                                <label class="col-sm-2 control-label">缴费金额</label>
                                <div class="col-sm-4">
                                    <input type="text" name="pay" id="pay" value="${bean.pay}" class="form-control">
                                </div>
                                
                                <label class="col-sm-2 control-label">缴费时间</label>
                                <div class="col-sm-4">
                                   <input readonly  class="form-control layer-date" value='<fmt:formatDate  value="${bean.payDate}"  />'  name="payDate"  id="_payDate">
                                   <label class="laydate-icon inline demoicon" onclick="laydate({elem: '#_payDate',format:'YYYY-MM-DD'});"></label>
                                </div>
                            </div>
                            
                             <div class="form-group">
                                <label class="col-sm-2 control-label">押金退还</label>
                                <div class="col-sm-4">
                               	 <label class='checkbox-inline i-checks'> <input type='checkbox' name='isBack' value='1' ${bean.isBack?"checked":""} /></label><i></i>是
                                </div>
                                <label class="col-sm-2 control-label">&nbsp;</label>
                                <div class="col-sm-4">
                                  
                                </div>
                            </div>
                            
                             <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">缴费学校</label>
                                <div class="col-sm-4">
                                	<select name="schoolId" id="schoolId" class="form-control schoolPaySelect">
                                	<option value=""> 请选择</option>
	                                	<c:forEach items="${schools}" var="school">
	                                		<option value="${school.id}" ${(bean!=null&&bean.schoolId==school.id)?"selected":""}  >${school.name}</option>
	                                	</c:forEach>
                                	</select>
                                </div>
                                
                                 <label class="col-sm-2 control-label">年度专业</label>
                                <div class="col-sm-2">
                                	<citms:dbselect css="form-control schoolPaySelect"  name="year" classCode="YEAR" showBlank="false" ></citms:dbselect>
                                </div>
                                <div class="col-sm-2">
                                	<select name="majorId" id="majorId" class="form-control schoolPaySelect">
                                	<option value=""> 请选择</option>
	                                	<c:forEach items="${majors}" var="major">
	                                		<option value="${major.id}" ${(bean!=null&&bean.majorId==major.id)?"selected":""}>${major.name}</option>
	                                	</c:forEach>
                                	</select>
                                	
                                </div>
                            </div>
                            
                             <div class="form-group">
                                <label class="col-sm-2 control-label">收费班级</label>
                                <div class="col-sm-10">
                                	<div class="divSclass" sclassIds="${bean.sclassIds}"></div>
                                </div>
                            </div>
                            
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">缴费用途</label>
                                <div class="col-sm-10">
                                   <textarea rows="5" name="text" style="width: 100%" class="form-control">${bean.remark}</textarea>
                                </div>
                            </div>
                       
                        <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary"  type="submit">保存</button>
                                    <button class="btn btn-primary fabu"  ${(bean==null)?"style='display: none'":"" } >发布</button>
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
    <script src="/js/h/plugins/layer/laydate/laydate.js"></script>
    
    <!-- iCheck -->
    <script src="/js/h/plugins/iCheck/icheck.min.js"></script>
    <script src="/js/h/plugins/validate/jquery.validate.min.js"></script>
    <script src="/js/h/plugins/validate/messages_zh.min.js"></script>
    <script src="/js/zfc/schoolPay.js"></script>
    
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
        	$(".fabu").click(function(){
        		if(confirm("你确定发布该收费么?")){
        				$.ajax({
                    		type: "get",
                    		url: "/schoolPay/changeStatus",
                    		data:{"id":$("#id").val(),"value":"1"},
                    		success: function(data) {
                    			layer.msg('发布成功,正在跳转.', {icon: 1});
                    			//间隔几秒跳转
                    			 setTimeout(function (){ 
            						location.href="/schoolPay/view?id="+$("#id").val();
            					}, 2000);//做延时是为了 时间控件
                    	},error:function(data){
                    		ayer.msg('发布失败,已经发布或者发布人不是创建人.', {icon: 1});
                    	}
                    		
        				
        				})
        		}
        	})
        	
        	
        	$('.i-checks').iCheck({
                  checkboxClass: 'icheckbox_square-green',
                  radioClass: 'iradio_square-green',
            });
            var icon = "<i class='fa fa-times-circle'></i> ";
            $("#formdata").validate({
                rules: {
                    pay: {
                    	required:true,
                    	number:true
                    	},
                    type:{
                    	required:true
                    },
                    title:{
                    	required:true
                    },
                    sclassIds:{
                    	required:true
                    },
                    payDate:{
                    	required:true
                    }
                },
                submitHandler:function(){
                	$.ajax({
                		type: "post",
                		url: "/schoolPay/save",
                		data:$("#formdata").serialize(),
                		success: function(data) {
                			$("#id").val(data.item.id);
                			if(data.item.status==0){
                				$('.fabu').show();
                				layer.msg('成功保存', {icon: 1});
                			}else if(data.item.status==1){
                				location.href="/schoolPay/input?id="+data.item.id;
                			}
                	}})
                	
                },
                messages: {
                	
                }
            });
            
            
        });
    </script>

</body>

</html>