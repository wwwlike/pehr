package cn.blue.item;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import cn.citms.core.bean.BaseBean;
@Entity
@Table(name="sys_select_detail")
public class SelectDetail extends BaseBean implements IStatus{
	private static final long serialVersionUID = 8967564661701554904L;
	public String label; //选项显示中文
	public String value; //选项value
	public Integer sort;//选项排序
	public String status;
	@JsonIgnore
	public SelectClass selectClass;//字典选项创建校区
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	@JsonIgnore
	@ManyToOne(cascade=CascadeType.PERSIST,fetch=FetchType.EAGER)
	public SelectClass getSelectClass() {
		return selectClass;
	}
	public void setSelectClass(SelectClass selectClass) {
		this.selectClass = selectClass;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
