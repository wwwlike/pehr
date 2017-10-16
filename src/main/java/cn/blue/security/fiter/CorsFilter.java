package cn.blue.security.fiter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import org.springframework.stereotype.*;


// When @EnableWebSecurity is on then @Component shouldnt be used else the filter will be registered twice
@Component
public class CorsFilter implements javax.servlet.Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletResponse res = (HttpServletResponse) response;
		HttpServletRequest  req = (HttpServletRequest) request;
	// 指定允许其他域名访问  允许跨域
    res.setHeader("Access-Control-Allow-Origin", "*");
    // 允许客户端响应类型  
    res.setHeader("Access-Control-Allow-Methods", "GET, POST, DELETE, PUT, OPTIONS");
	//getResponseHeader()方法只能拿到6个基本字段：
    //Cache-Control、Content-Language、Content-Type、Expires、Last-Modified、Pragma。如果想拿到其他字段，就必须在Access-Control-Expose-Headers里面指定。上面的例子指定，getResponseHeader('FooBar')可以返回FooBar字段的值。
    res.setHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Accept-Encoding, Accept-Language, Host, Referer, Connection, User-Agent, authorization, sw-useragent, sw-version");

		// Just REPLY OK if request method is OPTIONS for CORS (pre-flight)
		//OPTIONS请求方法的主要用途有两个：
//1、获取服务器支持的HTTP请求方法；也是黑客经常使用的方法。
//2、用来检查服务器的性能。例如：AJAX进行跨域请求时的预检，需要向另外一个域名的资源发送一个HTTP OPTIONS请求头，用以判断实际发送的请求是否安全。
		if ( req.getMethod().equals("OPTIONS") ) {
        res.setStatus(HttpServletResponse.SC_OK);
        return;
    }
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {}
}
