package cn.blue.tag;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import cn.blue.item.SelectDetail;
import cn.blue.sys.service.SelectClassService;
import cn.blue.sys.service.SelectDetailService;
@Service
public class CustomLabelTag extends RequestContextAwareTag{
	
	@Autowired
	public SelectClassService selectClassService;
	
	@Autowired
	public SelectDetailService selectDetailService;
	
    protected String key;
	protected String value;
	//是否是多个值
	private Boolean multiple;

	@Override
	protected int doStartTagInternal() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	/*每次去库取，影响性能
	 * (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.TagSupport#doEndTag()
	 */
	public int doEndTag(){
		selectDetailService=	(SelectDetailService)this.getRequestContext().getWebApplicationContext().getBean("selectDetailService");
		String result = "";
		StringBuffer sb =new StringBuffer();
			List<SelectDetail> list=new ArrayList<SelectDetail>();
			if(multiple!=null && multiple){
				String[] args = value.split(",");
				for (String string : args) {
					list.addAll(selectDetailService.findByJpql("from SelectDetail where value =? and selectClass.code=? ", string,key));
				}
				
			}else{
				list = selectDetailService.findByJpql("from SelectDetail where value=? and selectClass.code=? ", value,key);
			}
			if(list!=null&&list.size()>0){
				if(multiple!=null && multiple){
					for (SelectDetail selectDetail : list) {
						sb.append(selectDetail.getLabel()).append(",");
					}
				}else{
					result = list.get(0).getLabel();
				}
			}
			if(sb!=null && sb.toString().indexOf(",")>-1){
				result = sb.toString().substring(0, sb.toString().length()-1);
			}
		JspWriter out =null;
		 try {
			 out= pageContext.getOut();
			 out.print(result);
				
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		  return EVAL_PAGE;
	  }

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Boolean getMultiple() {
		return multiple;
	}

	public void setMultiple(Boolean multiple) {
		this.multiple = multiple;
	}
	
}
