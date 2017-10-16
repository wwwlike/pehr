<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/citms.tld" prefix="citms" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  

<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>字典添加</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.ico"> <link href="/css/h/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/css/h/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/css/h/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/css/h/animate.css" rel="stylesheet">
    <link href="/css/h/style.css?v=4.0.0" rel="stylesheet">
</head>

<body >
    <div class="wrapper row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <form method="post" name="formdata" id="formdata" class="form-horizontal">
                            <input type="hidden" name="id" id="id"  value="${bean.id}" class="form-control">
                        
                            <div class="form-group">
                                <label class="col-sm-2 control-label">类别名称</label>
                                <div class="col-sm-4">
                                    <input type="text" name="name" id="name" value="${bean.name}" ${bean.id!=null?"readonly":""}   class="form-control">
                                </div>
                                <label class="col-sm-2 control-label">类别代码</label>
                                <div class="col-sm-4">
                                     <input type="text" name="code" id="code" value="${bean.code}" ${bean.id!=null?"readonly":""} class="form-control">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label">是否开放</label>
                                <div class="col-sm-4">
                                      <label class="checkbox-inline i-checks" >
                                        <input type="checkbox" name="open" value="1" ${(bean!=null&&bean.open)?'checked':''}   ${user.school==null||bean==null?"":"disabled"} /><i></i>开放
                                       </label>
                                </div>
                                <label class="col-sm-2 control-label">&nbsp;</label>
                                <div class="col-sm-4">
                                     &nbsp;
                                </div>
                            </div>
                          <div class="ibox-content">

                      <div class="col-sm-12">
                <div class="ibox float-e-margins">
                        <div class="ibox-tools" style="float: left">
                         <c:if test="${user.school==null}" >
                                    <button class="btn btn-warning btn-xs"  type="submit">保存</button>
                         </c:if>
                         <!-- 编辑时，且（是公司||或可以修改） -->
 						<a href="#"  id="addLine" class="btn btn-primary btn-xs" style="${bean.id==null||(user.school!=null && !bean.open)?'display: none':''}" >新增明细</a>                    
                        </div>
                    </div>
                    
                   
                    <div class="ibox-content" id="details_div" style="${(bean==null||bean.id==null)?'display:none':''}" >
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>级别</th>
                                    <th>内容</th>
                                    <th>标识</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody id="detail_tbody">
                            	<c:forEach var="detail" items="${bean.details}" varStatus="s">
                                <tr>
                                    <td>${s.index+1}</td>
                           			<td>${detail.school==null?"公用":"专用"}</td>
                                    <td>${detail.label}</td>
                                    <td>${detail.value}</td>
									<td>
										<c:if test="${detail.school==null }">
											<a href="#" target="_self" class="btn btn-primary btn-xs" id="ajaxSubmit">删除</a>
											<a href="#" target="_self" class="btn btn-primary btn-xs" id="ajaxSubmit">停用</a>
										</c:if>
										<c:if test="${detail.school!=null }">
											<a href="#" target="_self" class="btn btn-primary btn-xs" id="ajaxSubmit">删除</a>
										</c:if>
									
									</td>                                    
                                </tr>
                                             
                              </c:forEach>
                            </tbody>
                        </table>
                    </div>
                   
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
    <script src="/js/h/plugins/validate/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/js/h/plugins/layer/layer.min.js"></script>
    

    <!-- iCheck -->
    <script src="/js/h/plugins/iCheck/icheck.min.js"></script>
    <script>

    function remoteData(fieldName){
    	return {
    		 type:"post",
             url:"/selectClass/checkOnly",             //servlet
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
            
            
            
            $("#addLine").click(function(){
            	$("#details_div").show();
            	var index=$("#detail_tbody tr").size()+1;
            	$("#detail_tbody").append("<tr>"+
            			"<td>"+index+"<input type='hidden' id='detail_id_"+index+"' /> </td>"+
            			"<td>${user.school==null?'公用':'专用'}</td>"+
            			"<td id='detail_label_"+index+"'><input type='text' id='label"+index+"' class='form-control col-md-1 input-sm'></td>"+
            			"<td id='detail_value_"+index+"'><input type='text' id='value"+index+"' class='form-control  input-sm'></td>"+
            			"<td><a href='#' target='_self' class='btn btn-primary btn-xs' onclick='addDetail("+index+")' >保存</a></td>"+
            			"</tr>");
            });	
            
            
            var icon = "<i class='fa fa-times-circle'></i> ";
            $("#formdata").validate({
                rules: {
                    code: {
                    	required:true,
                    	minlength:2,
                    	remote:remoteData('code')
                    	},
                    name:{
                    	required:true,
                    	remote:remoteData('name')
                    }
                },
                submitHandler:function(){
                	$.ajax({
                		type: "get",
                		url: "/selectClass/save",
                		data:$("#formdata").serialize(),
                		success: function(data) {
                			$("#id").val(data.item.id);
                			$("#addLine").show();
                			layer.msg('成功保存', {icon: 1});
                		}})
                },
                messages: {
                	code:{
                		required:icon + "请输入字典编码",
                        minlength: icon + "字典编码必须2个字符以上",
                		remote:"字典编码已存在"
                	}, 
                    name: {
                        required:  "请输入字典名称",
                    	remote:icon+"字典名称已经存在"
                    }
                }
            });
            
            
            
        });
    
   
    
    function addDetail(index){
    	var value=$("#value"+index).val();
    	var label=$("#label"+index).val();
    
    	$.ajax({
    		type: "get",
    		url: "/selectClass/detailSave",
    		data:{
    			'selectClass.id':$("#id").val(),
    			'value':value,
    			'label':label
    		},
    		success: function(data) {
    		 	$("#detail_label_"+index).html(label);
    		 	$("#detail_value_"+index).html(value);
    		 	$("#detail_value_"+index).html(value);
    		}})
    	
    };
        
   
    </script>

</body>

</html>