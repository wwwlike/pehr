package cn.blue.item;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import cn.citms.core.bean.BaseBean;
/**
 * 字典表
 * @author donglc
 *
 */
@Entity
@Table(name="sys_select_class")
public class SelectClass  extends BaseBean{
	private static final long serialVersionUID = -2696604256237846768L;
	public String name;
	public String code;
	public Boolean open;//是否开放编辑新增

	
	public List<SelectDetail> details;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@OneToMany(mappedBy="selectClass",fetch=FetchType.EAGER,cascade=CascadeType.PERSIST)
	public List<SelectDetail> getDetails() {
		return details;
	}
	
	public void setDetails(List<SelectDetail> details) {
		this.details = details;
	}
	public Boolean getOpen() {
		return open;
	}
	public void setOpen(Boolean open) {
		this.open = open;
	}
	
		
}
