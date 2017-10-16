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
<title>学生信息</title>

  <link rel="shortcut icon" href="favicon.ico"> 
  <link href="/css/h/bootstrap.min.css?v=3.3.5" rel="stylesheet">
  <link rel="stylesheet" href="/css/app.css" type="text/css" />
  <link href="/css/h/font-awesome.css?v=4.4.0" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="/css/mdQuery.css"/>
  <link rel="stylesheet" type="text/css" href="/plugins/dropzone/dropzone.min.css"/>
  
  <!-- <link href="/css/nifty.min.css" rel="stylesheet">
   -->
  
	
    

<style type="text/css">

.inputHidden {
    -webkit-box-flex: 1;
    -ms-flex: 1 0 0%;
    flex: 1 0 0%;
   
    
    -webkit-appearance: none;
    border-width: 0px;
    background: transparent;
}
 
 
 
.inputHidden:hover:not(:focus), .inputHidden:hover:not(:focus) {
    border-width: 1px;
    border-color: #f5f5f5!important;
}


.updateSuccess {
    border-width: 1px;
    border-color: #f5f5f5!important;
}

.bottomLine {
    position: absolute;
    bottom: -1px;
    left: 20px;
    width: 90px;
    height: 2px;
    margin-top: 16px;
    transition: all .15s ease-in;
}

</style>
</head>
<body >
<br>
 <form id="inputForm" method="post" class="form-horizontal">
<div class="col-sm-6">
                      <section class="panel panel-default">
                        <header class="panel-heading bg-danger lt no-border">
                          <div class="clearfix">
                            <a href="#" class="pull-left    m-r"><!-- thumb avatar b-3x m-r  || img-circle -->
                              <img src="/studentInfo/file/getPhoto?studentId=${bean.id}" height="105px" width="75px" class="">
                            </a>
                             <div class="text-white pull-right ">
                              <div class="text-muted">缴费状态111：欠费</div>
                              <div class="text-muted">取证情况：未取得</div>
                              <div class="text-muted">沟通情况：3次</div>
  							  <div class="text-muted">评价情况：优秀</div>
							 </div>          
                            <div class="clear">
                              <div class="h3 m-t-xs m-b-xs text-white">
                                ${bean.name}
                              </div>
                              <small class="text-muted"><citms:nameShow id="${bean.schoolId}" type="school"/></small>
                              <small class="text-muted"><citms:nameShow id="${bean.sclassId}" type="sclass"/></small>
                              <small class="text-muted"><citms:customLabel key="STUDENT_TYPE" value="${bean.type}" /></small>
                            </div> 
                            
                                
                          </div>
                          
                        </header>
                            
           <div class="col-sm-6 portlet  ">
			<section class="row  list-group-item">	
               <ul class="talkNav boxSizing"> 
	               <li bottomLine="left: 20px" data-type="basic" class="ThemeColor3">基本信息</li>
	               <li bottomLine="left: 90px" data-type="finish" >毕业信息</li>  
	               <!-- <li bottomLine="left: 160px" data-type="family">家庭信息</li> --> 
	               <!-- --> 
	               <c:if test="${bean.type==2}"></c:if>
	               <li bottomLine="left: 160px" data-type="dispatch">派遣信息</li>
	               <li bottomLine="left: 230px" data-type="chat">沟通记录</li> 
	               <li bottomLine="left: 300px" data-type="money">缴费信息</li> 
	               <li bottomLine="left: 370px" data-type="certificate">取证情况</li>
	               <li bottomLine="left: 440px" data-type="impress">学生印象</li>   
	               <li bottomLine="left: 510px" data-type="file">附件信息</li>
	              
	                <i class="bottomLine ThemeBGColor3" style="left: 20px;"></i> 
               </ul>
 			 </section>
 			</div>
 			<input type="hidden" id="studentId"  value="${bean.id}">
			<input type="hidden" name="student_id" url="/student/update"  value="${bean.id}">
			
			<div id="basic" class="col-sm-6 portlet ui-sortable"  >
				<div class="row  panel-info portlet-item list-group-item">
					 <div class="col-xs-4 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>身</span><span>份</span><span>证</span><span>号</span></span>   
							<input class="inputHidden form-control quicksave" type="text" name="sfz" inputForm="student" value="${bean.sfz}">
					</div>
					
					<div class="col-xs-4 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>出</span><span>生</span><span>日</span><span>期</span></span><br>   
							<span>
							<input  style="width:65% " class="inputHidden form-control layer-date quicksave" type="text" name="csrq" id="csrq" inputForm="student" value="${bean.csrq}">
								<label targetId='csrq'  class="laydate-icon inline demoicon" onclick="laydate({elem: '#csrq',format:'YYYY-MM-DD'});"></label>
							</span>
					</div>
					
					<div class="col-xs-4 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>性</span><span>别</span></span>  
							<span>
								<citms:dbselect css="inputHidden form-control quicksave"  classCode="SEX" inputForm="student" name="xb" value="${bean.xb}" />
							</span>
					</div>
				</div>
						
				<div class="row  panel-info portlet-item list-group-item">
					<div class="col-xs-4 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>年</span><span>龄</span></span>   
							<span><input  class="inputHidden form-control quicksave" inputForm="student" name="age" type="text" value="${bean.age}"></span>
					</div>		
					<div class="col-xs-4 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>民</span><span>族</span></span>   
							<span><input  class="inputHidden form-control quicksave" inputForm="student" name="mz" type="text" value="${bean.mz}"></span>
					</div>
					<div class="col-xs-4 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>籍</span><span>贯</span></span><input class="inputHidden form-control quicksave" type="text" name="jg" id="jg" inputForm="student" value="${bean.jg}">
					</div>
				</div>
			 
				<div class="row  panel-info  list-group-item">
					<div class="col-xs-4 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>联</span><span>系</span><span>电</span><span>话</span></span>   
							<input class="inputHidden form-control quicksave" type="text" name="tel" id="tel" inputForm="student" value="${bean.tel}">
					</div>
					<div class="col-xs-4 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>电子邮箱</span></span>   
							<input class="inputHidden form-control quicksave" type="text" name="email" id="email" inputForm="student" value="${bean.email}">
					</div>
					<div class="col-xs-4 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>QQ号码</span></span>   
							<input class="inputHidden form-control quicksave" type="text" name="qq" id="qq" inputForm="student" value="${bean.tel}">
					</div>
				</div>
					
					
				<div class="row  panel-info  list-group-item">
					<div class="col-xs-4 ">
							<i class="fa fa-fw fa-envelope"></i> 
								<span class="attributeLeft"><span>健康状况</span></span>
								<input class="inputHidden form-control quicksave" type="text" name="health" id="health" inputForm="student" value="${bean.health}">
						</div>	
					<div class="col-xs-4 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>身</span><span>高</span></span>   
							<span><input  class="inputHidden form-control quicksave" inputForm="student" name="high" type="text" value="${bean.high}"></span>
					</div>
					<div class="col-xs-4 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>体</span><span>重</span></span>
							 <input class="inputHidden form-control quicksave" inputForm="student" name="wight" type="text" value="${bean.wight}"></div>
				</div>
				
				
				<div class="row  panel-info  list-group-item">
					<div class="col-xs-4 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>紧急联系</span></span>   
							<input class="inputHidden form-control quicksave" type="text" name="contact" id="contact" inputForm="student" value="${bean.contact}">
					</div>
					<div class="col-xs-4 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>关</span><span>系</span></span>   
							<input class="inputHidden form-control quicksave" type="text" name="relation" id="relation" inputForm="student" value="${bean.relation}">
					</div>
					<div class="col-xs-4 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>联系方式</span></span>   
							<input class="inputHidden form-control quicksave" type="text" name="contactPhone" id="contactPhone" inputForm="student" value="${bean.contactPhone}">
					</div>
				</div>
					
				<div class="row  panel-info  list-group-item">
					<div class="col-xs-12 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>住</span><span>址</span></span>   
							<span><input  class="inputHidden form-control quicksave" inputForm="student" name="address" type="text" value="${bean.address}"></span>
					</div>
				</div>	
				
				<div class="row  panel-info  list-group-item">
				<div class="col-xs-12 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>备</span><span>注</span></span>
							 <input class="inputHidden form-control quicksave" inputForm="student" name="remark" type="text" value="${bean.remark}"></div>
				</div>
				</div>
				
			<div id="finish" class="col-sm-6 portlet ui-sortable Hidden">
				<div class="row  panel-info portlet-item list-group-item">
					 <div class="col-xs-5 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>毕</span><span>业</span><span>院</span><span>校</span></span>   
							<input class="inputHidden form-control quicksave" type="text" name="lastSchool" inputForm="student" value="${bean.lastSchool}"></div>
					<div class="col-xs-4 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>专</span><span>业</span></span>
							<input class="inputHidden form-control quicksave" type="text" name="zy" id="zy" inputForm="student" value="${bean.zy}"></div>
					<div class="col-xs-3 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>学</span><span>历</span></span>   
							<citms:dbselect name="xl" css="inputHidden form-control quicksave" classCode="XL" inputForm="student"  value="${bean.xl}"  ></citms:dbselect>
						</div>
				</div>
				
				<div class="row  panel-info portlet-item list-group-item">
					<div class="col-xs-5 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>入学时间</span></span><br>
							<span>   
								<input  style="width:65% " class="inputHidden form-control layer-date quicksave" type="text" name="joinDate" id="joinDate" inputForm="student" value="${bean.joinDate}">
								<label targetId='joinDate'  class="laydate-icon inline demoicon" onclick="laydate({elem: '#joinDate',format:'YYYY-MM-DD'});"></label>
							</span>
					</div>		
					
					<div class="col-xs-4 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>毕业时间</span></span>   
							<input style="width:65% " class="inputHidden form-control layer-date quicksave" type="text" name="outDate" id="outDate" inputForm="student" value="${bean.outDate}">
                            <label targetId='outDate'  class="laydate-icon inline demoicon" onclick="laydate({elem: '#outDate',format:'YYYY-MM-DD'});"></label>
					</div>
					 <div class="col-xs-3 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>婚否</span></span>   
							<input class="inputHidden form-control quicksave" type="text" name="marry" inputForm="student" value="${bean.marry}">
					</div>
				</div>
				<div class="row  panel-info portlet-item list-group-item ">
					<div class="col-xs-5 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>就业方向</span></span>   
							<input class="inputHidden form-control quicksave" type="text" name="jyfx" inputForm="student" value="${bean.jyfx}"></div>
					<div class="col-xs-4 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>特殊技能</span></span>   
							<input class="inputHidden form-control quicksave" type="text" name="skill" id="skill" inputForm="student" value="${bean.skill}"></div>
					
					<div class="col-xs-3 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>级别</span></span>   
							<input class="inputHidden form-control quicksave" type="text" name="level" id="level" inputForm="student" value="${bean.level}"></div>
				
					</div>	
					
					<div class="row  panel-info portlet-item list-group-item">
					<div class="col-xs-12 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>备注</span></span>   
							<input class="inputHidden form-control quicksave" type="text" name="remark2" id="remark2" inputForm="student" value="${bean.remark2}"></div>
				
					</div>	
				
				
			</div>
			<!-- 家庭信息					
			<div id="family" class="col-sm-6 portlet ui-sortable Hidden">
				<div id="family-info">
				</div>
				<div  id="familyDiv">
				</div>
			</div> -->		
			
			<!-- 派遣信息 -->				
			<div id="dispatch" class="col-sm-6 portlet ui-sortable Hidden">
				<div id="dispatch-info">
				</div>
				<div  id="dispatchDiv">
				</div>
			</div>
			<!-- 沟通信息 -->		
			<div id="chat" class="col-sm-6 portlet ui-sortable Hidden">
				<div id="chat-info">
				</div>
				<div  id="chatDiv">
				</div>
			</div>	
			
			<!-- 缴费信息 -->		
			<div id="money" class="col-sm-6 portlet ui-sortable Hidden">
				<div id="money-info">
				</div>
				<div  id="moneyDiv">
				</div>
			</div>	
			
			<!-- 缴费信息 -->		
			<div id="certificate" class="col-sm-6 portlet ui-sortable Hidden">
				<div id="certificate-info">
				</div>
				<div  id="certificateDiv">
				</div>
			</div>	
			
			<!-- 学生印象 -->		
			<div id="impress" class="col-sm-6 portlet ui-sortable Hidden">
				<div id="impress-info" class="resuleItem2 clearfix mTop10">
					
				
				</div>
				
			<div class="hr-line-dashed" style="margin:30px 0px 10px 0px;"></div>
				
				<div  id="impresscccDiv">
					<c:forEach items="${impress}" var="imp">
						<button class="impressBtn" value="${imp.value}" id="${imp.id}" label="${imp.label}">${imp.label}</button>
					</c:forEach>
				</div>
			</div>			
				
			
		<form id="demoDropzone" method="post" enctype="multipart/form-data" class="dropzone">
			<div id="file" class="col-sm-6 portlet ui-sortable Hidden">
				<div id="page-content">
					<div class="panel">
					    <div class="panel-heading">
					        <h3 class="panel-title">上传学生资料文件</h3>
					    </div>
					    
	<div class="bs-example" data-example-id="striped-table">
    <table class="table table-striped">
      <thead>
        <tr>
          <th>文件</th>
          <th>类型</th>
          <th>日期</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
				<c:forEach items="${infos}" var="file" varStatus="status">
					   		 	<c:if test="${file.type=='file'}">
                                 <tr id="${file.id}">
						          <td><a href='#' class='fileData' dataId='${file.id}' fileType='${file.detail.fileType}'> ${file.detail.fileName}</a></td>
						          <td><citms:customLabel key="FILE_TYPE" value="${file.little}"></citms:customLabel></td>
						          <td><fmt:formatDate value="${file.createDate}" pattern="yyyy-MM-dd"/> </td>
						          <td><a href="javascript:;" class="infoDel" infoId="${file.id}" >删除</a> </td>
        						</tr>
                                	</c:if>
                          </c:forEach>
				  </tbody>
    </table>
  </div>
						
						
					    
					    <div class="panel-body">
					        <p class="text-main text-bold mar-no">选择文件类型</p>
					        	<section class="row  panel-info portlet-item list-group-item">
					 <div class="col-xs-6 ">
						<i class="fa fa-fw fa-envelope"></i> 
						<citms:dbselect name="little" id="file_little" classCode="FILE_TYPE" value="" css="form-control" ></citms:dbselect>
					</div>
					<div class="col-xs-6 ">
						<i class="fa fa-fw fa-envelope"></i> 
						<citms:dbselect name="open"  id="file_open" classCode="OPEN"  showBlank="false" css="form-control"></citms:dbselect>
					</div>
				</section>
					        
				 				
				 				<!-- 
						            <div class="dz-default dz-message" class="dropzone">
						                <div class="dz-icon">
						                    <i class="demo-pli-upload-to-cloud icon-5x"></i>
						                </div>
						                <div>
						                    <span class="dz-text">Drop files to upload</span>
						                    <p class="text-sm text-muted">or click to pick manually</p>
						                </div>
						            </div> -->
					            
					            <div class="fallback">
					                <input name="file" type="file" multiple class="hidden">
					            </div>
					    </div>
					</div>
					
					<div class="panel">
					    <div class="panel-body">
					        <div class="bord-top pad-ver">
					            <!-- The fileinput-button span is used to style the file input field as button -->
					            <span class="btn btn-success fileinput-button dz-clickable">
					                <i class="fa fa-plus"></i>
					                <span>选择文件</span>
					            </span>
					
					            <div class="btn-group pull-right">
					                <button id="dz-upload-btn" class="btn btn-primary" type="submit" disabled>
					                    <i class="fa fa-upload-cloud"></i> 上传
					                </button>
					                <button id="dz-remove-btn" class="btn btn-danger cancel" type="reset" disabled>
					                    <i class="demo-pli-cross"></i> 删除
					                </button>
					            </div>
					        </div>
					
					<!--   -->
					        <div id="dz-previews">
					            <div id="dz-template" class="pad-top bord-top">
					                <div class="media" >
					                    <div class="media-body">
					                        <div class="media-block">
					                            <div class="media-left">
					                                <img class="dz-img" data-dz-thumbnail>
					                            </div>
					                            <div class="media-body">
					                                <p class="text-main text-bold mar-no text-overflow" data-dz-name></p>
					                                <span class="dz-error text-danger text-sm" data-dz-errormessage></span>
					                                <p class="text-sm" data-dz-size></p>
					                                <input type="hidden" value="" name="dz-file-id" id="dz-file-id">
					                                <div id="dz-total-progress" style="opacity:0">
					                                     <div class="progress progress-xs active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
					                                        <div class="progress-bar progress-bar-success" style="width:0%;" data-dz-uploadprogress></div>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                    <div class="media-right">
					                        <button data-dz-remove class="btn btn-xs btn-danger dz-cancel"><i class="demo-pli-cross"></i>删除</button>
					                    </div>
					                </div>
					            </div>
					        </div>
					</div>
					</div>
					<script>
					</script>
                </div>
			</div>
				</form>	
			</section>
		</div>		
				
 </form>
</body>
    <script src="/js/h/jquery.min.js?v=2.1.4"></script>
	<script type="text/javascript" src="/plugins/layer/layer.js"></script>
	<script type="text/javascript" src="/plugins/select2/js/select2.min.js"></script>
	<script src="/js/h/plugins/layer/laydate/laydate.js"></script>
    <script src="/js/h/plugins/validate/jquery.validate.min.js"></script>
    <script src="/js/h/plugins/validate/messages_zh.min.js"></script>
    <script src="/plugins/dropzone/dropzone.js"></script>
    <script src="/plugins/handlebars-v3.0.3.js"></script>
    <script src="/js/zfc/student_info.js" type="text/javascript" charset="utf-8"></script>
   
    <!-- 家庭录入模板 -->
	<script id="family-template" class="add"  type="text/x-handlebars-template"> 
		<input  class="family" name="id" type="hidden" value="{{id}}">
		<section class="row  panel-info portlet-item list-group-item">
				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>成</span><span>员</span><span>姓</span><span>名</span></span>   
						<span><input class="inputHidden form-control" inputForm="family" name="name" type="text" value="{{detail.name}}"></span>
				</div>

				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>成</span><span>员</span><span>关</span><span>系</span></span>   
						<span><input class="inputHidden form-control" inputForm="family" name="relation" type="text" value="{{detail.relation}}"></span>
				</div>

	</section>
		<section class="row  panel-info portlet-item list-group-item">
				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>联</span><span>系</span><span>电</span><span>话</span></span>   
						<span><input class="inputHidden form-control" inputForm="family" name="tel" type="text" value="{{detail.tel}}"></span>
				</div>

				<div class="col-xs-6 ">
						<input inputFormName="family" class="infoSubmit btn btn-primary btn-xs" value="保 存" style="display: inline;" type="button">
						<input inputFormName="family" class="infoCancel btn btn-primary btn-xs" value="取 消" style="display: inline;" type="button">
				</div>
		</section>					
	</script>

	<script id="family-info-template" type="text/x-handlebars-template"> 

		<div class="resuleItem2 clearfix mTop10" id="{{id}}"  style="width:90%"> 
							<div  class="Left ThemeBGColor5" style="width:90%">
								<div> 
								<span class="Black16 accountName overflow_ellipsis Width200" style="width:30%">
								<span class="attributeLeft"><span>成</span><span>员</span><span>姓</span><span>名</span></span>  
									{{detail.name}}</span>
								<span class="Black16 accountName overflow_ellipsis Width200" style="width:30%">
								<span class="attributeLeft"><span>成</span><span>员</span><span>关</span><span>系</span></span>  
								{{detail.relation}}</span>
								<span class="Black16 accountName overflow_ellipsis Width200" style="width:30%">
								<span class="attributeLeft"><span>联</span><span>系</span><span>电</span><span>话</span></span>
								{{detail.tel}}
								</span>
								</div> 
							</div> 
							<div class="mLeft5 Right"> 
								<a href="javascript:;" class=" infoEdit"  infoId="{{id}}" >编辑</a>
								<br> <a href="javascript:;" class=" infoDel" infoId="{{id}}" >删除</a> 
							</div>
						</div>
	</script>
	
	
	<!-- 派遣录入模板 -->
	<script id="dispatch-template" class="add"  type="text/x-handlebars-template">
		<input  class="dispatch" name="id" type="hidden" value="{{id}}">
		<section class="row  panel-info portlet-item list-group-item">
				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-university"></i> 
						<span class="attributeLeft"><span>派</span><span>遣</span><span>单</span><span>位</span></span>   
						<span>
						<select class="inputHidden form-control" id="{{detail.unitName}}" inputForm="dispatch" name="unitName" classCode='PQUNIT' />
						</span>
				</div>

				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>职</span><span>务</span><span>岗</span><span>位</span></span>   
						<span>
							<select class="inputHidden form-control" id="{{detail.workLevel}}" inputForm="dispatch" name="workLevel" classCode='WORKLEVEL' />
						</span>
				</div>
		</section>
		<section class="row  panel-info portlet-item list-group-item">
				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>面</span><span>试</span><span>日</span><span>期</span></span><br>
						<span>
							<input readonly style="width:85% " class="form-control layer-date" value="{{detail.applyDate}}" inputForm="dispatch" name="applyDate"  id="_applyDate">
                            <label class="laydate-icon inline demoicon" onclick="laydate({elem: '#_applyDate',format:'YYYY-MM-DD'});"></label>
						</span>
				</div>

				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>上</span><span>岗</span><span>日</span><span>期</span></span> <br>  
						<span>
							<input readonly style="width:85% " class="form-control layer-date" inputForm="dispatch"  value="{{detail.joinDate}}"  name="joinDate"  id="_joinDate">
                            <label class="laydate-icon inline demoicon" onclick="laydate({elem: '#_joinDate',format:'YYYY-MM-DD'});"></label>
						</span>
				</div>
		</section>
		<section class="row  panel-info portlet-item list-group-item">
				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>派</span><span>遣</span><span>状</span><span>态</span></span>   
						<!--jquery 动态加载-->
						<span><select class="inputHidden form-control" id="{{detail.dispatchStatus}}" inputForm="dispatch" name="dispatchStatus" classCode='DISPATCH_STATUS' /></span>
				</div>

				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-chrome"></i> 
						<span class="attributeLeft"><span>雇</span><span>佣</span><span>性</span><span>质</span></span>   
						<span>
						<select class="inputHidden form-control" id="{{detail.employ}}"  inputForm="dispatch" name="employ" classCode='EMPLOY' />
						</span>
				</div>
		</section>
		<section class="row  panel-info portlet-item list-group-item">

				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-university"></i> 
						<span class="attributeLeft"><span>家</span><span>港</span></span>   
						<span><input class="inputHidden form-control" inputForm="dispatch" name="jg" type="text" value="{{detail.jg}}"></span>
				</div>

				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>SAP</span><span>No.</span></span>   
						<span><input class="inputHidden form-control" inputForm="dispatch" name="sapNo" type="text" value="{{detail.sapNo}}"></span>
				</div>
	</section>
		<section class="row  panel-info portlet-item list-group-item">

				<div class="col-xs-6 ">
						<input inputFormName="dispatch" class="infoSubmit btn btn-primary btn-xs" value="保 存" style="display: inline;" type="button">
						<input inputFormName="dispatch" class="infoCancel btn btn-primary btn-xs" value="取 消" style="display: inline;" type="button">
				</div>
		</section>		
	</script>
	<!-- 派遣信息显示展示模板 -->
	<script id="dispatch-info-template"  type="text/x-handlebars-template"> 
		<div class="resuleItem2 clearfix mTop10" id="{{id}}"  style="width:90%"> 
							<div  class="Left ThemeBGColor5" style="width:90%">
								<div> 
									<span class="Black16 accountName overflow_ellipsis Width200" style="width:50%">
										<span class="attributeLeft"><span>派</span><span>遣</span><span>单</span><span>位</span></span>   
										<font class="selectClass" code="PQUNIT" value="{{detail.unitName}}" />
									</span> 

									<span class="Black16 accountName overflow_ellipsis Width200">
										<span class="attributeLeft"><span>职</span><span>务</span><span>岗</span><span>位</span></span>   
										<font class="selectClass" code="WORKLEVEL" value="{{detail.workLevel}}" />
									</span> 
								</div> 

								<div> 
									<span class="Black16 accountName overflow_ellipsis Width200" style="width:50%">
									<span class="attributeLeft"><span>面</span><span>试</span><span>日</span><span>期</span></span>									
									{{detail.applyDate}}</span> 

									<span class="Black16 accountName overflow_ellipsis Width200">
									<span class="attributeLeft"><span>上</span><span>岗</span><span>日</span><span>期</span></span>									
									{{detail.joinDate}}</span> 
								</div> 

								<div> 
									<span class="Black16 accountName overflow_ellipsis Width200" style="width:50%">
									<span class="attributeLeft"><span>派</span><span>遣</span><span>状</span><span>态</span></span>   
										<font class="selectClass" code="DISPATCH_STATUS" value="{{detail.dispatchStatus}}" />
									</span> 

									<span class="Black16 accountName overflow_ellipsis Width200">
									<span class="attributeLeft"><span>雇</span><span>佣</span><span>性</span><span>质</span></span>   
										<font class="selectClass" code="EMPLOY" value="{{detail.employ}}" />
									</span> 
								</div> 

								
								<div> 
									<span class="Black16 accountName overflow_ellipsis Width200" style="width:50%">
											<span class="attributeLeft"><span>家</span><span>港</span></span> 
																{{detail.jg}}
									</span> 

									<span class="Black16 accountName overflow_ellipsis Width200">
										<span class="attributeLeft"><span>SAP</span><span>No.</span></span>   
											{{detail.sapNo}}
									</span> 
								</div> 


							</div> 
							<div class="mLeft5 Right"> 
								<a href="javascript:;" class=" infoEdit"  infoId="{{id}}" >编辑</a>
								<br> <a href="javascript:;" class="infoDel" infoId="{{id}}" >删除</a> 
							</div>
		</div>
	</script>

	<script id="chat-template" class="add"  type="text/x-handlebars-template">
		<input  class="chat" name="id" type="hidden" value="{{id}}">
		<section class="row  panel-info portlet-item list-group-item">
				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-university"></i> 
						<span class="attributeLeft"><span>沟</span><span>通</span><span>日</span><span>期</span></span>   
						<span>
							<input readonly style="width:85% " class="form-control layer-date" value="{{detail.chatDate}}" inputForm="chat" name="chatDate"  id="_chatDate">
                            <label class="laydate-icon inline demoicon" onclick="laydate({elem: '#_chatDate',format:'YYYY-MM-DD'});"></label>
						</span>
				</div>

				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>沟</span><span>通</span><span>类</span><span>别</span></span>   
						<span>
						<select class="inputHidden form-control" id="{{detail.chatType}}"  inputForm="chat" name="chatType" classCode='CHAT_TYPE' />
						</span>
				</div>
		</section>

		<section class="row  panel-info portlet-item list-group-item">
				<div class="col-xs-12 ">
					<i class="fa fa-fw fa-university"></i> 
						<span class="attributeLeft"><span>沟</span><span>通</span><span>内</span><span>容</span></span>   
						<span>
							<textarea name="chatContent" inputForm="chat" class="inputHidden form-control" rows="10"  >{{detail.chatContent}}</textarea>
						</span>
				</div>

				
		</section>

		<section class="row  panel-info portlet-item list-group-item">
				<div class="col-xs-6 ">
						<input inputFormName="chat" class="infoSubmit btn btn-primary btn-xs" value="保 存" style="display: inline;" type="button">
						<input inputFormName="chat" class="infoCancel btn btn-primary btn-xs" value="取 消" style="display: inline;" type="button">
				</div>
		</section>	
	</script>
	<!-- 沟通信息展示 -->
	<script id="chat-info-template"   type="text/x-handlebars-template">
		<div class="resuleItem2 clearfix mTop10" id="{{id}}"  style="width:90%"> 
							<div  class="Left ThemeBGColor5" style="width:90%">
								<div> 
									<span class="Black16 accountName overflow_ellipsis Width200" style="width:50%">
										<span class="attributeLeft"><span>沟通日期</span></span>   
										{{detail.chatDate}}
									</span> 

									<span class="Black16 accountName overflow_ellipsis Width200">
										<span class="attributeLeft"><span>沟通类型</span></span>   
										<font class="selectClass" code="CHAT_TYPE" value="{{detail.chatType}}" />
									</span> 
								</div> 

								<div> 
									<span class="Black16 accountName overflow_ellipsis Width200" style="width:100%">
										<span class="attributeLeft"><span>沟通内容</span></span>   
										{{detail.chatContent}}
									</span> 
								</div>
							</div>
					<div class="mLeft5 Right"> 
								<a href="javascript:;" class=" infoEdit"  infoId="{{id}}" >编辑</a>
								<br> <a href="javascript:;" class="infoDel" infoId="{{id}}" >删除</a> 
						</div>
		</div>
	</script>
	<!-- 缴费信息 -->
	<script id="money-info-template" type="text/x-handlebars-template">
		<div class="resuleItem2 clearfix mTop10" id="{{id}}"  style="width:90%"> 
							<div  class="Left ThemeBGColor5" style="width:90%">
								<div> 
									<span class="Black16 accountName overflow_ellipsis Width200" style="width:50%">
										<span class="attributeLeft"><span>缴费项目</span></span>   
										{{detail.pay.title}}
									</span> 

									<span class="Black16 accountName overflow_ellipsis Width200">
										<span class="attributeLeft"><span>收费金额</span></span>   
										{{detail.pay.pay}}元
									</span> 
								</div> 
                             <div class="min-hr-line-dashed"></div>
								<div> 
									<span class="Black16 accountName overflow_ellipsis Width200" style="width:50%">
										<span class="attributeLeft"><span>缴费状态</span></span>   
										<font class="selectClass" code="STUDENT_PAY_STATUS" value="{{detail.payStatus}}" />
									</span> 
									<span class="Black16 accountName overflow_ellipsis Width200">
										<span class="attributeLeft"><span>已缴金额</span></span>   
										{{detail.paid}}元
									</span> 
								</div> 
							</div>
					<div class="mLeft5 Right"> 
								<a href="javascript:;" class=" infoEdit"  infoId="{{id}}" >缴费录入</a>
					</div>

		</div>
 	</script>
 	
 	
 	<script id="money-template" type="text/x-handlebars-template">
		<input  class="money" name="id" type="hidden" value="{{id}}" />
		<section class="row  panel-info portlet-item list-group-item">

								<div class="col-xs-6 ">
									<span class="Black16 accountName overflow_ellipsis Width200" style="width:50%">
										<span class="attributeLeft"><span>缴费项目</span></span>   
										{{detail.pay.title}}
									</span> 
								</div>
								<div class="col-xs-6 ">
									<span class="Black16 accountName overflow_ellipsis Width200">
										<span class="attributeLeft"><span>收费金额</span></span>   
										{{detail.pay.pay}}元
									</span> 
								</div>
					<div class="hr-line-dashed" style="margin:30px 0px 10px 0px;"></div>
				
				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-university"></i> 
						<span class="attributeLeft"><span>缴</span><span>费</span><span>状</span><span>态</span></span>   
						<span>
							<select class="inputHidden form-control" id="{{detail.payStatus}}"  inputForm="money" name="payStatus" classCode='STUDENT_PAY_STATUS' />
						</span>
				</div>

				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>已</span><span>缴</span><span>金</span><span>额</span></span>   
						<span>
						<input class="inputHidden form-control" value="{{detail.paid}}"  inputForm="money" name="paid" />
						</span>
				</div>
		</section>

		<section class="row  panel-info portlet-item list-group-item">
				<div class="col-xs-6 ">
						<input inputFormName="money" class="infoSubmit btn btn-primary btn-xs" callBack="delete"  value="保 存" style="display: inline;" type="button">
				</div>
		</section>	
	</script>
	
	<!-- 取证情况录入模板 -->
	<script id="certificate-info-template" type="text/x-handlebars-template">
		<div class="resuleItem2 clearfix mTop10" id="{{id}}"  style="width:90%"> 
							<div  class="Left ThemeBGColor5" style="width:90%">
								<div> 
									<span class="Black16 accountName overflow_ellipsis Width200" style="width:50%">
										<span class="attributeLeft"><span>证件名称</span></span>   
										{{detail.cateName}}
									</span> 

									<span class="Black16 accountName overflow_ellipsis Width200">
										<span class="attributeLeft"><span>证件编号</span></span>   
										{{detail.cateNo}}
									</span> 
								</div> 
								<div> 
									<span class="Black16 accountName overflow_ellipsis Width200" style="width:50%">
										<span class="attributeLeft"><span>证件类型</span></span>   
										<font class="selectClass" code="CATE_TYPE" value="{{detail.cateType}}" />
									</span> 
									<span class="Black16 accountName overflow_ellipsis Width200">
										<span class="attributeLeft"><span>发证机关</span></span>   
										<font class="selectClass" code="CATE_UNIT" value="{{detail.cateUnit}}" />
									</span> 
								</div> 
								<div> 
									<span class="Black16 accountName overflow_ellipsis Width200" style="width:50%">
										<span class="attributeLeft"><span>发证日期</span></span>   
										{{detail.cateDate}}
									</span> 
									<span class="Black16 accountName overflow_ellipsis Width200">
										<span class="attributeLeft"><span>有效日期</span></span>   
										{{detail.cateEndDate}}
									</span> 
								</div>

								<div> 
									<span class="Black16 accountName overflow_ellipsis Width200" >
										<span class="attributeLeft"><span>证书原件</span></span>   
									<div class="infoShowGroup certificate" id="{{id}}" type="file"  />
									</span> 
								</div>  

							</div>
					<div class="mLeft5 Right"> 
								<a href="javascript:;" class=" infoEdit"  infoId="{{id}}" >编辑</a><br>
								<a href="javascript:;" class=" infoDel" infoId="{{id}}" >删除</a>
					</div>
		</div>
				

	</script>
	<!-- 取证情况录入模板 -->
	<script id="certificate-template" class="add"  type="text/x-handlebars-template">
		<input  class="certificate" name="id" type="hidden" value="{{id}}">
		<section class="row  panel-info portlet-item list-group-item">
				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-university"></i> 
						<span class="attributeLeft"><span>证件名称</span></span>   
						<span>
						<input class="inputHidden form-control" value="{{detail.cateName}}"  inputForm="certificate" name="cateName" />
						</span>
				</div>
				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>证件编号</span></span>   
						<span>
						<input class="inputHidden form-control" value="{{detail.cateNo}}"  inputForm="certificate" name="cateNo" />
						</span>
				</div>
		</section>


		<section class="row  panel-info portlet-item list-group-item">
				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-university"></i> 
						<span class="attributeLeft"><span>证件类型</span></span>   
						<span>
						<select class="inputHidden form-control" id="{{detail.cateType}}" inputForm="certificate" name="cateType" classCode='CATE_TYPE' />
						</span>
				</div>

				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>发证机构</span></span>   
						<span>
						<select class="inputHidden form-control" id="{{detail.cateUnit}}" inputForm="certificate" name="cateUnit" classCode='CATE_UNIT' />
						</span>
				</div>
		</section>

		<section class="row  panel-info portlet-item list-group-item">
				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-university"></i> 
						<span class="attributeLeft"><span>取证日期</span></span>   
						<span>
						<input readonly  style="width:85% " class=" form-control layer-date " type="text" name="cateDate" id="cateDate" inputForm="certificate" value="{{detail.cateDate}}">
						<label targetId='cateDate'  class="laydate-icon inline demoicon" onclick="laydate({elem: '#cateDate',format:'YYYY-MM-DD'});"></label>
						</span>
				</div>

				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>有效日期</span></span>   
						<span>
							<input readonly style="width:85% " class="form-control layer-date" type="text" name="cateEndDate" id="cateEndDate" inputForm="certificate" value="{{detail.cateEndDate}}">
							<label targetId='cateDate'  class="laydate-icon inline demoicon" onclick="laydate({elem: '#cateEndDate',format:'YYYY-MM-DD'});"></label>
						</span>
				</div>
		</section>


		<section class="row  panel-info portlet-item list-group-item">
				<div class="col-xs-12 ">
					<i class="fa fa-fw fa-university"></i> 
						<span class="attributeLeft"><span>关联原件</span></span>   
						<span>
							<div class="fileCheckGroup certificate"  type="file" little="1" status="input" />
						</span>
				</div>
		</section>

		<section class="row  panel-info portlet-item list-group-item">
		<div class="col-xs-12 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>注</span><span>注</span></span>   
						<span>
							<textarea name="cateRemark" inputForm="certificate" class="inputHidden form-control" rows="3"  >{{detail.cateRemark}}</textarea>
						</span>
		</div>
		</section>


		<section class="row  panel-info portlet-item list-group-item">
				<div class="col-xs-6 ">
						<input inputFormName="certificate" class="infoSubmit btn btn-primary btn-xs" value="保 存" style="display: inline;" type="button">
						<input inputFormName="certificate" class="infoCancel btn btn-primary btn-xs" value="取 消" style="display: inline;" type="button">
				</div>
		</section>	

	</script>
	
 		<!-- 评价展示模板 -->
	<script id="impress-info-template" type="text/x-handlebars-template">
							<div  class="Left ThemeBGColor5 infoDel" id="{{id}}" infoId="{{id}}" style="width:20%; margin-right: 20px; margin-bottom: 10px;" >
								<div> 
									<span  class="Black16 accountName overflow_ellipsis Width200 ">
										{{detail.impressLabel}}
									</span> 
							</div>
	</div>
	</script>
	
	<!-- 评价录入模板 -->
	<script id="impress-template" class="add"  type="text/x-handlebars-template">



	</script>
</html>