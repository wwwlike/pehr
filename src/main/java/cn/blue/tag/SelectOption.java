package cn.blue.tag;

import org.apache.commons.lang3.StringUtils;


/**
 * 构造选择项
 * @author donglc
 * @CreateDate 2007-11-29
 */
public class SelectOption {

    public String name;
    public String value;
    public boolean selected;
    
    public SelectOption() {}
    
    public SelectOption(String name,String value,boolean selected) {
        this.name = name;
        this.value = value;
        this.selected = selected;
    }
    
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public boolean isSelected() {
        return selected;
    }
    public void setSelected(boolean selected) {
        this.selected = selected;
    }
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
    
    public String toString() {
        StringBuffer sb = new StringBuffer();
        if(value==null && name!=null)
            value = name;
        sb.append("<option value=\""+value+"\"");
        if(selected)
            sb.append(" selected");
        sb.append(">"+name+"</option>");
        return sb.toString();
    }
    
    /**
     * 解析字符串,这里规定格式必须为{name:value,name:value}
     * @param str
     * @return
     */
    public static SelectOption[] parse(String str) {
        SelectOption[] options = new SelectOption[0];
        if(StringUtils.isEmpty(str))
            return options;
        str = str.substring(1,str.length()-1);	//去掉括号
        String[] pairs = StringUtils.split(str,",");
        options = new SelectOption[pairs.length];
        for(int i=0;i<pairs.length;i++) {
            int index = pairs[i].indexOf(":");
            String name = pairs[i].substring(0,index);
            String value = pairs[i].substring(index+1);
            SelectOption op = new SelectOption();
            op.name = name;
            op.value = value;
            options[i] = op;
        }
        return options;
    }
    
    public static void main(String[] args) {
        String str = "{男:男,女:女,---:}";
        SelectOption[] options = parse(str);
        for(int i=0;i<options.length;i++) {
            System.out.println(options[i]);
        }
    }
}
