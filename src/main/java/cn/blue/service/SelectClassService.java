package cn.blue.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.blue.dao.SelectClassDao;
import cn.blue.item.SelectClass;
import cn.blue.item.User;
import cn.citms.core.service.BaseServiceImpl;
/**
 * 字典
 * @author donglc
 *
 */
@Service
public class SelectClassService extends BaseServiceImpl<SelectClass, String, SelectClassDao> {
	
	
	/**
	 * 获得所有专业
	 * @return
	 */
	public List<SelectClass> getAllSelectClass(User user){
		return baseDao.findByJpql(SelectClass.class, "from  SelectClass where open=true");
	}

}
