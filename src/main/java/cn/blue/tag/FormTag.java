package cn.blue.tag;

import org.springframework.web.servlet.tags.RequestContextAwareTag;

/**
 * 
 * @author wwwlike
 * @CreateDate 2007-12-14
 */
public class FormTag extends RequestContextAwareTag {

    protected String id;
	protected String name;
	protected String value;
	protected SelectOption[] options;
	protected String css;
	protected String style;
	protected boolean disabled;
	protected boolean readonly;
	protected int maxlength;		//最大字符数
	protected String onclick;		//click event
	protected String ondbclick;		//dbclick event
	protected String onchange;		//change event
	protected String onkeyup;		//keyup event
	protected String onkeypress;	//keypress event
	protected String onfocus;		//focus event
	protected String onblur;		//blur event
	protected String onselect;		//select event
	
	protected void cleanUp() {
		this.id = null;
		this.name = null;
		this.value = null;
		this.options = null;
		this.css = null;
		this.style = null;
		this.disabled = false;
		this.readonly = false;
		this.maxlength = 0;
		this.onclick = null;
		this.ondbclick = null;
		this.onchange = null;
		this.onkeyup = null;
		this.onkeypress = null;
		this.onfocus = null;
		this.onblur = null;
		this.onselect = null;
	}
	
    public String getCss() {
        return css;
    }
    public void setCss(String css) {
        this.css = css;
    }
    public boolean isDisabled() {
        return disabled;
    }
    public void setDisabled(boolean disabled) {
        this.disabled = disabled;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public int getMaxlength() {
        return maxlength;
    }
    public void setMaxlength(int maxlength) {
        this.maxlength = maxlength;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getOnblur() {
        return onblur;
    }
    public void setOnblur(String onblur) {
        this.onblur = onblur;
    }
    public String getOnchange() {
        return onchange;
    }
    public void setOnchange(String onchange) {
        this.onchange = onchange;
    }
    public String getOnclick() {
        return onclick;
    }
    public void setOnclick(String onclick) {
        this.onclick = onclick;
    }
    public String getOndbclick() {
        return ondbclick;
    }
    public void setOndbclick(String ondbclick) {
        this.ondbclick = ondbclick;
    }
    public String getOnfocus() {
        return onfocus;
    }
    public void setOnfocus(String onfocus) {
        this.onfocus = onfocus;
    }
    public String getOnkeypress() {
        return onkeypress;
    }
    public void setOnkeypress(String onkeypress) {
        this.onkeypress = onkeypress;
    }
    public String getOnkeyup() {
        return onkeyup;
    }
    public void setOnkeyup(String onkeyup) {
        this.onkeyup = onkeyup;
    }
    public String getOnselect() {
        return onselect;
    }
    public void setOnselect(String onselect) {
        this.onselect = onselect;
    }
    public SelectOption[] getOptions() {
        return options;
    }
    public void setOptions(SelectOption[] options) {
        this.options = options;
    }
    public boolean isReadonly() {
        return readonly;
    }
    public void setReadonly(boolean readonly) {
        this.readonly = readonly;
    }
    public String getStyle() {
        return style;
    }
    public void setStyle(String style) {
        this.style = style;
    }
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }

	@Override
	protected int doStartTagInternal() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
}
