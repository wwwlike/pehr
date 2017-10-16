package cn.blue.controller;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;

import cn.blue.security.SecurityUser;
import cn.citms.core.bean.BaseBean;

public  class BaseAPI <T extends BaseBean> {
	
	public T bean;

	/**
	 * 获得当前登录用户
	 * @return
	 */
	public SecurityUser getCurrUser(){
		UsernamePasswordAuthenticationToken auth = (UsernamePasswordAuthenticationToken)SecurityContextHolder.getContext().getAuthentication();//获得当前用户
    	return (SecurityUser)auth.getPrincipal();
	}
	
	public String go(String page){
		String type=bean.getClass().getName();
		
		return "/"+type+"/"+type+"_"+page;
		
	}
}
