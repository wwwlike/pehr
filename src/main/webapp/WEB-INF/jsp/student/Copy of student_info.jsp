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
                            <a href="#" class="pull-left thumb avatar b-3x m-r">
                              <img src="images/avatar.jpg" class="img-circle">
                            </a>
                            <div class="clear">
                              <div class="h3 m-t-xs m-b-xs text-white">
                                ${bean.xm}
                                <i class="fa fa-circle text-white pull-right text-xs m-t-sm"></i>
                              </div>
                              <small class="text-muted">Art director</small>
                            </div>                
                          </div>
                        </header>
                            
           <div class="col-sm-6 portlet  ">
			<section class="row  list-group-item">	
               <ul class="talkNav boxSizing"> 
	               <li bottomLine="left: 20px" data-type="basic" class="ThemeColor3">基本信息</li> 
	               <li bottomLine="left: 110px" data-type="family">家庭信息</li> 
	               <li bottomLine="left: 200px" data-type="file">附件信息</li> 
	               <i class="bottomLine ThemeBGColor3" style="left: 20px;"></i> 
               </ul>
 			 </section>
 			</div>
 			<input type="hidden" id="studentId"  value="${bean.id}">
			<input type="hidden" name="student_id" url="/student/update"  value="${bean.id}">
			<div id="basic" class="col-sm-6 portlet ui-sortable"  >
				<section class="row  panel-info portlet-item list-group-item">
					 <div class="col-xs-6 ">
						<i class="fa fa-fw fa-envelope"></i> 
							身份证号   <input class="inputHidden form-control quicksave" type="text" name="sfz" inputForm="student" value="${bean.sfz}"></div>
					<div class="col-xs-6 ">
						<i class="fa fa-fw fa-envelope"></i> 
							联系电话   <input class="inputHidden form-control quicksave" type="text" name="tel" id="tel" inputForm="student" value="${bean.tel}"></div>
				</section>
			 
				<div class="row  panel-info  list-group-item">
					<div class="col-xs-6 ">
						<i class="fa fa-fw fa-envelope"></i> 
							<span class="attributeLeft"><span>成</span><span>员</span><span>姓</span><span>名</span></span>   
							<span><input class="inputHidden form-control" inputForm="student" name="height" type="text"></span>
					</div>
					<div class="col-xs-6 ">
						<i class="fa fa-fw fa-envelope"></i> 
							QQ号码   <input class="inputHidden form-control" inputForm="student" name="wight" type="text"></div>
					</div>
			</div><!-- -->	
			
			<div id="family" class="col-sm-6 portlet ui-sortable Hidden">
				<div id="family-info">
				<c:forEach items="${infos}" var="family" varStatus="status">
					<c:if test="${family.type=='family'}">
						<div class="resuleItem2 clearfix mTop10" id="${family.id}" > 
							<div  class="Left ThemeBGColor5">
								<div> 
									<span class="Black16 accountName overflow_ellipsis Width200">
									<span class="attributeLeft"><span>成</span><span>员</span><span>姓</span><span>名</span></span>  
									${family.detail.name}</span> 
									<span class="mLeft20 accountTime">    </span> 
								</div> 
								<div class="Blue accountTi AllBreak">
								
								<span class="attributeLeft"><span>成</span><span>员</span><span>关</span><span>系</span></span>  
								${family.detail.relation}</div> 
								<div class="Blue accountDes AllBreak">
								<span class="attributeLeft"><span>联</span><span>系</span><span>电</span><span>话</span></span>
								${family.detail.tel}</div> 
							</div> 
							<div class="mLeft5 Right"> 
								<a href="javascript:;" class=" infoEdit"  infoId="${family.id}" >编辑</a>
								<br> <a href="javascript:;" class=" infoDel" infoId="${family.id}" >删除</a> 
							</div>
						</div>
					</c:if>
				</c:forEach>
				</div>
				<div  id="familyDiv">
				</div>
			</div>
				
			
		<form id="demoDropzone"  class="dropzone">
			<div id="file" class="col-sm-6 portlet ui-sortable Hidden">
				<div id="page-content">
					<div class="panel">
					    <div class="panel-heading">
					        <h3 class="panel-title">上传学生资料文件</h3>
					    </div>
					    <div class="panel-body">
					        <p class="text-main text-bold mar-no">选择文件类型</p>
					        
					        	<section class="row  panel-info portlet-item list-group-item">
					 <div class="col-xs-6 ">
						<i class="fa fa-fw fa-envelope"></i> 
						<citms:dbselect name="title" id="file_title" classCode="FILE_TYPE" value="" css="form-control" ></citms:dbselect>
					</div>
					<div class="col-xs-6 ">
						<i class="fa fa-fw fa-envelope"></i> 
						<citms:dbselect name="open"  id="file_open" classCode="OPEN" value="" showBlank="false" css="form-control"></citms:dbselect>
					</div>
				</section>
					        
				 				
				 				<!--  -->
						            <div class="dz-default dz-message" class="dropzone">
						                <div class="dz-icon">
						                    <i class="demo-pli-upload-to-cloud icon-5x"></i>
						                </div>
						                <div>
						                    <span class="dz-text">Drop files to upload</span>
						                    <p class="text-sm text-muted">or click to pick manually</p>
						                </div>
						            </div>
					            
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
			</div></form>
					
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
    <script src="/js/mingdao/student_info.js" type="text/javascript" charset="utf-8"></script>
   
    <!-- 家庭录入模板 -->
	<script id="family-template" type="text/x-handlebars-template"> 
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
				<div class="resuleItem2 clearfix mTop10" id="{{id}}" > 
							<div name="sel" id="Sel36996" class="Left ThemeBGColor5">
								<div> 
									<span class="Black16 accountName overflow_ellipsis Width200"><span class="attributeLeft"><span>成</span><span>员</span><span>姓</span><span>名</span></span>   
{{detail.name}}</span> 
									<span class="mLeft20 accountTime">  2017-01-05至2017-09-01  </span> 
								</div> 
								<div class="Blue accountTi AllBreak">开发</div> 
								<div class="Blue accountDes AllBreak">鹅鹅鹅鹅鹅鹅饿</div> 
							</div> 
							<div class="mLeft5 Right"> 
								<a href="javascript:;" class=" infoEdit"  infoId="{{id}}" >编辑</a>
								<br> <a href="javascript:;" class=" infoDel" infoId="{{id}}" >删除</a> 
							</div>
				</div>
	</script>
	
	<script type="text/javascript">
	   
	    
	    
    </script>
</html>