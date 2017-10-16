package cn.blue.security;

import java.util.ArrayList;
import java.util.Collection;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import cn.blue.item.Srole;
import cn.blue.item.User;

public class SecurityUser extends User implements UserDetails
{

	private static final long serialVersionUID = 1L;
	private User sUser;
	public User getUser(){
		return sUser;
	}
	public SecurityUser(User suser){
		if(suser != null)
		{
			this.sUser=suser;
			try {
				BeanUtils.copyProperties(this, suser);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
//			this.setId(suser.getId());
//			this.setUsername(suser.getUsername());
//			this.setEmail(suser.getEmail());
//			this.setPassword(suser.getPassword());
//			this.setRole(suser.getRole());
//			this.setSystem(suser.getSystem());
//			this.setStatus(suer.get);
		}		
	}
	
	//增加角色集合
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		Srole role = this.getSrole();
		if(role != null){
				SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role.getId());
				authorities.add(authority);
		}
		return authorities;
	}

	@Override
	public String getPassword() {
		return super.getPassword();
	}

	@Override
	public String getUsername() {
		return this.username;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
	
}
