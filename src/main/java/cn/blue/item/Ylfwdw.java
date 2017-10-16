package cn.blue.item;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import cn.citms.core.bean.BaseBean;


/**
 * @category 医疗服务单位
 * @author donglc
 */
@Entity
@Table(name="P_YLFWDW")
public class Ylfwdw extends BaseBean implements ISpell,IState,IFivestrokes {
	private static final long serialVersionUID = 1L;

	private String account;

	private String address;

	private String areacode;

	private String cacbank;

	@Column(name="CITY_AREACODE")
	private String cityAreacode;

	@Column(name="COUNTY_AREACODE")
	private String countyAreacode;

	private String fivestrokes;

	private String grade;

	@Temporal(TemporalType.DATE)
	private Date lastedittime;

	private String linkman;

	private String orgcard;

	private String orgcode;

	private String orgkind;

	private String orgname;

	private String orgtype;

	private BigDecimal printorder;

	private String qkid;

	private String spell;

	private String staareacode;

	@Column(name="\"STATE\"")
	private String state;

	private String telphone;

	private String vhareacode;

	public Ylfwdw() {
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAreacode() {
		return this.areacode;
	}

	public void setAreacode(String areacode) {
		this.areacode = areacode;
	}

	public String getCacbank() {
		return this.cacbank;
	}

	public void setCacbank(String cacbank) {
		this.cacbank = cacbank;
	}

	public String getCityAreacode() {
		return this.cityAreacode;
	}

	public void setCityAreacode(String cityAreacode) {
		this.cityAreacode = cityAreacode;
	}

	public String getCountyAreacode() {
		return this.countyAreacode;
	}

	public void setCountyAreacode(String countyAreacode) {
		this.countyAreacode = countyAreacode;
	}

	public String getFivestrokes() {
		return this.fivestrokes;
	}

	public void setFivestrokes(String fivestrokes) {
		this.fivestrokes = fivestrokes;
	}

	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Date getLastedittime() {
		return this.lastedittime;
	}

	public void setLastedittime(Date lastedittime) {
		this.lastedittime = lastedittime;
	}

	public String getLinkman() {
		return this.linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getOrgcard() {
		return this.orgcard;
	}

	public void setOrgcard(String orgcard) {
		this.orgcard = orgcard;
	}

	public String getOrgcode() {
		return this.orgcode;
	}

	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}

	public String getOrgkind() {
		return this.orgkind;
	}

	public void setOrgkind(String orgkind) {
		this.orgkind = orgkind;
	}

	public String getOrgname() {
		return this.orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getOrgtype() {
		return this.orgtype;
	}

	public void setOrgtype(String orgtype) {
		this.orgtype = orgtype;
	}

	public BigDecimal getPrintorder() {
		return this.printorder;
	}

	public void setPrintorder(BigDecimal printorder) {
		this.printorder = printorder;
	}

	public String getQkid() {
		return this.qkid;
	}

	public void setQkid(String qkid) {
		this.qkid = qkid;
	}

	public String getSpell() {
		return this.spell;
	}

	public void setSpell(String spell) {
		this.spell = spell;
	}

	public String getStaareacode() {
		return this.staareacode;
	}

	public void setStaareacode(String staareacode) {
		this.staareacode = staareacode;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getTelphone() {
		return this.telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	public String getVhareacode() {
		return this.vhareacode;
	}

	public void setVhareacode(String vhareacode) {
		this.vhareacode = vhareacode;
	}

}