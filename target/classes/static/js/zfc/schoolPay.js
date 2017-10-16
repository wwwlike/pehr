// 支付创建功能，
(function($) {
 
	function getNewSclass(){
		var schoolId=$("#schoolId").val();
		var year = $("#year").val();
		var majorId=$("#majorId").val();
		var sclassIds=$(".divSclass").attr("sclassIds");
		$.ajax({
    		type: "get",
    		url:'/schoolClass/filterSclass',
    		data:{"schoolId":schoolId,"year":year,"majorId":majorId},
    		success: function(data) {
    			
    			
    			
    			//清空
    			$(".divSclass").html("");
    			for(var i=0;i<data.length;i++){
    				
    				var checked=((sclassIds.indexOf(data[i].id)==-1)?"":"checked");
    				var check="<label class='checkbox-inline i-checks'> <input type='checkbox' "+checked+" name='sclassIds' value='"+data[i].id+"' /></label><i></i>"+data[i].name
    				$(".divSclass").html(check);
    			}
    			
    			$('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
              });
    		}
    	})
	}
	
	
	
	
	$(document).ready(function(){
		
		$(".schoolPaySelect").change(function(){
			getNewSclass();
		});
		
		getNewSclass();
		
		
		
		
		
		
	})
	
	
})(jQuery)


