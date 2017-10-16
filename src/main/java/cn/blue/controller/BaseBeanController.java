package cn.blue.controller;

import static cn.blue.common.Constants.INPUT;
import static cn.blue.common.Constants.STATUS;
import static cn.blue.common.Constants.STATUS_NORMAL;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.blue.common.GenericsUtils;
import cn.blue.item.IStatus;
import cn.blue.utils.ReflectionUtils;
import cn.citms.base.response.OperationResponse;
import cn.citms.core.bean.BaseBean;
import cn.citms.core.service.BaseService;
import cn.citms.core.util.BeanUtils;

public abstract class BaseBeanController <T extends BaseBean,S extends BaseService<T, String>> extends BaseController {
	
	public T bean;
	@Autowired
	public S service;
	
	

	public String go(String page){
		Class clazz=ReflectionUtils.getSuperClassGenricType(this.getClass(), 0);
		String type=clazz.getSimpleName().substring(0,1).toLowerCase()+clazz.getSimpleName().substring(1);
		return "/"+type+"/"+type+"_"+page;
	}
	
	@RequestMapping(value = "/getAll")
	@ResponseBody
	public List<T> getAll(){
		if(GenericsUtils.getSuperClassGenricType(this.getClass(), 0).isInstance(IStatus.class)){
			return service.getList("status", STATUS_NORMAL);
		}
		return service.findAll();
	}
	public T saveEntity(T t){
		t.setCreateDate(new Date());
		t.setCreateId(getCurrUser().getId());
		if(IStatus.class.isInstance(t)){
			if(ReflectionUtils.invokeGetterMethod(t,STATUS)==null){//不为空才设置值
				ReflectionUtils.invokeSetterMethod(t,STATUS,STATUS_NORMAL);
			}
		}
		service.save(t);
		return t;
	}
	
	public String input(ModelMap map,String id){
		if(id!=null){
			map.addAttribute("bean", service.find(id));
		}
		return go(INPUT);
	}
	
	
	//只更新有值的字段;没有初始化则更新
	@RequestMapping(value = "/update")
	@ResponseBody
	public ResponseEntity<OperationResponse> update(T bean) throws IllegalAccessException, InvocationTargetException {
		T db=null;
		if(bean.getId()!=null){
			db=service.find(bean.getId());
			BeanUtils.copyProperties(db, bean, true);
			db=service.update(db);
		}else{
			service.save(bean);
			db=bean;
		}
		return ResponseEntity.ok(OperationResponse.rre(db));
	}
	
	/**
	 * 检查是否唯一
	 * @param key
	 * @param value
	 * @return
	 */
	@RequestMapping(value = "/checkOnly")
	@ResponseBody
	public ResponseEntity<Boolean> checkOnly(String key,String value,String id){
		if(id!=null&&!"".equals(id)){
			bean=service.find(id);
			if(bean!=null){
				if(value.equals(ReflectionUtils.invokeGetterMethod(bean,key))){
					return ResponseEntity.ok(true);
				}
			}
		}
		List list=service.getList(key, value);
		
		return ResponseEntity.ok(service.getList(key, value).size()==0);
	}
	
	
	/**
	 * 更改状态
	 * @return
	 */
	@RequestMapping(value = "/changeStatus")
	@ResponseBody
	public ResponseEntity<T> changeStatus(String id,String value){
		bean=service.find(id);
		if(IStatus.class.isInstance(bean)){
			ReflectionUtils.invokeSetterMethod(bean,"status",value);
			service.save(bean);
		}
		return ResponseEntity.ok(bean);
	}
	
	/**
	 * 更改状态
	 * @return
	 */
	@RequestMapping(value = "/delete")
	@ResponseBody
	public ResponseEntity<T> delete(String id){
		service.delete(id);
		return ResponseEntity.ok(service.find(id));
	}
}
