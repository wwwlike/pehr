package cn.blue.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.blue.item.Resources;
import cn.blue.item.Srole;
import cn.blue.response.MenuResp;
import cn.blue.security.SecurityUser;
import cn.blue.service.ResourcesService;
import cn.blue.service.RoleService;
import cn.citms.base.exception.Rre;
import cn.citms.base.response.OperationResponse;
import static cn.blue.common.Constants.*;

@Controller
@RequestMapping("/role")
public class RoleAPI extends BaseBeanController<Srole,RoleService>{
	
	@Autowired
	ResourcesService  resourcesService;
	
	
	@RequestMapping(value = "/list")
	public String list(ModelMap model){
		model.addAttribute(LIST, service.getUserRoles(getCurrUser()));
		return go(LIST);
	}
	
	@RequestMapping(value = "/input")
	public String input(ModelMap model,String id){
		SecurityUser user=getCurrUser();
    	Srole role=user.getSrole();
		List<MenuResp> mennuResp= resourcesService.roleAPIResource(role.getLevel()==1?resourcesService.findAll():role.getResources());
		if(id!=null){
			model.addAttribute("bean", service.find(id));
			mennuResp=resourcesService.setChecked(mennuResp,service.find(id).getResources());
		}
		model.addAttribute("resources",mennuResp);
		return go(INPUT);
	}
	
	@RequestMapping(value = "/save")
	@ResponseBody
	public ResponseEntity<OperationResponse> save(Srole role){
		
		List<Resources> list=resourcesService.findList(role.getIds());
		list=resourcesService.addModuleAndMenu(list);
		role.setResources(list);
		if(role.getId()==null){
			role.setLevel(getCurrUser().getSrole().getLevel()+1);
			//role.setSchool(getCurrUser().getSchool());
			saveEntity(role);
		}else{
			service.update(role, "school","system","level","status","createId","createDate");
		}
		return ResponseEntity.ok(OperationResponse.rre(role));
	}
	
}
