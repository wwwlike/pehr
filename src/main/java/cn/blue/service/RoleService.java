package cn.blue.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.blue.dao.RoleDao;
import cn.blue.item.Srole;
import cn.blue.item.User;
import cn.citms.core.service.BaseServiceImpl;
/**
 * 角色sesrvice
 * @author donglc
 *
 */
@Service
public class RoleService extends BaseServiceImpl<Srole, String, RoleDao> {
	
	/**
	 * 获得用户角色下可以看到的所有角色，
	 * @param role
	 * @return
	 */
	public List<Srole> getUserRoles(User user){
		Srole role=user.getSrole();
			String jpql="from Role where school is null and level>=?";
			return baseDao.findJpql(Srole.class,jpql, role.getLevel());
	}

}
