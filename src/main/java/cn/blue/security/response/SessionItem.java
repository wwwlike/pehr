package cn.blue.security.response;

import lombok.Data;

@Data
public class SessionItem {
    private String  token;
    private String  userId;
    private String  username;
    private String  name;
    private String  roleId;//所属角色
    private String  schoolId; //所在校区
    private String[] schoolClassIds;//管辖班级
    private String  email;
  
    
    
}
