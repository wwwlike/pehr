function getElementsClass(classnames){ 
var classobj= new Array();//定义数组 
var classint=0;//定义数组的下标 
var tags=document.getElementsByTagName("*");//获取HTML的所有标签 
for(var i in tags){//对标签进行遍历 
if(tags[i].nodeType==1){//判断节点类型 
if(tags[i].getAttribute("class") == classnames)//判断和需要CLASS名字相同的，并组成一个数组 
{ 
classobj[classint]=tags[i]; 
classint++; 
} 
} 
} 
return classobj;//返回组成的数组 
} 


window.onresize = function(){
        var hei = document.documentElement.clientHeight;  
//      document.getElementById("center-right-middle").style.height = len - 140 + 'px';  
       
    };  

function tubiaobs(id){
	var elem=document.getElementById(id).style;
	elem.fontcolor()='#BBDEFB';
}


$(document).ready(function(){
	$(document).keyup(function(event){
		if(event.keyCode ==13){
//			mainPage.leftFilter($(".sousuokuang").val());
		}
	});
})