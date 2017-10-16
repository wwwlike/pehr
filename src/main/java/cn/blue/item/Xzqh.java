package cn.blue.item;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.citms.core.bean.BaseBean;

/**
 * 行政区划表
 * @author donglc
 *
 */
@Entity
@Table(name="P_XZQH")
public class Xzqh extends BaseBean implements ISpell,IState,IFivestrokes{
	public String areacode;
	public String rcmsareacode;//新农合行政区划代码
	public String areaname;
	public String spell;
	public String fivestrokes;
	public String customcode;//自定义编码
	public String parentareacode;//上级编码
	public String state;
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
	public String getState() {
		// TODO Auto-generated method stub
		return state;
	}
	@Override
	public void setState(String state) {
		// TODO Auto-generated method stub
		this.state=state;
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
}
