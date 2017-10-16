package cn.blue.controller;
import static cn.blue.common.Constants.INPUT;
import static cn.blue.common.Constants.LIST;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.blue.item.Resources;
import cn.blue.item.User;
import cn.blue.security.SecurityUser;
import cn.blue.security.response.SessionResponse;
import cn.blue.service.RoleService;
import cn.blue.service.UserService;
import cn.citms.base.exception.Rre;
import cn.citms.base.response.OperationResponse;
@RequestMapping(value = "/user")
@Controller
public class UserAPI extends BaseBeanController<User,UserService> {

	@Autowired
	public RoleService roleService;
	
	@RequestMapping(value="/self",method=RequestMethod.GET)
	public  List<Resources>  selfResources(){
		SecurityUser user=getCurrUser();
		return user.getSrole().getResources();
	}
	
	@RequestMapping(value = "/session", method = RequestMethod.POST)
	public SessionResponse newSession(String username, String password, HttpServletRequest request,
			HttpServletResponse response) {
		return null;
	}
	
	//获得当前人员可以看到的人员信息列表
	@RequestMapping(value = "/list")
	public String list(ModelMap map){
		SecurityUser user=getCurrUser();
		//map.addAttribute("list", users);
		return go(LIST);
//		return "/user/list";
	}
	
	//获得当前人员可以看到的人员信息列表
	@RequestMapping(value = "/input")
	public String input(ModelMap map,String id){
		SecurityUser user=getCurrUser();
		//1取所有学校可用的
		//2取所有角色可用的
		map.addAttribute("roles", roleService.getUserRoles(user));
		if(id!=null){
			map.addAttribute("bean", service.find(id));
		}
		return go(INPUT);
	}
	
	
	@RequestMapping(value = "/save")
	@ResponseBody
	public ResponseEntity<?> save(User user){
		if(user.getSrole()!=null&&user.getSrole().getId()!=null){
			user.setSrole(roleService.find(user.getSrole().getId()));
		}
		if(!checkOnly("username", user.getUsername(), user.getId()).getBody()){
			return ResponseEntity.ok(OperationResponse.rre(Rre.RULE_ERROR,"username is not only","用户名不是唯一"));
		}
		
		if(!checkOnly("email", user.getEmail(), user.getId()).getBody()){
			return ResponseEntity.ok(OperationResponse.rre(Rre.RULE_ERROR,"email is not only","电子邮箱不是唯一"));
		}
		
		if(!checkOnly("phoneNum", user.getPhoneNum(), user.getId()).getBody()){
			return ResponseEntity.ok(OperationResponse.rre(Rre.RULE_ERROR,"email is not only","联系电话不是唯一"));
		}
		
		if(user.getId()==null){
			user.setSystem(false);
			user.setPassword(new StandardPasswordEncoder().encode("12345"));
			saveEntity(user);
		}else{
			service.update(user,"password","createId","createDate","system","lastLogin","status");
		}
		
		
		
		return ResponseEntity.ok(OperationResponse.rre(user));
	}
	
	
}
