package cn.blue.security.response;

import lombok.EqualsAndHashCode;
import cn.citms.core.bean.Resp;

@EqualsAndHashCode(callSuper=false)
public class SessionResponse implements Resp {
 
  private SessionItem item;

public SessionItem getItem() {
	return item;
}

public void setItem(SessionItem item) {
	this.item = item;
}
  
  
}
