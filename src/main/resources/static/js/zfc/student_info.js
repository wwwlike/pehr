var loadflag =new Object();
(function($) {
    $.fn.watch = function(callback) {
        return this.each(function() {
          //  console.log($(this).attr("id")+"__________"+$(this).val());
            $.data(this, 'originVal', $(this).val());//存
            $(this).on('blur', function() {
               var obj=this;
            setTimeout(function (){ 
            	var originVal = $.data(obj, 'originVal');
                var currentVal = $(obj).val();
               console.log(currentVal);
               if($("#inputForm").validate().element($(obj))){//验证通过
	                //数据验证 通过后在提交
	                if (originVal != currentVal) {
	                    $.data(obj, 'originVal', $(obj).val());
	                    callback($(obj),currentVal);
	                }
               }
            }, 500);//做延时是为了 时间控件
            });
        });
    }
})(jQuery);

function fileDataBinding(){
	
	$(".fileData").click(function(e){
		var fileId=$(this).attr("dataId");
		var fileType=$(this).attr("fileType");
		if(fileType=="jpg"||fileType=="png"){
			parent.parent.layer.open({
				  closeBtn: 0, //不显示关闭按钮
				  anim: 2,
				  shadeClose: true, //开启遮罩关闭
				  content: '<img  height=100% width=100% src="/studentInfo/file/getFile?id='+fileId+'"  />'
			});
		}else{
			location.href='/studentInfo/file/getFile?download=1&id='+fileId
		}
	})
}


//模板填充完毕后 绑定jquery事件
function btnBinding(type){
	
	var fileCheckGroup =$(".fileCheckGroup."+type);
	fileCheckGroup.each(function(e){
		var typeEle=$(this).attr("type");
		var little=$(this).attr("little");
		var studentId=$("#studentId").val();
		var  fileCheck=$(this);
		$.ajax({
			async:true,
			type: "get",
			url:"/studentInfo/typeLittleList",
			data:{'studentId':studentId,'type':typeEle,'little':little},
			success: function(data) {
				for(var i=0;i<data.item.length;i++){
					var name="";
					if(typeEle=="file"){
						name=data.item[i].detail.fileName;
					}
	    			var check=$("<li> <input inputForm='"+type +"' type='checkbox' name='infoId' value='"+data.item[i].id+"'/>"+name+"</li>");
	    			fileCheck.append(check);
				}
				
			
			}
		})
	});
	var infoShowGroup =$(".infoShowGroup."+type);
	infoShowGroup.each(function(e){
		var id=$(this).attr("id");
		var typeEle=$(this).attr("type");
		var little=$(this).attr("little");
		var div=$(this);
	$.ajax({
		async:true,
		type: "get",
		url:"/studentInfo/getOtherInfoObj",
		data:{'id':id,'type':typeEle,'little':little},
		success: function(data) {
			for(var i=0;i<data.item.length;i++){
				var file=data.item[i];
				div.append("<a href='#' class='fileData' dataId='"+file.id+"' fileType='"+file.detail.fileType+"'> "+file.detail.fileName+"</a>");
			}
			div.removeClass(type);
			fileDataBinding();
		}
	});
	});
	
	//单个信息保存(新增或者修改)
	fileDataBinding();
    $(".infoSubmit").click(function(e){
    	
    	var input=$(this).attr("inputFormName");
    	var studentId=$("#studentId").val();
    	var id=$("."+input+"[name='id']").val();
    	var savaUrl='/studentInfo/'+input;
    	var isAdd=(id==null||id==""||id==undefined);
    	savaUrl+=isAdd?("/save?studentId="+studentId):("/update?id="+id);
    	var button=$(this);
    	$.ajax({
    		type: "get",
    		url:savaUrl,
    		data:$("[inputForm='"+input+"']").serialize(),
    		success: function(data) {
    			if(!isAdd){
    				//$("#"+id).remove();
    				
    				$("#"+id).html("");
    			}
    			var addItem = Handlebars.compile($("#"+input+"-info-template").html());
    		
    			var obj=addItem(data.item);
    			if($("#"+id).size()!=0){
    			$("#"+id).replaceWith(obj);
    			}else{
    				$('#'+input+'-info').append(obj);
    			}
    		   $('#'+input+'-info').find(".ThemeBGColor2").removeClass("ThemeBGColor2").addClass("ThemeBGColor5");
    		   $("#"+id).find(".Left").removeClass("ThemeBGColor5").addClass("ThemeBGColor2");
    			parent.layer.msg('保存成功');
    			//初始化清空
    			if(button.attr("callBack")=="delete"){//保存完后删除本录入框
    				$('#'+input+'Div').html("");
    			}else{
    			var myTemplate = Handlebars.compile($("#"+input+"-template").html());
    	        	$('#'+input+'Div').html(myTemplate());
    			}
    			btnBinding(type);
    	}
    	})
    	e.stopImmediatePropagation();
    });
    $(".infoCancel").click(function(e){
    	var input=$(this).attr("inputFormName");
    	var myTemplate = Handlebars.compile($("#"+input+"-template").html());
        $('#'+input+'Div').html(myTemplate());
        btnBinding(type);
		e.stopImmediatePropagation(); //组织冒泡
    });	
    
 
  
    
  //单个信息删除	
    $(".infoDel").click(function(e){
    	var id=$(this).attr("infoId");
    	$.ajax({
    		type: "get",
    		url:'/studentInfo/remove',
    		data:{"id":id},
    		success: function(data) {
    		//	alert(id);
    			$("#"+id).remove();
    			parent.layer.msg('删除成功');
    	}
    	})
		e.stopImmediatePropagation(); //组织冒泡

    })	

    //单个信息修改加载
        $(".infoEdit").click(function(e){
        	var id=$(this).attr("infoId");
        	$.ajax({
        		type: "get",
        		url:'/studentInfo/get',
        		data:{"id":id},
        		success: function(data) {
        			var item=data.item;
        			var type=item.type;
        			var myTemplate = Handlebars.compile($("#"+type+"-template").html());
        		    $('#'+type+'Div').html(myTemplate(data.item));	
        		    btnBinding(type);
        		    
           	}
         })
 		e.stopImmediatePropagation(); //组织冒泡
        })	
        
        //查找div select 需要从selectClass抓数据的下来选项
       
        var selectClass=$("select[inputForm='"+type+"']");
    	selectClass.each(function(e){
    		var classCode=$(this).attr("classCode");
    		var thisValue=$(this).attr("id");
    		var select=$(this);

    		if(select.find("option").size()==0){
    		$.ajax({
    			async:true,
    			type: "get",
    			url:"/selectClass/templateOptions",
    			data:{'code':classCode,'value':thisValue},
    			success: function(data) {
    				for(var i=0;i<data.item.length;i++){
    					var selected=(thisValue==data.item[i].value)?"selected":"";
		    					var option=$("<option "+selected+" value='"+data.item[i].value+"'>"+data.item[i].label+"</option>")
		    					select.append(option);
    					
    				}
    			
    			}
    		})}
    	})
    	
    	
    	var viewSelectClass=$("font");
    	viewSelectClass.each(function(e){
    		var classCode=$(this).attr("code");
    		var thisValue=$(this).attr("value");
    		var view=$(this);
    		$.ajax({
    			type: "get",
    			url:"/selectClass/templateOptions",
    			data:{'code':classCode,'value':thisValue},
    			success: function(data) {
    				for(var i=0;i<data.item.length;i++){
    					if(data.item[i].value==thisValue){
    						view.html(data.item[i].label);
    					}
    				}
    			}
    		})
    	})
    	
    	



}


$(document).ready(function(){
	var studentId=$("#studentId").val();
	//btnBinding();
	
	$.validator.setDefaults({
	    submitHandler: function() {
	     
	    }
	});
	
	   var icon = "<i class='fa fa-times-circle'></i> ";
       $("#inputForm").validate({
           rules: {
        	   tel:{
        		   required:true,
               	   minlength:6
        	   }
           },
           messages: {}
       });
  

       
$(".boxSizing li").click(function(e){
	$(".bottomLine").attr("style",$(this).attr("bottomLine"));
	$(".boxSizing li").removeClass("ThemeColor3");
	$(this).addClass("ThemeColor3")
	$(".ui-sortable").addClass("Hidden");
	var divId=$(this).attr("data-type");
	$("#"+divId).removeClass("Hidden");
	
	if(loadflag[divId]==undefined){
	//历史数据模板 加载这个系列的数据 然后使用view模板
		loadflag[divId]=true;
		//输入框模板
		if($("#"+divId+"-info-template").size()>0){
			$.ajax({
				type: "get",
				url:"/studentInfo/typeList",
				data:{"studentId":studentId,"type":divId},
				success: function(data) {
					for(var i=0;i<data.item.length;i++){
						var addItem = Handlebars.compile($("#"+divId+"-info-template").html());
			    		$('#'+divId+'-info').append(addItem(data.item[i]));
					}
					//getOtherInfoObj(String id,String type,String little)
			    	
					
					//输入框模板
					if($("#"+divId+"-template").size()>0&& $("#"+divId+"-template").hasClass("add")){
						var myTemplate = Handlebars.compile($("#"+divId+"-template").html());
					    $('#'+divId+'Div').html(myTemplate());
					    
					  //文件组复选框组
					}
					
				
					 btnBinding(divId);
				}
			})
			
		}
	}
	
})	




$(".form-control").watch(function(e,value) { 
	if(e.hasClass("quicksave")){//有此class才保存，不然只给提示
	var id=$("[name="+e.attr("inputForm")+"_id]");
	var studentId=$("#studentId").val();
	var url=id.attr("url");
	var idVal=id.val();
	
	$.ajax({
		type: "get",
		url:url,
		data:e.attr("name")+'='+value+"&id="+idVal+"&studentId="+studentId,
		success: function(data) {
			//添加点样式
			e.addClass("");
			id.val(data.item.id);
			//layer.msg('修改保存', {icon: 1});
			parent.layer.msg('修改成功');
	}
	})
	}
}); 
	
	
})

//String userId;//评价人
//	String impressId; //评价主键
//	String impressLable; //评价内容
//	String impressValue; //评价值

$(document).ready(function() {
	
	$(".impressBtn").click(function(e){
		var studentId=$("#studentId").val();
		var input ="impress";
		var savaUrl='/studentInfo/'+input;
    	savaUrl+="/save?studentId="+studentId;
		$.ajax({
    		type: "get",
    		url:savaUrl,
    		data:{"impressId":$(this).attr("id"),"impressValue":$(this).attr("value"),"impressLabel":$(this).attr("label")},
    		success: function(data) {
    			var addItem = Handlebars.compile($("#"+input+"-info-template").html());
    			var obj=addItem(data.item);
    			$('#'+input+'-info').append(obj);
    			parent.layer.msg('添加成功');
    			btnBinding('impress');
    	}
    	})
		
		
	})
	
    Dropzone.options.demoDropzone = {
        autoProcessQueue: false,
        //uploadMultiple: true,
        //parallelUploads: 25,
        //maxFiles: 25,
        // The setting up of the dropzone
        init: function() {
        var myDropzone = this;
       
        
        //  Here's the change from enyo's tutorial...
        //  $("#submit-all").click(function (e) {
        //  e.preventDefault();
        //  e.stopPropagation();
        //  myDropzone.processQueue();
            //
        //}
        //    );

        }

    }
    
//    });	

    // DROPZONE.JS WITH BOOTSTRAP'S THEME
    // =================================================================
    // Require Dropzone
    // http://www.dropzonejs.com/
    // =================================================================
    // Get the template HTML and remove it from the doumenthe template HTML and remove it from the doument
  var previewNode = document.querySelector("#dz-template");
    previewNode.id = "";
    var previewTemplate = previewNode.parentNode.innerHTML;
    previewNode.parentNode.removeChild(previewNode);
    var uploadUrl="/studentInfo/file/save";
    var title="";
    var open="";
    
    function getUrl(){
    	open=$("#file_open").val();
    	title=$("#file_open").val();
    	return uploadUrl+"?studentId="+$("#studentId").val()+"&open="+open+"&title="+title;
    }
   // var params="?studentId="+$("#studentId").val()+"&open="+open+"&title="+title;
    var uplodaBtn = $('#dz-upload-btn');
    var removeBtn = $('#dz-remove-btn');
    var myDropzone = new Dropzone(document.body, { // Make the whole body a dropzone
        url:getUrl() , // Set the url
        thumbnailWidth: 50,
        thumbnailHeight: 50,
        parallelUploads: 20,
        maxFilesize:5,
        previewTemplate: previewTemplate,
        autoQueue: false, // Make sure the files aren't queued until manually added
        previewsContainer: "#dz-previews", // Define the container to display the previews
        clickable: ".fileinput-button" // Define the element that should be used as click trigger to select files.
    });


    myDropzone.on("addedfile", function(file) {
        uplodaBtn.prop('disabled', false);
        removeBtn.prop('disabled', false);
    });

    myDropzone.on("success", function(file,data) {
    	$.ajax({
    		type: "get",
    		url:'/studentInfo/file/fileUpdate',
    		data:{"id":data.item.id,"little":$("#file_little").val(),"open":$("#file_open").val()},
    		success: function(data) {
    			parent.layer.msg('上传成功');
    		}
    	 });     
    });
    
    $(".laydate-icon").on("click",function(){
    	$("#"+$(this).attr("targetId")).focus();
    
    });
    
    // Update the total progress bar
    myDropzone.on("totaluploadprogress", function(progress) {
        $("#dz-total-progress .progress-bar").css({'width' : progress + "%"});
    });

    myDropzone.on("sending", function(file) {
        // Show the total progress bar when upload starts
        document.querySelector("#dz-total-progress").style.opacity = "1";
    });

    // Hide the total progress bar when nothing's uploading anymore
    myDropzone.on("queuecomplete", function(progress) {
        document.querySelector("#dz-total-progress").style.opacity = "0";
    });

    //点击删除按钮
    myDropzone.on("removedfile", function(file) {
    	var item=file.xhr;
    	if(item!=undefined){
    		var json = eval('(' + item.response + ')'); 
        	var id=json.item.id;
        	$.ajax({
        		type: "get",
        		url:'/studentInfo/changeStatus',
        		data:{"id":id,"status":'0'},
        		success: function(data) {
        			parent.layer.msg('删除成功');
        	}
        })
    }
    
    	
    	
    });

    // Setup the buttons for all transfers
    uplodaBtn.on('click', function() {
//    	title=$("#file_title").val();
//    	alert(title);
//    	open=$("#file_open").val();
     myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
    });

    removeBtn.on('click', function() {
        uplodaBtn.prop('disabled', true);
        removeBtn.prop('disabled', true);
    });

});