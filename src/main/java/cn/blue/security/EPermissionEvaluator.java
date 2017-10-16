/*
 * Copyright   Loy Fu. 付厚俊
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/
package cn.blue.security;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.PermissionEvaluator;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

import cn.blue.dao.ResourcesDao;
import cn.blue.item.Resources;
import cn.blue.item.Srole;
import cn.blue.service.RoleService;
import cn.citms.core.bean.QueryProperties;
/**
 * 权限校验类
 * @author Administrator
 *
 */
public class EPermissionEvaluator implements PermissionEvaluator {

    @Autowired(required = false)
    ResourcesDao resourcesRepository;
    
    @Autowired(required = false)
    RoleService roleService;
    
    
    public static Map<String ,List<String>> resourceRoleMap=new HashMap<>();
    
    public static List<Srole> allRoles=null;
    
    public static Map<String ,List<Resources>> resourceMapping=new HashMap<>();

    @Override
    public boolean hasPermission(Authentication authentication,
            Object targetDomainObject,
            Object permission) {
        return this.hasPermission(authentication, permission);
    }

    @Override
    public boolean hasPermission(Authentication authentication,
            Serializable targetId,
            String targetType,
            Object permission) {
        return true;
    }

    private boolean hasPermission(Authentication authentication, Object permission) {
        String perm = (String) permission;
        if(authentication.getClass()==AnonymousAuthenticationToken.class){
        	return false;//匿名用户无权限
        }
        if(authentication!=null&&authentication.getPrincipal()!=null){
        	UsernamePasswordAuthenticationToken user =(UsernamePasswordAuthenticationToken)authentication;
        	if(((SecurityUser)user.getPrincipal()).getSystem()!=null&&((SecurityUser)user.getPrincipal()).getSystem()==true){
        		return true;//超级管理员啥事都能做
        	}
        }

        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        if (authorities == null || authorities.isEmpty()) {
            return false;
        }
        List<Resources> resourcesList=null;
        if(resourceMapping.get(perm)==null){
        	resourcesList=resourcesRepository.findListByProperties(Resources.class,QueryProperties.prop("code", perm));
        	resourceMapping.put(perm,resourcesList);
        }else{
        	resourcesList=resourceMapping.get(perm);
        }
        List<String> names=null;
        
        if(allRoles==null)
        	allRoles=roleService.findAll();
        
//        查询资源对应的角色
        for(Resources a:resourcesList){
        		names=new ArrayList<String>();
        	 if(resourceRoleMap.get(a.getCode())==null){
        		for(Srole role:allRoles){
        			if(role.getResources().contains(a)){
        				names.add(role.getId());
        			}
            	}
        		resourceRoleMap.put(a.getCode(), names);
        	 }else{
        		 names=resourceRoleMap.get(a.getCode());
        	 }
        	
        	  for (GrantedAuthority authority : authorities) {
                  if (names.contains(authority.getAuthority())) {
                      return true;
                  }
              }
        	
        }
        
        //资源没有关联任何角色
        if (names == null || names.isEmpty()) {
            return false;
        }
//
      
        return false;
    }

}
