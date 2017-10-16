package cn.blue.item;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import cn.citms.core.bean.BaseBean;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="sys_role")
public class Srole extends BaseBean 	{
	
	private static final long serialVersionUID = -7355700586191276445L;
	public String name;
	public String text;//角色说明
	public Boolean system;//是否系统自带的不能删除
	public Integer level;//角色等级，用户只能查看当前级别以下角色
	public Boolean schoolUse;//是否给学校使用

	@JsonIgnore
	public Set<User> users;
	
	public String []ids;
	
	@JsonIgnore
	public List<Resources> resources;//资源
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@ManyToMany(fetch=FetchType.EAGER,cascade=CascadeType.PERSIST)
	public List<Resources> getResources() {
		return resources;
	}
	public void setResources(List<Resources> resources) {
		this.resources = resources;
	}
	public Boolean getSystem() {
		return system;
	}
	public void setSystem(Boolean system) {
		this.system = system;
	}
	@Column(name="role_level")
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Boolean getSchoolUse() {
		return schoolUse;
	}
	public void setSchoolUse(Boolean schoolUse) {
		this.schoolUse = schoolUse;
	}
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="srole",cascade=CascadeType.PERSIST )
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	
	@Transient 
	public String[] getIds() {
		return ids;
	}
	public void setIds(String[] ids) {
		this.ids = ids;
	}
}
