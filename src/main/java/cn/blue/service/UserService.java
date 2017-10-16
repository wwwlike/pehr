package cn.blue.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.blue.common.Constants;
import cn.blue.dao.UserDao;
import cn.blue.item.User;
import cn.citms.core.service.BaseServiceImpl;
/**
 * 用户sesrvice
 * @author donglc
 *
 */
@Service
public class UserService extends BaseServiceImpl<User, String, UserDao> {
	
	
	public List<User> findSchoolUsers(String schoolId){
		return baseDao.findByJpql(User.class, "from User where school.id=? and status=?", schoolId,Constants.STATUS_NORMAL);
	}

}
