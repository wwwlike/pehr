package cn.blue.item;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import cn.citms.core.bean.BaseBean;
/**
 * 用户信息
 * @author donglc
 */
@Entity
@Table(name="p_user")
public class User extends BaseBean implements IName,IState,ISpell,IFivestrokes,IUnitcode,IArea{

	private static final long serialVersionUID = -3964414132035104698L;
	
	public String phoneNum;
	public String phoneId;
	public Date  lastLogin;
	public String email;
	public String password;
	public Srole srole; //角色
	public Boolean system;//是否系统不可删除
	public String name;
	public String username;
//	public String status;
	public String state;
	public String spell;
	public String unitcode;
	public String cityAreacode;
	public String countyAreacode;
	public String fivestrokes;
	
	
	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getPhoneId() {
		return phoneId;
	}

	public void setPhoneId(String phoneId) {
		this.phoneId = phoneId;
	}

	public Date getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

//	public String getStatus() {
//		return status;
//	}
//
//	public void setStatus(String status) {
//		this.status = status;
//	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@ManyToOne(fetch=FetchType.EAGER,cascade=CascadeType.PERSIST)
	public Srole getSrole() {
		return srole;
	}

	public void setSrole(Srole srole) {
		this.srole = srole;
	}
	
	public Boolean getSystem() {
		return system;
	}

	public void setSystem(Boolean system) {
		this.system = system;
	}

	@Override
	public String getCityAreacode() {
		// TODO Auto-generated method stub
		return cityAreacode;
	}

	@Override
	public void setCityAreacode(String cityAreacode) {
		this.cityAreacode=cityAreacode;
		
	}

	@Override
	public String getCountyAreacode() {
		return countyAreacode;
	}

	@Override
	public void setCountyAreacode(String countyAreacode) {
		this.countyAreacode=countyAreacode;
	}

	@Override
	public String getUnitcode() {
		// TODO Auto-generated method stub
		return unitcode;
	}

	@Override
	public String setUnitcode(String unitcode) {
		// TODO Auto-generated method stub
		return this.unitcode=unitcode;
	}

	@Override
	public String getFivestrokes() {
		// TODO Auto-generated method stub
		return fivestrokes;
	}

	@Override
	public void setFivestrokes(String fivestrokes) {
		// TODO Auto-generated method stub
		this.fivestrokes=fivestrokes;
	}

	@Override
	public String getSpell() {
		// TODO Auto-generated method stub
		return spell;
	}

	@Override
	public void setSpell(String spell) {
		// TODO Auto-generated method stub
		this.spell=spell;
		
	}

	@Override
	public String getState() {
		// TODO Auto-generated method stub
		return state;
	}

	@Override
	public void setState(String state) {
		// TODO Auto-generated method stub
		this.state=state;
	}
	
}
