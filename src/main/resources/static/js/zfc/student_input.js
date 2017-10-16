 function remoteData(fieldName){
    	return {
    		 type:"post",
             url:"/student/checkOnly",             //servlet
             data:{
               id:'${bean!=null?bean.id:null}',
               key:fieldName,
				   value:function(){return $("#"+fieldName+"").val();}
             } 
    } 
};
    
    
$(document).ready(function () {
            
	$("#formdata").validate({
        rules: {
            tel: {
            	required:true,
            	minlength:8,
            	remote:remoteData('tel')
            	},
            sfz:{
            	required:true,
            	minlength:18,
            	remote:remoteData('sfz')
            },
            xm: {
                required: true,
                minlength:2
            },
            email: {
                required: true,
                email: true,
                remote:remoteData('email')
            }
        },
        messages: {
        	xm: {
        		required:icon + "请输入你的姓名"
        		},
        	tel:{
        		required:icon + "请输入你的联系方式",
        		remote:icon +"联系方式已经存在"
        	}, 
            sfz: {
                required:  "请输入您身份证",
                minlength: icon + "身份证号码长度不正确",
            	remote:icon+"身份证已经存在"
            },
            email: {
            	required:icon + "请输入您的E-mail",
        		remote:icon +"email已存在"
            }
        },
        submitHandler:function(){//验证通过

        }
        
        
        
    });
	
	
})

var icon = "<i class='fa fa-times-circle'></i> ";

function dataSubmit(){
	$("#formdata").valid();
	var  errorList=$("#formdata").validate().errorList;
	if(errorList.length==0){
    	$.ajax({
		type: "get",
		url: "/student/save",
		data:$("#formdata").serialize(),
		success: function(data) {
			$("#id").val(data.item.id);
			layer.msg('成功保存', {icon: 1});
		}})
		
	}
}

	