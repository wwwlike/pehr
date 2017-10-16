package cn.blue.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.blue.item.SelectClass;
import cn.blue.service.SelectClassService;
import cn.blue.service.SelectDetailService;
/**
 * 字典管理
 * @author donglc
 *
 */
@RequestMapping(value = "/selectClass")
@Controller
public class SelectClassAPI extends BaseBeanController<SelectClass,SelectClassService> {
	
	@Autowired
	public SelectDetailService selectDetailService;
	
	
}
