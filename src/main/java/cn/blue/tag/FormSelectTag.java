package cn.blue.tag;
import javax.servlet.jsp.JspWriter;

/**
 * 
 * @author donglc
 * @CreateDate 2007-12-14
 */
public class FormSelectTag extends FormTag {
	
    protected boolean showBlank = true;	//some times we need a blank value
    protected String blankLabel ="请选择";
    protected String optionString;	//option string
    protected String inputForm;

    
    public void initialize() {
        id = ToolKit.nullTrans(id,name);
        if(optionString!=null && options==null)
            options = SelectOption.parse(optionString);
        value = value!=null ? value : "";
        options = options!=null ? options : new SelectOption[0];
    }
    
    public void cleanUp() {
	    super.cleanUp();
	    this.optionString = null;
	}
    
    public int doEndTag(){
        initialize();
        try{
            StringBuffer sb = new StringBuffer();
            //如果不为只读状态
            if(!readonly) {
                sb.append("<select name='"+name+"' id='"+id+"'");
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
                    sb.append("<option value='' selected>"+blankLabel+"</option>\n");
                else if (showBlank)
                    sb.append("<option value=''>"+blankLabel+"</option>\n");
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
            JspWriter out = pageContext.getOut();
            out.print(sb.toString());
        }catch(Exception e){
            e.printStackTrace();
        }
        cleanUp();
        return EVAL_PAGE;
    }
    
    public String getOptionString() {
        return optionString;
    }
    public void setOptionString(String optionString) {
        this.optionString = optionString;
    }
    public boolean isShowBlank() {
        return showBlank;
    }
    public void setShowBlank(boolean showBlank) {
        this.showBlank = showBlank;
    }
	public String getBlankLabel() {
		return blankLabel;
	}
	public void setBlankLabel(String blankLabel) {
		this.blankLabel = blankLabel;
	}

	public String getInputForm() {
		return inputForm;
	}

	public void setInputForm(String inputForm) {
		this.inputForm = inputForm;
	}
    
    
}
