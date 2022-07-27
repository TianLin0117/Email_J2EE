/*
 * njust.biz.UserBiz.java
 * 2007-08-10
 * 用户业务类
 */
package njust.biz;

import njust.dao.UserDao;
import njust.entity.User;

import java.util.List;

public class UserBiz {
    private UserDao userDao = new UserDao();  // 用户Dao对象

    //根据用户名查询用户
    public User findByUname(String uname) {
        return userDao.findByUname(uname);
    }

    public int save(User user){
        return userDao.save(user);
    }

    public int updatePsd(String newPsd,String uname){return userDao.updatePassword(newPsd,uname);}
}
