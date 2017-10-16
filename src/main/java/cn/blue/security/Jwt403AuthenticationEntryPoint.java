package cn.blue.security;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.Http403ForbiddenEntryPoint;

public class Jwt403AuthenticationEntryPoint extends Http403ForbiddenEntryPoint {

	@Override
	public void commence(HttpServletRequest request,
			HttpServletResponse response, AuthenticationException arg2)
			throws IOException, ServletException {
		System.out.println(request.getRequestURL());
        // This is invoked when user tries to access a secured REST resource without supplying any credentials
        // We should just send a 401 Unauthorized response because there is no 'login page' to redirect to
        response.getWriter().print(HttpServletResponse.SC_UNAUTHORIZED+arg2.getMessage());
	}

   
}
