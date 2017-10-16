package cn.blue.item;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import cn.citms.core.bean.BaseBean;

import com.fasterxml.jackson.annotation.JsonIgnore;
/**
 * 资源管理
 * @author donglc
 *
 */
@Entity
@Table(name="sys_resources")
public class Resources extends BaseBean{

	private static final long serialVersionUID = -2496930061122419988L;
	
	public String name;//名称
	public String resourcesType;//资源类型
	public String code;//资源代码
	public String url;
	public String cls;//样式
	public String pcode;//上级资源
	public Integer sort;//排序
	
	public boolean checked;

	@Transient
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
	
	@JsonIgnore
	public  List<Srole> sroles;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getResourcesType() {
		return resourcesType;
	}
	public void setResourcesType(String resourcesType) {
		this.resourcesType = resourcesType;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getCls() {
		return cls;
	}
	public void setCls(String cls) {
		this.cls = cls;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	
	@ManyToMany(fetch=FetchType.EAGER,mappedBy="resources",cascade=CascadeType.PERSIST)
	public List<Srole> getSroles() {
		return sroles;
	}
	public void setSroles(List<Srole> sroles) {
		this.sroles = sroles;
	}
	
	
	
	
}
