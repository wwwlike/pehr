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
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>layout 后台大布局 - Layui</title>

  <link rel="shortcut icon" href="favicon.ico"> 
  <link href="/css/h/bootstrap.min.css?v=3.3.5" rel="stylesheet">
  <link href="/css/h/font-awesome.css?v=4.4.0" rel="stylesheet">
  <link href="/css/h/plugins/iCheck/custom.css" rel="stylesheet">
  <link href="/css/h/animate.css" rel="stylesheet">
  <link href="/css/h/style.css?v=4.0.0" rel="stylesheet"><base target="_blank">
  <script src="/mingdao/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript" src="/plugins/layer/layer.js"></script>
  <script type="text/javascript" src="/js/zfc/student_input.js"></script>
  <script type="text/javascript" src="/plugins/select2/js/select2.min.js"></script>

  <script src="/js/h/plugins/layer/laydate/laydate.js"></script>
  <script src="/js/h/plugins/iCheck/icheck.min.js"></script>
  <script src="/js/h/plugins/validate/jquery.validate.min.js"></script>
  <script src="/js/h/plugins/validate/messages_zh.min.js"></script>


</head>
<body>
<div id="page-content" style="padding:10px;">
					
					<div class="row">
					   <div class="panel">
					            <!--===================================================-->
					            <form class="form-horizontal" id="formdata">
					            	<input type="hidden" name="id" id="id" />
					            
					            
					                <div class="panel-body">
					                    <div class="form-group">
					                        <label class="col-sm-2 control-label" for="demo-is-inputsmall">学生姓名</label>
					                        <div class="col-sm-4">
					                            <input type="text" placeholder="" class="form-control" name="name" id="name" value="${bean.name}">
					                        </div>
					                        
					                        <label class="col-sm-2 control-label" for="demo-is-inputsmall">籍　　贯</label>
					                        <div class="col-sm-4">
					                            <input type="text" placeholder="" class="form-control" name="jg" id="jg" value="${bean.jg}">
					                        </div>
					                  	</div>  
					                        
					                    <div class="form-group">    
					                        <label class="col-sm-2 control-label" for="demo-is-inputsmall">电话号码</label>
					                        <div class="col-sm-4">
					                            <input type="text" placeholder="" class="form-control" id="tel" name="tel">
					                        </div>
					                         <label class="col-sm-2 control-label" for="demo-is-inputsmall">身份证号</label>
					                        <div class="col-sm-4">
					                            <input type="text" placeholder="请输入身份证" class="form-control" name="sfz" id="sfz" value="${bean.sfz}">
					                        </div>
					                    </div>
					                    <div class="form-group">     
					                        <label class="col-sm-2 control-label" for="demo-is-inputsmall">邮箱地址</label>
					                        <div class="col-sm-4">
					                            <input type="text" placeholder="" class="form-control" id="email" name="email">
					                        </div>
					                        
					                         <label class="col-sm-2 control-label" for="demo-is-inputsmall">QQ号码</label>
					                        <div class="col-sm-4">
					                            <input type="text" placeholder="" class="form-control" id="" name="qq">
					                        </div>
					                    </div>
					                    
					                     <div class="form-group">
					                        <label class="col-sm-2 control-label" for="demo-is-inputsmall">民　　族</label>
					                        <div class="col-sm-4">
					                            <input type="text" placeholder="" class="form-control" id ="mz" name="mz">
					                        </div>
					                        
					                        <label class="col-sm-2 control-label" for="demo-is-inputsmall">住　　址</label>
					                        <div class="col-sm-4">
					                            <input type="text" placeholder="" class="form-control" id="address"  name="address">
					                        </div>
					                    </div>
					                    
					                    <div class="form-group">
					                        <label class="col-sm-2 control-label" for="demo-is-inputsmall">学校班级</label>
					                        <div class="col-sm-4">
					                        	
					                        	<select name="sclassId" class="demo_select2 form-control">
					                               <c:forEach items="${sclasses}" var="group">
					                                <optgroup label="${group.moduleName}">
					                                   <c:forEach items="${group.schoolClass}" var="sclass">
					                                    <option value="${sclass.id}">${sclass.name}</option>
					                                    </c:forEach>
					                                </optgroup>
					                                </c:forEach>
					                            </select>
					                        
					                            <c:if test="${user.school!=null}">
					                           	 	<input type="hidden" placeholder="" class="form-control" name="school.id" value="${user.school.id}">
					                           	 
					                            </c:if>
					                        </div>
					                        
					                         <label class="col-sm-2 control-label" for="demo-is-inputsmall">学生类型</label>
							                        <div class="col-sm-4">
							                           <citms:dbselect name="type" css="form-control" id="type" classCode="STUDENT_TYPE" ></citms:dbselect>
							                        </div>
					                    </div>
					                </div>
					            </form>
					        </div>
					</div>
                </div>
</body>
</html>