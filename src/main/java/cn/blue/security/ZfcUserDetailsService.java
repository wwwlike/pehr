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

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import cn.blue.common.Constants;
import cn.blue.item.User;
import cn.blue.service.UserService;
import cn.citms.core.bean.QueryProperties;

@Component
public class ZfcUserDetailsService implements UserDetailsService {

    @Autowired
    UserService userService;
    
    @SuppressWarnings({ "rawtypes", "unchecked"})
    public ZfcUserDetailsService(){
        
    }
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        if (StringUtils.isEmpty(username)) {
            return null;
        }
       List<User> result= userService.findListByProperties(QueryProperties.prop("username", username));
       if(result==null||result.size()==0){
    	   result= userService.findListByProperties(QueryProperties.prop("email", username));
       }
       if(result==null||result.size()==0){
    	   result= userService.findListByProperties(QueryProperties.prop("phoneNum", username));
       }
       
       if(result!=null&&result.size()>0&&!result.get(0).getState().equals(Constants.STATUS_NORMAL)){
    	   throw new UsernameNotFoundException("用户名已经停用");
       }
       
       if (result != null&&result.size()>0) {
    	   try {
			
		
        	return new SecurityUser(result.get(0)); //code9
        	
    	   } catch (Exception e) {
   			e.printStackTrace();
   		}
       }
       
       if(result==null||result.size()==0){
    	   throw new UsernameNotFoundException("用户名不存在");
       }
       return null;
    }

}
