package cn.blue.controller;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;

import cn.blue.security.SecurityUser;

public class BaseController {


	/**
	 * 获得当前登录用户
	 * @return
	 */
	public SecurityUser getCurrUser(){
		UsernamePasswordAuthenticationToken auth = (UsernamePasswordAuthenticationToken)SecurityContextHolder.getContext().getAuthentication();//获得当前用户
    	return (SecurityUser)auth.getPrincipal();
	}
	
}
