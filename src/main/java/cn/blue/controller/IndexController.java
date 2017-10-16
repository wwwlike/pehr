package cn.blue.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.blue.item.Srole;
import cn.blue.response.MenuResp;
import cn.blue.security.SecurityUser;
import cn.blue.service.ResourcesService;

@Controller
class IndexController extends BaseController {

    @RequestMapping("/login")
    public String login() {
    	 return "login";
    }
    
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request,HttpServletResponse response) {
    	  Authentication auth = SecurityContextHolder.getContext().getAuthentication();  
    	  if (auth != null){      
    	        new SecurityContextLogoutHandler().logout(request, response, auth);  
    	  }  
    	  return "login";
    }
    
    
    @Autowired
    public ResourcesService resourceService;
   
    /**
     * 进入首页 
     * @return
     */
    @RequestMapping("/index")
    public String index(ModelMap model,String id) {
    	SecurityUser user=getCurrUser();
    	Srole role=user.getSrole();
    	if(role!=null){
	    	List<MenuResp> menus=resourceService.menuResource((user.getSystem()!=null&&user.getSystem()&&role.getLevel()==1)?resourceService.findAll():role.getResources());
	    	if(id==null){
	    		id=menus.get(0).getMid();
	    	}
	    	model.addAttribute("mid",id);
	    	model.addAttribute("menus", menus);
    	}
    	return "/index2";
    }
    
    /**
     * 进入首页 
     * @return
     */
    @RequestMapping("/include")
    public String include() {
    	return "include";
    }


}