var systemConf={
	apiUrl:"http://localhost:18080",
	userId:null,
	token:null
}


function login() {
	var v_time = 1500;
	$account = $('#account');
	$password = $('#password');
	if($account.val() == '' || $password.val() == '') {
		layer.msg('帐号，密码不能为空');
		return;
	}
	var userInfo = {
		username: $account.val(),
		password: $password.val()
	}
	console.log(JSON.stringify(userInfo));
	$.ajax({
		type: "post",
		url: systemConf.apiUrl + "/session?username=" + $account.val() + '&password=' + $password.val(),
		async: true,
		success: function(data) {
			console.log(JSON.stringify(data))
			console.log(data);
			if(data.code == "WARNING") {
				layer.msg("用户名或密码错误!", {
					time: v_time
				});
				$account.focus();
				$password.val("").focus();
				return;
			} else if(data.msg != null) {
				layer.msg("用户名或密码错误!", {
					time: v_time
				});
				$account.focus();
				$password.val("").focus();
				return;
			} else {
				var token = data.item.token;
				localStorage.setItem("token", token); //token
				localStorage.setItem("baseRoot", systemConf.apiUrl); //baseRoot
				localStorage.setItem("username", data.item.username); //用户名
				localStorage.setItem("name", data.item.name); //用户名
				localStorage.setItem("roleId",data.item.roleId); //系统代码
				localStorage.setItem("userId", data.item.userId);
				localStorage.setItem("schoolId",data.item.schoolId);
				
				$.ajax({
					type: "get",
					url: baseRoot + "/api/sys/menu?roleId="+data.item.roleId,
					beforeSend: function(request) {
						request.setRequestHeader("Authorization", token);
					},
					success: function(data, request) {
						localStorage.setItem("menu", JSON.stringify(data));
						window.location.replace('/index.html');
					}
				});
				

//				$.ajax({
//					type: "get",
//					url: baseRoot + "/auth/resources/self",
//					beforeSend: function(request) {
//						request.setRequestHeader("Authorization", token);
//					},
//					success: function(data, request) {
//						var resourceCodes = [];
//						for(var i = 0; i < data.length; i++) {
//							resourceCodes.push(data[i].resourcesCode);
//						}
//						localStorage.setItem("selfResource", resourceCodes.join(","));
//
//						$.ajax({
//							type: "get",
//							url: baseRoot + "/api/moms/page/module?systemCode=PC",
//							beforeSend: function(request) {
//								request.setRequestHeader("Authorization", token);
//							},
//							success: function(data, request) {
//								localStorage.setItem("menu", JSON.stringify(data));
//								window.location.replace('/index.html');
//							}
//						});
//						
//					}
//				});
//				
				

			}
		},
		error: function(data) {
			console.log(JSON.stringify(data))
		}
	});
}

window.addEventListener('keyup', function() {
	if(window.event.keyCode == 13) {
		login()
	}
})