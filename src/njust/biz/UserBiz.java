/*
 * njust.biz.UserBiz.java
 * 2007-08-10
 * �û�ҵ����
 */
package njust.biz;

import njust.dao.UserDao;
import njust.entity.User;

import java.util.List;

public class UserBiz {
    private UserDao userDao = new UserDao();  // �û�Dao����

    //�����û�����ѯ�û�
    public User findByUname(String uname) {
        return userDao.findByUname(uname);
    }

    public int save(User user){
        return userDao.save(user);
    }

    public int updatePsd(String newPsd,String uname){return userDao.updatePassword(newPsd,uname);}
}
