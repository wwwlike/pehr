package cn.blue.security.request;

import io.swagger.annotations.ApiModelProperty;

import javax.validation.constraints.NotNull;

import cn.blue.common.ValidateGroup.Get;
import cn.citms.core.bean.ValidateGroup.Del;
import cn.citms.core.bean.ValidateGroup.Update;
import cn.citms.core.repository.query.BaseRequest;

public class AuthenticationRequest extends BaseRequest {

	public String token;
	
    @NotNull(groups = {Get.class, Del.class, Update.class})  
    @ApiModelProperty(value = "认证token ,2小时失效",position=0)
	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}
	
}
