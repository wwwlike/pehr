package cn.blue.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Service;

import cn.blue.dao.ResourcesDao;
import cn.blue.item.Resources;
import cn.blue.response.MenuResp;
import cn.citms.core.bean.QueryProperties;
import cn.citms.core.service.BaseServiceImpl;
/**
 * 资源管理sesrvice
 * @author donglc
 *
 */
@Service
public class ResourcesService extends BaseServiceImpl<Resources, String, ResourcesDao> {

	
	
	
	/**
	 * 获得角色对应
	 * @param roleAll 角色里面的所有资源
	 * @return
	 */
	public  List<MenuResp> menuResource(List<Resources> allResourcesWithRole){
		//所有api的资源，提取出来module和menu
		
//		 List<Resources> all=new ArrayList<>();
//		Set<String> pcodeSet=new HashSet<>();
//		for(Resources resource:allResourcesWithRole){
//			if(pcodeSet.add(resource.getPcode())){
//				Resources menu=baseDao.findListByProperties(Resources.class, QueryProperties.prop("pcode", resource.getCode())).get(0);
//				all.add(menu);
//				if(pcodeSet.add(menu.getPcode())){
//					Resources module=baseDao.findListByProperties(Resources.class, QueryProperties.prop("pcode", resource.getCode())).get(0);
//					all.add(module);
//				}
//			}
//		}
//		return all;
		List<MenuResp> resp=new ArrayList<>();
		MenuResp module=null;
		for(Resources one: allResourcesWithRole){
			if(one.getResourcesType().equals("MODULE")){
				List<Resources> subs=new ArrayList<>();
				for(Resources sub: allResourcesWithRole){
					if(sub.getResourcesType().equals("MENU")&&sub.getPcode().equals(one.getCode())){
						subs.add(sub);
					}
				}
				if(subs.size()>0){
					module=new MenuResp();
					module.setCls(one.getCls());
					module.setModuleName(one.getName());
					module.setSubs(subs);
					module.setMid(one.getId());
					resp.add(module);
				}
			}
		}
		return resp;
	} 
	
	
	/**
	 * 获得角色对应
	 * @param 获得API资源
	 * @return
	 */
	public  List<MenuResp> roleAPIResource(List<Resources> allResourcesWithRole){
		List<MenuResp> resp=new ArrayList<>();
		MenuResp module=null;
		for(Resources one: allResourcesWithRole){
			if(one.getResourcesType().equals("MENU")){
				List<Resources> subs=new ArrayList<>();
				for(Resources sub: allResourcesWithRole){
					if(sub.getResourcesType().equals("API")&&sub.getPcode().equals(one.getCode())){
						subs.add(sub);
					}
				}
				if(subs.size()>0){
					module=new MenuResp();
					module.setCls(one.getCls());
					module.setModuleName(one.getName());
					module.setSubs(subs);
					resp.add(module);
				}
			}
		}
		return resp;
	} 
	
	
	public List<Resources> addModuleAndMenu(List<Resources> resources){
		List<Resources> all=new ArrayList<Resources>();
		Set<String> pcodeSet=new HashSet<>();
		for(Resources resource:resources){
			all.add(resource);
			if(pcodeSet.add(resource.getPcode())){
				Resources menu=baseDao.findListByProperties(Resources.class, QueryProperties.prop("code", resource.getPcode())).get(0);
				all.add(menu);
				if(pcodeSet.add(menu.getPcode())){
					Resources module=baseDao.findListByProperties(Resources.class, QueryProperties.prop("code", menu.getPcode())).get(0);
					all.add(module);
				}
			}
		}
		return all;
	}
	
	
	public List<MenuResp> setChecked(List<MenuResp>  all,List<Resources> selects){
		for(MenuResp resources:all){
			for(Resources subs:resources.getSubs()){
			boolean checked=false;
			for(Resources select:selects){
				if(subs.getId().equals(select.getId())){
					checked=true;
					break;
				}
			}
			subs.setChecked(checked);
			}
		}
		return all;
	}
	

}
