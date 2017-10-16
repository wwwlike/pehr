package cn.blue.config;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.PermissionEvaluator;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.DefaultAuthenticationEventPublisher;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;
import org.springframework.security.web.access.DelegatingAccessDeniedHandler;
import org.springframework.security.web.access.channel.ChannelProcessingFilter;
import org.springframework.security.web.csrf.InvalidCsrfTokenException;
import org.springframework.security.web.csrf.MissingCsrfTokenException;

import cn.blue.dao.ResourcesDao;
import cn.blue.item.Resources;
import cn.blue.security.EAccessDeniedHandler;
import cn.blue.security.EAuthenticationFailureHandler;
import cn.blue.security.EDefaultWebSecurityExpressionHandler;
import cn.blue.security.EPermissionEvaluator;
import cn.blue.security.ZfcUserDetailsService;
import cn.blue.security.fiter.CorsFilter;
import cn.blue.security.fiter.TokenUtil;

//用@Configuration注解该类，等价 与XML中配置beans；用@Bean标注方法等价于XML中配置bean。
@Configuration
@EnableWebSecurity
//为什么在一个类上添加一个@EnableWebSecurity注解后，就可以自动创建一个Filter呢？
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired()
	PasswordEncoder passwordEncoder;
	
    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    ZfcUserDetailsService zfcUserDetailsService;
    
    @Autowired()
    EDefaultWebSecurityExpressionHandler ewebSecurityExpressionHandler;
    
    @Autowired
    public ResourcesDao resourcesRepository;
    
    @Autowired
    private TokenUtil tokenUtil;

    @Bean
    EAuthenticationFailureHandler eauthenticationFailureHandler() {
        return new EAuthenticationFailureHandler();
    }
    
    @Autowired
    DefaultAuthenticationEventPublisher defaultAuthenticationEventPublisher;
    
    
    @Bean
	public DelegatingAccessDeniedHandler accessDeniedHandler() {
		LinkedHashMap<Class<? extends AccessDeniedException>, AccessDeniedHandler> handlers = new LinkedHashMap<Class<? extends AccessDeniedException>, AccessDeniedHandler>();
		handlers.put(InvalidCsrfTokenException.class, handler("/WEB-INF/views/common/error/invalidCsrfTokenError.jsp"));
		handlers.put(MissingCsrfTokenException.class, handler("/WEB-INF/views/common/error/invalidCsrfTokenError.jsp"));
		DelegatingAccessDeniedHandler handler = new DelegatingAccessDeniedHandler(handlers,
				handler(null));
		return handler;
	}
    
    @Bean
	AccessDeniedHandlerImpl handler(String errorPage) {
		AccessDeniedHandlerImpl handler = new EAccessDeniedHandler();//字定义无权限处理器
//		handler.setErrorPage(errorPage);
		return handler;
	}
    
  @Override
  protected void configure(HttpSecurity http) throws Exception {
	  
      	http.headers().frameOptions().disable();//允许iframe

    	 http
         .exceptionHandling().and()
//         .anonymous().and() //启用匿名认证
         .csrf().disable() // Disable Cross site references
         // Add CORS Filter 在ChannelProcessingFilter 过滤器之前 加入服务器http相关设置的过滤器 判断请求来源，是否允许
        .addFilterBefore(new CorsFilter(), ChannelProcessingFilter.class);
         // Custom Token based authentication based on the header previously given to the client 
          //在验证用户密码之前  基于以前给客户定制的基于令牌的身份验证头 去头部信息里面去用户登录的历史信息
//         .addFilterBefore(new VerifyTokenFilter(tokenUtil), UsernamePasswordAuthenticationFilter.class)
         // custom JSON based authentication by POST of {"username":"<name>","password":"<password>"} which sets the token header upon authentication
//         .addFilterBefore(new GenerateTokenForUserFilter ("/session", authenticationManager(), tokenUtil), UsernamePasswordAuthenticationFilter.class);
    	 //表达式拦截器 注册表
    	 ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry authorizeRequests = http
                 .authorizeRequests();
    	 
//    	 //没有权限如何做 authentication authentication 认证出入点
//    	 authorizeRequests.and().exceptionHandling().authenticationEntryPoint(new JwtAuthenticationEntryPoint(""));
   	 
    	 //拒绝访问
    	 authorizeRequests.and().exceptionHandling().accessDeniedHandler(accessDeniedHandler());

    
    	 //表达式处理程序
         authorizeRequests.expressionHandler(ewebSecurityExpressionHandler);//验证人员是否有权限的过滤器
         List<Resources> permissions=resourcesRepository.findAll();
         if (permissions != null && !permissions.isEmpty()) {
             for (Resources p :  permissions   ) {
                 authorizeRequests.antMatchers("/**/" + p.getUrl())
                         .access("hasPermission('','" + p.getCode() + "')");
             }
         }
         authorizeRequests.anyRequest().authenticated()//任何请求都需要鉴权
         .and().formLogin()
//         .successHandler(new AuthenticationSuccessHandler() {
//             @Override
//             public void onAuthenticationSuccess(HttpServletRequest request,
//                     HttpServletResponse response,
//                     Authentication authentication) throws IOException, ServletException {
//                 response.getWriter().print("{success}");
//
//             }
//         })
         .failureHandler(eauthenticationFailureHandler())
         .loginPage("/login").successForwardUrl("/index")
         .permitAll()
         .and()
         .logout()
         .permitAll();
   }
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/","/include", "/content/**", "/resources/**", "/js/**", "/base/**", "/static/**", "/public/**", "/webui/**", "/h2-console/**"
                , "/configuration/**", "/swagger-ui/**", "/swagger-resources/**", "/api-docs", "/api-docs/**", "/v2/api-docs/**"
                , "/*.html", "/**/*.html" ,"/**/*.css","/**/*.js","/**/*.png","/**/*.jpg", "/**/*.gif", "/**/*.svg", "/**/*.ico", "/**/*.ttf","/**/*.woff");
 //后面可以考虑从配置文件中读取     
//        if (settings != null) {
//            List<String> temp = settings.getIgnoreResources();
//            if (temp != null) {
//                ignoreResources.addAll(temp);
//            }
//        }
//        for (String s : Constants.DEFAULT_IGNORE_RESOURCES) {
//            ignoreResources.add(s);
//        }
//       String[] arr = new String[ignoreResources.size()];
//        arr = ignoreResources.toArray(arr);
//        web.ignoring().antMatchers(arr);
    }
    
    
	@Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
		.inMemoryAuthentication();
        auth.parentAuthenticationManager(authenticationManager);//ProviderManager实现authenticationManager 认证管理器
        auth.userDetailsService(zfcUserDetailsService).passwordEncoder(passwordEncoder);//设置密码处理方式//设置用户校验方式
    }
	
		@Bean
	    @ConditionalOnMissingBean
	    public PasswordEncoder passwordEncoder() {
	        return new StandardPasswordEncoder();
	    }
	
		
		@Bean
	    EDefaultWebSecurityExpressionHandler ewebSecurityExpressionHandler() {
	        EDefaultWebSecurityExpressionHandler webSecurityExpressionHandler = new EDefaultWebSecurityExpressionHandler();
	        return webSecurityExpressionHandler;
	    }
		
		 @Bean
		PermissionEvaluator permissionEvaluator() {
		        EPermissionEvaluator permissionEvaluator = new EPermissionEvaluator();
		        return permissionEvaluator;
		}
		 


		
		public static void main(String[] args) {
			System.out.println(new StandardPasswordEncoder().matches("12345","e28b558b485cf55f27d18082e466b86033bbdad6d03bcaabbbbcfe4791b7754eb153c91c5478e66d"));
		}
    
}