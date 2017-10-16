package cn.blue.tag;

import java.util.List;

import cn.blue.item.SelectDetail;
import cn.blue.service.SelectDetailService;

/**
 * sql查询
 * @author wwwlike
 *
 */
public class FormSelectDbTag extends FormSelectTag{
	
	private String classCode;
	private String schoolId;
	private String serviceName;
	private String lableField;
	private String valueField;
	private Boolean show;
	
	public FormSelectDbTag()
	{}
	public FormSelectDbTag( String name,String value) {
	
		this.name=name;
		this.value=value;
	}

	
	public void initialize() {
	        id = ToolKit.nullTrans(id,name);
	        
	        if(classCode!=null && options==null)
	            options = queryCustom(classCode);
	        
	        value = value!=null ? value : "";
	        options = options!=null ? options : new SelectOption[0];
	    }
	 
	
	    
	    /**
	     * 去custom根据key查询
	     * @param sql
	     * @return
	     */
	    private SelectOption[] queryCustom(String key) {
	    	List<SelectDetail> list =null;
	    	SelectDetailService selectDetailService=	(SelectDetailService)this.getRequestContext().getWebApplicationContext().getBean("selectDetailService");
			if(schoolId!=null){
				list=selectDetailService.findByJpql("from SelectDetail where selectClass.code=? and (school.id=null or school.id=?) order by sort ",key,schoolId);
			}else{
				list=selectDetailService.findByJpql("from SelectDetail where selectClass.code=? order by sort ",key);
			}
			
	        SelectOption[] ops = null;
	        try {
	        	int size=(list==null)?0:list.size();
	        	ops = new SelectOption[size];
	        	int i=0;
	        	if(size>0){
	        	for(SelectDetail detail:list) {
	        		ops[i] = new SelectOption();
	        		ops[i].value =detail.getValue();
	        		ops[i].name =detail.getLabel();
	        		i++;
	        	}}
	        }catch(Exception e){
	        	e.printStackTrace();
	        }
	        return ops;
	    }
	
	    
	

	    public String getSelectStr(){
	        initialize();
	        StringBuffer sb = new StringBuffer();
	        try{
	           
	            //如果不为只读状态
	            if(!readonly) {
	                sb.append("<select name=\""+name+"\" id='"+id+"'");
	                if(disabled)
	                    sb.append(" disabled");
	                if(!ToolKit.isnull(css))
	                    sb.append(" class='"+css+"'");
	                if(!ToolKit.isnull(style))
	                	sb.append(" style='"+style+"'");
	                if(!ToolKit.isnull(inputForm))
	                	sb.append(" inputForm='"+inputForm+"'");
	                
	                if(!ToolKit.isnull(onchange))
	                	sb.append(" onchange=\""+onchange+"\"");
	                sb.append(">\n");
	                if(ToolKit.isnull(value))
	                    sb.append("<option value='' selected>请选择</option>\n");
	                else if (showBlank)
	                    sb.append("<option value=''>--请选择--</option>\n");
	                for(int i=0;i<options.length;i++){
	                    SelectOption op = options[i];
	                    if(value!=null && value.equals(op.value))
	                        sb.append("<option value='"+op.value+"' selected>"+op.name+"</option>\n");
	                    else
	                        sb.append("<option value='"+op.value+"'>"+op.name+"</option>\n");
	                }
	                sb.append("</select>");
	            }
	            else {
	                sb.append("<input type='hidden' id='"+id+"' name='"+name+"' value='"+value+"'/>");
	                for(int i=0;i<options.length;i++){
	                    SelectOption op = options[i];
	                	if(value!=null && value.equals(op.value)) {
	                		sb.append(op.name);
	                		break;
	                	}
	                }
	            }
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	        return sb.toString();
	    }
		public void setClassCode(String classCode) {
			this.classCode = classCode;
		}
		public String getServiceName() {
			return serviceName;
		}
		public void setServiceName(String serviceName) {
			this.serviceName = serviceName;
		}
		
		public String getValueField() {
			return valueField;
		}
		public void setValueField(String valueField) {
			this.valueField = valueField;
		}
		public String getLableField() {
			return lableField;
		}
		public void setLableField(String lableField) {
			this.lableField = lableField;
		}
		public String getClassCode() {
			return classCode;
		}
		public Boolean getShow() {
			return show;
		}
		public void setShow(Boolean show) {
			this.show = show;
		}
		public String getSchoolId() {
			return schoolId;
		}
		public void setSchoolId(String schoolId) {
			this.schoolId = schoolId;
		}
		
	
	
	
	

}
