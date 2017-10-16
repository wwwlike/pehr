package cn.blue.security.fiter;

//import groovy.util.logging.Slf4j;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.blue.common.ResponseHandler;
import cn.blue.security.SecurityUser;
import cn.blue.security.response.SessionItem;
import cn.blue.security.response.SessionResponse;
import cn.citms.base.exception.Rre;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

//生成的令牌是用户过滤器 网客户端写令牌 认证处理过滤器
/* This filter maps to /session and tries to validate the username and password */
//@Slf4j
public class GenerateTokenForUserFilter extends AbstractAuthenticationProcessingFilter {
	
	private MessageSource messageSource;

    private TokenUtil tokenUtil;

    public GenerateTokenForUserFilter(String urlMapping, AuthenticationManager authenticationManager, TokenUtil tokenUtil) {
        super(new AntPathRequestMatcher(urlMapping));
        setAuthenticationManager(authenticationManager);
        this.tokenUtil = tokenUtil;
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException, IOException, ServletException {
		messageSource=(MessageSource) WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean("messageSource");
    	try{
            String jsonString = IOUtils.toString(request.getInputStream(), "UTF-8");
            /* using org.json */
          //  JSONObject userJSON = new JSONObject(jsonString);
            String username = request.getParameter("username");
            String password = request.getParameter("password");
//            log.info("username:{} and paswword:{} \n", username, password);
            //final UsernamePasswordAuthenticationToken loginToken = new UsernamePasswordAuthenticationToken("demo", "demo");
            final UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(username, password);
           //验证用户名密码
            return getAuthenticationManager().authenticate(authToken); // This will take to successfulAuthentication or faliureAuthentication function
       }
        catch(AuthenticationException e){
        	ResponseHandler.fail(response, Rre.LOGIN_ERROR);
        	return null;
        }
    }
    //认证成功处理器
    @Override
    protected void successfulAuthentication ( HttpServletRequest req, HttpServletResponse res, FilterChain chain, Authentication authToken) throws IOException, ServletException {
        SecurityContextHolder.getContext().setAuthentication(authToken);
        /*
        JSONObject jsonResp = new JSONObject();
        SecurityUser SecurityUser = (SecurityUser)authToken.getPrincipal();
        String newToken = this.tokenUtil.createTokenForUser(SecurityUser);

        jsonResp.put("token",newToken);
        jsonResp.put("firstName",SecurityUser.getUser().getFirstName());
        jsonResp.put("lastName",SecurityUser.getUser().getLastName());
        jsonResp.put("email",SecurityUser.getUser().getEmail());
        jsonResp.put("role",SecurityUser.getRole());
        */

        SecurityUser SecurityUser = (SecurityUser)authToken.getPrincipal();
        SessionResponse resp = new SessionResponse();
        SessionItem respItem = new SessionItem();
        ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
        String tokenString = this.tokenUtil.createTokenForUser(SecurityUser);
        respItem.setName(SecurityUser.getName());
        respItem.setUsername(SecurityUser.getUsername());
        respItem.setUserId(SecurityUser.getId());
        respItem.setEmail(SecurityUser.getEmail());
        respItem.setToken(tokenString);
        respItem.setRoleId(SecurityUser.getSrole()!=null?SecurityUser.getSrole().getId():null);
        resp.setItem(respItem);
    	ResponseHandler.success(res, resp);

//        String jsonRespString = ow.writeValueAsString(resp);
//        res.setStatus(HttpServletResponse.SC_OK);
//        res.getWriter().write(jsonRespString);
//        res.getWriter().flush();
//        res.getWriter().close();

        // DONT call supper as it contine the filter chain super.successfulAuthentication(req, res, chain, authResult);
    }
    
}
