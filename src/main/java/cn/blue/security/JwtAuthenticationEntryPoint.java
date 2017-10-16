package cn.blue.security;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.autoconfigure.security.Http401AuthenticationEntryPoint;
import org.springframework.security.core.AuthenticationException;

import cn.blue.common.ResponseHandler;
import cn.citms.base.exception.Rre;
//是否有权限
public class JwtAuthenticationEntryPoint extends Http401AuthenticationEntryPoint {

    public JwtAuthenticationEntryPoint(String headerValue) {
		super(headerValue);
		// TODO Auto-generated constructor stub
	}

    //不加此拦截器就会去掉security默认的登录页面
    @Override
    public void commence(HttpServletRequest request,
                         HttpServletResponse response,
                         AuthenticationException authException) throws IOException {
        // This is invoked when user tries to access a secured REST resource without supplying any credentials
        // We should just send a 401 Unauthorized response because there is no 'login page' to redirect to
//    	ResponseHandler.response401(response, new OperationResponse(ResponseStatusEnum.NO_ACCESS, authException.getMessage()));
//    	ResponseHandler.reseponseI18n(request,response,authException.getMessage().replaceAll(" ","_"));//可以考虑不要写死
    	ResponseHandler.fail(response,Rre.UN_AUTH);//没有登录不能访问
    }
}
