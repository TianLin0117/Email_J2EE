/*
 * njust.entity.User
 * 用户类
 */
package njust.entity;

public class User {
    private String name;  // 用户名
    private String pass;  // 用户密码
    
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    
    public String getPass() {
        return pass;
    }
    public void setPass(String pass) {
        this.pass = pass;
    }    
}
