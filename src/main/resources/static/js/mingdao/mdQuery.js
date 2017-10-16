jQuery.fn.isChildAndSelfOf = function(b){ 
	return (this.closest(b).length > 0); 
};
function arrayIntersection(a, b)
{
 var ai=0, bi=0;
 var result = new Array();
 while( ai < a.length && bi < b.length )
 {
   if (a[ai] < b[bi] ){ ai++; }
   else if (a[ai] > b[bi] ){ bi++; }
   else /* they're equal */
   {
    result.push(a[ai]);
    ai++;
    bi++;
   }
 }
 return result;
}


var orFilters=null;
//左侧过滤  
function leftFilter(key){
	var keys=key.split(" ");
	orFilters=new Array();
	for(var i=0;i<keys.length;i++){
		var xm=new Object();
		xm.key="xm";
		xm.value=keys[i];
		var tel=new Object();
		tel.key="tel";
		tel.value=keys[i];
		orFilters.push(xm);
		orFilters.push(tel);
	}
	createDataRow(all,filters,orFilters);//最全的数据， 加入过滤器
}




var filterKeyValue=new Object();

var showIds=null;

function clearFilter(){
	showIds=null;
	filterKeyValue=new Object();
	$(".filterSpan").html("");
	 $(".animatedFast").hide();
	 $(".k2RightContent").css("top","0px")
	createDataRow(all,filters,orFilters);//最全的数据， 加入过滤器
}


function deleteFilter(type,key,vv,label){
	delete  filterKeyValue[type+"_"+key+"_"+vv+"_"+label];
	 showIds=null;
	 $("#"+vv).remove();
	 if($(".filterLabel").size()==0){
		 $(".animatedFast").hide();
		 $(".k2RightContent").css("top","0px")
	 }
	var i=0;
	for (x in filterKeyValue) {  
		var arrayIds=filterKeyValue[x];
		 if(showIds==null){
    		 showIds=arrayIds;
    	 }else{
    		 //取showIds 和 arrayIds 交集
    		 showIds=arrayIntersection(showIds,arrayIds);
    	 }
		 i++
	} 
	if(i==0){
		showIds=null;
	}
	createDataRow(all,filters,orFilters);//最全的数据， 加入过滤器
}
/**
 * mongodb数据过滤 返回剩下可以见的studentIds;
 * @param type
 * @param key 字段名
 * @param value 字段值
 * @param  label 字段含义
 */
function mongoFilter(type,key,vv,label){
	
		 $(".animatedFast").show();
		 $(".k2RightContent").css("top","50px")
	
	 
	$(".filterSpan").append("<span id='"+vv+"' class='filterLabel categoryItem'>"+label+"<span class='categoryItemDel' data-tip='删除筛选项'><i class='icon-closeelement-bg-circle' onClick='deleteFilter(\""+type+"\",\""+key+"\",\""+vv+"\",\""+label+"\")'></i></span></span>")
	$.ajax({ url : '/studentInfo/filter',
        data:{'type':type,'key':key,'value':vv},
        dataType:'json',
         success:function(data){
        	
        	 filterKeyValue[type+"_"+key+"_"+vv+"_"+label]=data;
        	//组装showIds可以显示的
        		for (x in filterKeyValue) {  
        			var arrayIds=filterKeyValue[x];
        			 if(showIds==null){
                		 showIds=arrayIds;
                	 }else{
                		 //取showIds 和 arrayIds 交集
                		 showIds=arrayIntersection(showIds,arrayIds);
                	 }
//        			for(var i=0;i<arrayIds.length;i++){
//        			 if($.inArray(arrayIds[i], showIds)==-1){
//        				 showIds.push(arrayIds[i]);
//        			 }
//        			}
        		} 
        		createDataRow(all,filters,orFilters);//最全的数据， 加入过滤器
        		
        		
         }
	});
	
}


//基础数据 学校 班级 专业
var basic=new Object();


var all=null;//原始数据，从db里面查询到的。

var  filters=new Array();

//往过滤器组里面增减过滤器
function filterCreate(filter){
	var  newFilters=new Array();
	if(filter.value!=null&&filter.value!=""&&filter.value!=undefined){//只要值不是空就用
		newFilters.push(filter);
	}
	for(i=0;i<filters.length;i++){
		if(filters[i].key!=filter.key&&(filter.removeKeys!=null&&filter.removeKeys!=undefined&&filter.removeKeys.indexOf(filters[i].key)==-1)){//用过的不用，需要删除的不能添加
			newFilters.push(filters[i]);
		}
	}
	filters=newFilters;
	return filters;
}




//完整数据通过filter过滤
function jsonFilter(array,filter) {
	if(filter!=undefined){
		filters=filterCreate(filter);
	}
	var filterData=new Array();
	for(var i=0;i<array.length;i++){
		var num=0;
		for(var j=0;j<filters.length;j++){
			
			if(array[i][filters[j].key].indexOf(filters[j].value)!=-1){ //key查询的值和 过滤器key查询的值， 是一个 则表示过滤成功
				num++;
			}
		}
		if(num==filters.length){
			filterData.push(array[i]);
		}
	}
	return filterData;
}  


//对数据 array用单个过滤器进行过滤，返回数据
function jsonOneFilter(array,filter) {
	var filterData=new Array();
	for(var i=0;i<array.length;i++){
		var num=0;
			if(array[i][filter.key].indexOf(filter.value)!=-1){ //key查询的值和 过滤器key查询的值， 是一个 则表示过滤成功
				filterData.push(array[i]);
		}
	}
	return filterData;
}  


/**
 * 
 * @param data 要过滤的数据
 * @param filters 过滤数据的json字符串
 */
function createDataRow(data,filters,orFilters){
	if(all==null){
		all=new Array();
		all=data;
	}
	
	$(".k2RightContent .clearfix").html("");
//	var obj={key:"xm",value:"张三"};
	if(filters!=undefined){
	for(var i=0;i<filters.length;i++){
		data=jsonFilter(data,filters[i]); //一层一层过滤
	}}
	if(orFilters!=undefined){
	var orFilterData=new Array();//用或过滤器过滤后的数据
	for(var j=0;j<orFilters.length;j++){
		orFilterData=orFilterDataAdd(orFilterData,jsonOneFilter(data,orFilters[j])); //data 过滤后剩余数据
	}
	data=orFilterData;
	}
	$(data).each(function(e){
		if(showIds==null||$.inArray(this.id, showIds)!=-1){
			addData(this,false);
		}
	});
}
//或查询数据累加
//all 已经累加数据， filterdata 过滤后剩余数据， 如果过滤后的数据不再已经有的数据里 则加入进去
function orFilterDataAdd(all,filterData){
	var returnData=all;
	for(var i=0;i<filterData.length;i++){
		var num=0;
		for(var j=0;j<all.length;j++){
			if(filterData[i]==all[j]){
				num++;
			}
		}	
		if(num==0){
			returnData.push(filterData[i]);
		}
	}
	return returnData;
}

var currId=null;

function addData(newData,intoFirst){
	$(".k2RightContent .clearfix li").removeClass("active");
	
	var li='<li class="flexRow  ani0 first-child  fadeInUp noSelect nodeItem" id='+newData.id+'>'+
	'<span class="noSelectPoint"></span>'+
	'<span class="selectBox">'+
		'<span class="select boderRadAll_3" >'+
			'<i class="icon-task-status-ok" ></i>'+
		'</span></span>'+
	//'<img alt="" class="listViewImg" src="" >'+
	'<span class="listName ellipsis" title="" >'+newData.name+'</span>'+
	'<span class="listName ellipsis" title="" > '+'</span>'+
	'<span class="flex" ></span>'+
	'<span class="createTime ellipsis cursorDefault">'+newData.tel+'</span>'+
	'<span class="createTime ellipsis cursorDefault"><span >'+basic[newData.schoolId]+'</span>'+
	'<span >&nbsp;</span></span><span class="createTime ellipsis cursorDefault">'+basic[newData.sclassId]+'</span></li>';
	
	var $li=$(li);
	
	$li.click(function(e){
		var thisId=$(this).attr("id");
		$li.parent().find("li").removeClass("active");
		$li.addClass("active");
		$(".k2RightContent").addClass("showDetail");
		$(".k2RightContent").removeClass("removeDetail");
		if(!$("#tasks").hasClass("slideDetail")){
			$("#slideTaskDetail").animate({right:'0px'});//东西进来
			
		}else{
			
		}
		e.stopPropagation(); //组织冒泡
		if(currId!=thisId){
			mainPage.location.href='/student/info?id='+thisId;
			currId=thisId;
		}
	})

		
	if(intoFirst){
		$(".k2RightContent .clearfix").prepend($li);
	}else{
		$(".k2RightContent .clearfix").append($li);
	}
}




$(document).ready(function(){
	//学校班级 数据
	$.ajax({ url : '/school/getAll',
        data:{},
        async: false,
        dataType:'json',
         success:function(data){
        	 for(var i=0;i<data.length;i++){
        		 basic[data[i].id]=data[i].name;
        	 }
         }
	});
	
	$.ajax({ url : '/schoolClass/getAll',
        data:{},
        dataType:'json',
        async: false,
         success:function(data){
        	 for(var i=0;i<data.length;i++){
        		 basic[data[i].id]=data[i].name;
        	 }
         }
	});
	
	
	$.ajax({ url : '/schoolMajor/getAll',
        data:{},
        dataType:'json',
        async: false,
         success:function(data){
        	 for(var i=0;i<data.length;i++){
        		 basic[data[i].id]=data[i].name;
        	 }
         }
	});
	
			
				$('#networkSwitch').click(
					function(e) {
	 					var t = $(this);
	 					if(t.hasClass("ThemeColor3") ){ 
	 					if(t.find(".networkSwitchList").hasClass('Hidden')){
	 						t.find(".networkSwitchList").removeClass("Hidden");
	 					}else{
	 						t.find(".networkSwitchList").addClass("Hidden");
	 						if($(e.target).text()!=""){
	 							$(".networkSwitchList li").removeClass().addClass("ThemeBGColor3");
	 							$(e.target).removeClass().addClass("ThemeColor3");
		 						$("#networkSwitch .networkLabel").attr("data-tip",$(e.target).text());
			 					$("#networkSwitch .networkName").text($(e.target).text());
		 			}
	 			}
	 		}	
		}
	)
				
	
				$('.filter').click(
	 				function(e) {
	 					var t = $(this);
	 					var target=$(e.target);
	 					if( t.find(".statusList").hasClass('Hidden')){ //是隐藏状态
	 						$(".statusList").addClass("Hidden");
	 						t.find(".statusList").removeClass("Hidden");
	 					}else{									       //显示状态
	 						t.find(".statusList").addClass("Hidden");
	 					}
	 			 });
				
				
				
				$(".filterLi").click(function(e){
					var selects=$(this).parents().find(".filter");
					selects.find(".statusList").addClass("Hidden");
					mongoFilter('impress',$(this).attr("key"),$(this).attr("value"),$(this).attr("label"));
					e.stopPropagation(); //组织冒泡
				});
				
	
	
				
				$('.taskStatus').click(
	 				function(e) {
	 					var t = $(this);
	 					var target=$(e.target);
	 					if( t.find(".statusList").hasClass('Hidden')){ //是隐藏状态
	 						$(".statusList").addClass("Hidden");
	 						t.find(".statusList").removeClass("Hidden");
	 					}else{									       //显示状态
	 						t.find(".statusList").addClass("Hidden");
	 					}
	 					
//	 					if($(e.target).text()!=""&&!target.hasClass("ThemeColor3")&& !target.hasClass("noBgColor")){ 
//	 						$(".taskStatus li").not(".taskCompleteFilterOnly").removeClass("noBgColor");
//	 						$(".taskStatus li").not(".taskCompleteFilterOnly").removeClass("ThemeColor3");
//	 						target.addClass("ThemeColor3");
//	 						target.addClass("noBgColor");
//	 						t.find("label").text($(e.target).text());
//	 						//alert($(this).attr("key"));	
//	 					}
	 			 });
						
				
				$(".taskStatusLi").click(function(e){
					$(this).prevAll().removeClass("ThemeColor3");
					$(this).prevAll().find(".taskStatusLi").removeClass("ThemeColor3");
					$(this).nextAll().removeClass("ThemeColor3");
					$(this).nextAll().find(".taskStatusLi").removeClass("ThemeColor3");
					$(this).addClass("ThemeColor3");
					var filters=[{key:$(this).attr("key"),value:$(this).attr("value"),removeKey:$(this).attr("removeKey")}];
				
					var selects=$(this).parents().find(".taskStatus");
					var thisli=$(this);
					selects.each(function(e){
						if($(this).find(thisli).size()>0){
							$(this).find("label:eq(0)").text(thisli.attr("label"));
							$(this).find(".statusList").addClass("Hidden");
						}
					 });
					createDataRow(all,filters,orFilters);//最全的数据， 加入过滤器
					e.stopPropagation(); //组织冒泡
				});
				
				
				$("body").click(function(e){
					var target=$(e.target);
					var isSlideTaskDetail =target.isChildAndSelfOf("#slideTaskDetail"); 
					var listStageTaskContent =target.isChildAndSelfOf(".listStageTaskContent"); 
					
				//	if(!isSlideTaskDetail&&!listStageTaskContent&&$("#tasks").hasClass("slideDetail")){
						$("#slideTaskDetail").animate({right:'-760px'});
						$("#tasks").removeClass("slideDetail");
						$(".k2RightContent").removeClass("showDetail");
						$(".k2RightContent").addClass("removeDetail");
				//	}
				}); 

				$.ajax({ url : '/student/findAll',
					                    data:{},
					                    dataType:'json',
					                     success:function(data){
					                  	 createDataRow(data.item);//初始化数据 ，没有任何过滤器
					                     }
					                    
				});
				 
				 
				 $('#addStudent').click(function(e){
					  parent.layer.open({
						    type: 2,//iframe层 0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
						    title: "新建学生",
						    shadeClose: true,
//						    scrollbar :false,
						    shade: 0.6,
						    area: ['800px', '60%'],
						    content: '/student/input',
						    btn: ['保存', '关闭'],
						    end: function () {
					           location.reload();
					        },
					        yes: function(index, layero){
					        	var iframeWin =window.parent[layero.find('iframe')[0]['name']];
					        	iframeWin.dataSubmit();
					        	
					        	layer.close(index);
					        
					        }
					 }); 
						e.stopPropagation(); //组织冒泡

					 
					 
				 })
				
				
				$('#bg-znss').click(function(){
					$('#znss').hide();
					$('#bg-znss').css('background-color','white');
					$('#input-znss').show(function(){
						$('#input-znss').focus()
					});
					$('#search').css('color','grey');
				})
				$('#input-znss').blur(function(){
					$('#znss').show();
					$('#bg-znss').css('background-color','#3393E6');
					$('#input-znss').hide();
					$('#search').css('color','white');
				})
				$('.center-left-box1').hover(function(){
					$('#guanbi').css('color','gray');
				},function(){
					$('#guanbi').css('color','#BBDEFB');
				})
				$('.box1-guanbi-icon').click(function(){
					$('.center-left-box1').css('display','none')
				})
				$(".l-dh1").click(function(){
					$(this).addClass("l-dhbian").removeClass("l-dhbianhui");
					$(this).siblings().removeClass("l-dhbian").addClass('l-dhbianhui');
				}) 
				$('.kminddle').click(function(){
					$('.Box2-box1-middle').fadeToggle();
					
				})
				$('.cldh1').click(function(){
					
					$('.center-left-Box1').siblings().filter('.jihe').css('display','none');
					$('.center-left-Box1').fadeIn();
				})
				$('.cldh2').click(function(){
					
					$('.center-left-Box2').siblings().filter('.jihe').css('display','none');
					$('.center-left-Box2').fadeIn();
				})
				$('.cldh3').click(function(){
					
					$('.center-left-Box3').siblings().filter('.jihe').css('display','none');
					$('.center-left-Box3').fadeIn();
				})
				$('.cldh4').click(function(){
					
					$('.center-left-Box4').siblings().filter('.jihe').css('display','none');
					$('.center-left-Box4').fadeIn();
				})
				$('.cr-li1').click(function(){
					$('.c-r-m-middle').siblings().filter('.middle1').css('display','none');
					$('.c-r-m-middle').fadeIn();
				})
				$('.cr-li2').click(function(){
					$('.c-r-m-middle1').siblings().filter('.middle1').css('display','none');
					$('.c-r-m-middle1').fadeIn();
				})
				$('.plus').click(function(){
					$('.renwukuang').fadeToggle();
					$('.renwukuang').focus();
				})
				$('.renwukuang').blur(function(){
					$('.renwukuang').fadeOut();
				})
				$('.pluskuangkuang').click(function(){
					$('.pluskuangkuang-1').fadeToggle();
					$('.pluskuangkuang-1').focus();
				})
				$('.pluskuangkuang-1').blur(function(){
					$('.pluskuangkuang-1').fadeOut();
				})
				
			})
			
			
			
$(document).ready(function(){
	$(document).keyup(function(event){
		if(event.keyCode ==13){
//			mainPage.
			leftFilter($(".sousuokuang").val());
		}
	});
})			