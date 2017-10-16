package cn.blue.security.fiter;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import cn.blue.item.User;
import cn.blue.security.SecurityUser;
import cn.blue.security.UserAuthentication;
import cn.blue.service.RoleService;
//校验token
@Service
public class TokenUtil {
	@Autowired
	private RoleService roleService; 
    //private static final long VALIDITY_TIME_MS = 10 * 24 * 60 * 60 * 1000;// 10 days Validity
    private static final long VALIDITY_TIME_MS =  24 * 60 * 60 * 1000; // 24 hours  validity
    private static final String AUTH_HEADER_NAME = "Authorization";

    private String secret="mrin";

    public Optional<Authentication> verifyToken(HttpServletRequest request) {
    	 // final String token = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0OTM4MzY0OTMsInN1YiI6ImFkbWluIiwidXNlcklkIjoiMSIsInJvbGUiOiIxIn0.dTC6Ng9KMd7O6Or30wWV_exXnenunyUE4sCPtLrEzj0";
      
    	 final String token;
    	 if(request.getHeader(AUTH_HEADER_NAME)==null){
//   		 token=request.getParameter("token")==null?"eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0OTU2OTU5OTAsInN1YiI6ImFkbWluIiwidXNlcklkIjoiMSIsInJvbGUiOiIxIn0.6weeIOgAeswK-Xq4FpiFOzveGCilVCgbi8iRQCMvf0M":request.getParameter("token");
     token=request.getParameter("token");
    	 }else{
    		 token=request.getHeader(AUTH_HEADER_NAME);
    	 }
      if (token != null && !token.isEmpty()){
        final SecurityUser user = parseUserFromToken(token.replace("Bearer","").trim());
        if (user != null) {
            return  Optional.of(new UserAuthentication(user));
        }
      }
      return Optional.empty();

    }

    //Get User Info from the Token
    public SecurityUser parseUserFromToken(String token){

        Claims claims = Jwts.parser()
            .setSigningKey(secret)
            .parseClaimsJws(token)
            .getBody();

        User user = new User();
        user.setId((String)claims.get("userId"));
        user.setSrole(roleService.find(claims.get("srole",String.class)));
        return new SecurityUser(user);
    }

    public String createTokenForUser(SecurityUser user) {
    	//根据用户信息生成token
        return Jwts.builder()
          .setExpiration(new Date(System.currentTimeMillis() + VALIDITY_TIME_MS))//过期时间
          .setSubject(user.getUsername())
          .claim("userId", user.getId())
          .claim("role",user.getSrole()==null?null:user.getSrole().getId())
          .signWith(SignatureAlgorithm.HS256, secret)
          .compact();
    }

   

}
