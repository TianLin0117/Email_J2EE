/*
 * njust.dao.UserDao.java
 * 2007-08-10
 * 用户数据库访问类
 */
package njust.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import njust.entity.User;
import njust.util.Tool;

public class UserDao extends BaseDao{
    private Connection        conn  = null;   // 数据库连接
    private PreparedStatement pstmt = null;   // 创建PreparedStatement对象
    private ResultSet         rs    = null;   // 创建结果集对象

    public User findByUname(String uname) {
        User user = null;
        String sql = "select * from TBL_USER where name=?";
        try {
            conn  = this.getConn();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, uname);
            rs    = pstmt.executeQuery();
            while(rs.next()) {
                user = new User();
                user.setName(rs.getString("name"));
                user.setPass(rs.getString("pass"));
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            this.closeAll(conn, pstmt, rs);
        }
        return user;
    }

    public int save(User user){
        String sbSql = "insert into TBL_USER(NAME,PASS) VALUES(?,?)";
        Object[] param ={user.getName(),user.getPass()};
        return super.executeSQL(sbSql, param);
    }

    //修改密码
    public int updatePassword(String newPsd,String uname){
        String sql="update TBL_USER set PASS='"+newPsd+"' where NAME='"+uname+"'";
        return super.executeSQL(sql,null);
    }
}
