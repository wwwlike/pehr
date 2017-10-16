package cn.blue.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;

import cn.blue.common.ResponseHandler;
import cn.citms.base.exception.Rre;
/**
 * 登录失败处理器
 * @author Administrator
 *
 */
public class EAccessDeniedHandler extends AccessDeniedHandlerImpl {

	@Override
	public void handle(HttpServletRequest request,
			HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException,
			ServletException {
		
		if (!response.isCommitted()) {
			// Put exception into request scope (perhaps of use to a view)
			request.setAttribute(WebAttributes.ACCESS_DENIED_403,
					accessDeniedException);
			// Set the 403 status code.
			response.setStatus(HttpServletResponse.SC_FORBIDDEN);
			// forward to error page.
//			response.getWriter().write(accessDeniedException.getMessage());
			
			ResponseHandler.fail(response, Rre.UN_PERMISSION);//登录无权限
		}
		else {
			response.sendError(HttpServletResponse.SC_FORBIDDEN,
					accessDeniedException.getMessage());
		}
	}

}
