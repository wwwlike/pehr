package cn.blue.response;

import java.util.List;

import lombok.Data;
import cn.blue.item.Resources;

/**
 * 菜单返回的数据结构
 * @author Administrator
 *
 */
@Data
public class MenuResp {
	String moduleName;//模块名称
	String cls;//模块样式
	String mid;//模块id
	List<Resources> subs;
}
