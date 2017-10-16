package cn.blue.common;


import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springside.modules.mapper.JsonMapper;

import cn.citms.base.exception.Rre;
import cn.citms.base.response.OperationResponse;
import cn.citms.core.bean.Resp;

/**
 * <h1>响应处理器</h1>
 * 
 */
public class ResponseHandler {
	
	private static final Log LOGGER = LogFactory.getLog(ResponseHandler.class);
	
	private static final String DEFAULT_ENCODING = "UTF-8";
	private static final String DEFAULT_CONTENT_TYPE = "application/json;chartset=UTF-8";

	private ResponseHandler() {
	}

	public static void response401(HttpServletResponse response,OperationResponse entity) throws IOException {
		response.setStatus(HttpStatus.UNAUTHORIZED.value());
		response.setContentType(DEFAULT_CONTENT_TYPE);
		response.setCharacterEncoding(DEFAULT_ENCODING);
		response.getWriter().print(JsonMapper.nonDefaultMapper().toJson(entity));
		LOGGER.info("ResponseHandler.response401 Access Token is Empty.");
		response.getWriter().flush();
		response.getWriter().close();
	}

	 /** 
     * 生成成功返回对象 
     * @param msg 
     * @return 
     */  
    public static void success(HttpServletResponse response,Resp entity) throws IOException{  
		response.setContentType(DEFAULT_CONTENT_TYPE);
		response.setCharacterEncoding(DEFAULT_ENCODING);
		response.getWriter().print(JsonMapper.nonDefaultMapper().toJson(entity));
		response.getWriter().flush();
		response.getWriter().close();
    }  
      
    /** 
     * 生成失败返回对象 
     * @param msg 
     * @return 
     */  
    public static void fail(HttpServletResponse response,Rre rre) throws IOException{  
    	response.setContentType(DEFAULT_CONTENT_TYPE);
		response.setCharacterEncoding(DEFAULT_ENCODING);
		response.getWriter().print(JsonMapper.nonDefaultMapper().toJson(OperationResponse.rre(rre)));
		response.getWriter().flush();
		response.getWriter().close();
    }  
    
    /** 
     * 生成失败返回对象 
     * @param msg 
     * @return 
     */  
    public static void fail(HttpServletResponse response,Rre rre,String en) throws IOException{  
    	response.setContentType(DEFAULT_CONTENT_TYPE);
		response.setCharacterEncoding(DEFAULT_ENCODING);
		response.getWriter().print(JsonMapper.nonDefaultMapper().toJson(OperationResponse.rre(rre,en,"")));
		response.getWriter().flush();
		response.getWriter().close();
    }  
	
	
	public static void response(HttpServletResponse response, HttpStatus status, OperationResponse entity) throws IOException {
		response.setStatus(status.value());
		response.setContentType(DEFAULT_CONTENT_TYPE);
		response.setCharacterEncoding(DEFAULT_ENCODING);
		response.getWriter().print(JsonMapper.nonDefaultMapper().toJson(entity));
		LOGGER.info("ResponseHandler.response Access Token is Empty.");
		response.getWriter().flush();
		response.getWriter().close();
	}

	public static void response(HttpServletResponse response,OperationResponse entity) throws IOException {
		response.setContentType(DEFAULT_CONTENT_TYPE);
		response.setCharacterEncoding(DEFAULT_ENCODING);
		response.getWriter().print(JsonMapper.nonDefaultMapper().toJson(ResponseEntity.ok(entity)));
		LOGGER.info("BeforeRequestInterceptor.response entity.");
		response.getWriter().flush();
		response.getWriter().close();
	}
	
	public static Locale locale;
	public static MessageSource messageSource;
			
//	 public static void reseponseI18n(ServletRequest request,HttpServletResponse response,String message_key) throws IOException{
//	     if(locale==null){
//			 locale = LocaleContextHolder.getLocale();
//		     messageSource=(MessageSource) WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean("messageSource");
//	     }
//	     String errorMsg = messageSource.getMessage(message_key, null, locale);
//	     fail(response, StringUtils.isEmpty(errorMsg)?message_key:errorMsg);
//	 }
}
