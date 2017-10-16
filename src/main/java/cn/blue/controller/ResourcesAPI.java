package cn.blue.controller;

import io.swagger.annotations.Api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import cn.blue.item.Srole;
import cn.blue.response.MenuResp;
import cn.blue.service.ResourcesService;
import cn.blue.service.RoleService;

@RestController
@RequestMapping(value = "/api/sys")
@Api(tags = { "sys" })
public class ResourcesAPI {
	@Autowired
	public RoleService roleService;
	
	@Autowired
	public ResourcesService resourcesService;
	
	@RequestMapping(value="/menu",method=RequestMethod.GET)
	public List<MenuResp> menu(String roleId){
		Srole role=roleService.find(roleId);
		return resourcesService.menuResource(role.getResources());
	}
	
	
	
}
