package cn.blue.security.fiter;

import io.jsonwebtoken.ExpiredJwtException;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.web.filter.GenericFilterBean;

import cn.blue.common.ResponseHandler;
import cn.citms.base.exception.Rre;

/*
This filter checks if there is a token in the Request service header and the token is not expired
it is applied to all the routes which are protected
*/
public class VerifyTokenFilter extends GenericFilterBean {

    private final TokenUtil tokenUtil;
  
    private AuthenticationFailureHandler loginFailureHandler = new SimpleUrlAuthenticationFailureHandler();

    public VerifyTokenFilter(TokenUtil tokenUtil) {
        this.tokenUtil = tokenUtil;
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest  request  = (HttpServletRequest)  req;
        System.out.println(request.getRequestURI());
        HttpServletResponse response = (HttpServletResponse) res;
        try {
            Optional<Authentication> authentication = tokenUtil.verifyToken(request);
            if (authentication.isPresent()) {//Optional 是jdk1.8里面的新类  泛型里面是否有值
              SecurityContextHolder.getContext().setAuthentication(authentication.get());
              //SecurityContextHolder是用来保存SecurityContext的。SecurityContext中含有当前正在访问系统的用户的详细信息
            }
            else{
            	//没有登录信息
              SecurityContextHolder.getContext().setAuthentication(null);
            }
            //去下一个过滤器
            filterChain.doFilter(req, res);
        }
        catch (ExpiredJwtException e) { //过期
//        	ResponseHandler.fail(response, 111);//.reseponseI18n(request,response,"expired_jwt_token");//可以考虑不要写死
        	ResponseHandler.fail(response, Rre.TOKEN_EXPIRED);//超时
        }catch(IllegalArgumentException e){
        	ResponseHandler.fail(response, Rre.UN_PERMISSION);//登录无权限
        }catch(AccessDeniedException e){
        	ResponseHandler.fail(response, Rre.UN_PERMISSION);//登录无权限
        }
        catch (Exception e) {
        	e.printStackTrace();
//        	ResponseHandler.fail(response, 6);//无权限
        	ResponseHandler.fail(response,Rre.find(e),e.getMessage());//通用查找异常
//        	ResponseHandler.reseponseI18n(request,response,e.getMessage().replace(" ", "_"));//可以考虑不要写死
        }
        
        finally {
            SecurityContextHolder.getContext().setAuthentication(null);
          return;  // always return void
        }
    }
    
   

}
