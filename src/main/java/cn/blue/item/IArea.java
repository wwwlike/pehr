package cn.blue.item;
/**
 * 地区接口
 * @author Administrator
 *
 */
public interface IArea {

	//省市行政编码
	public String getCityAreacode();
	public void setCityAreacode(String cityAreacode);
	//区县行政编码
	public String getCountyAreacode();
	public void setCountyAreacode(String countyAreacode);
}
