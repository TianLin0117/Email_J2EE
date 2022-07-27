/*
 * njust.dao.MessageDao.java
 * 2007-08-10
 * 短消息数据库访问类
 */
package njust.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import njust.entity.Message;
import njust.util.Tool;


public class MessageDao extends BaseDao {
    private Connection  conn  = null;   // 数据库连接
    private PreparedStatement pstmt = null;   // 创建PreparedStatement对象
    private ResultSet   rs    = null;   // 创建结果集对象

    //保存一条消息
    public int save(Message message){
        String sbSql = "insert into TBL_MESSAGE(id,note,sendUname,receiveUname,postTime,readSign) VALUES(?,?,?,?,?,?)";
        Object[] param ={message.getId(),message.getNote(),message.getSendUname(),message.getReceiveUname(),Tool.Date2Str(message.getPostTime(),"yyyy-MM-dd HH:mm:ss"),message.getReadSign()};
        return super.executeSQL(sbSql, param);
    }

    //删除一条消息
    public int delete(int id){
        String sql = "delete from TBL_MESSAGE where id="+id;
        return super.executeSQL(sql, null);
    }

    public int update(Message message){
        String sql = "update TBL_MESSAGE set readSign=1 where id="+message.getId();
        return super.executeSQL(sql, null);
    }

    //通过id设为未读
    public int updateToNotRead(int id){
        String sql="update TBL_MESSAGE set readSign=0 where id="+id;
        return super.executeSQL(sql,null);
    }

    //通过id设为已读
    public int updateToRead(int id){
        String sql="update TBL_MESSAGE set readSign=1 where id="+id;
        return super.executeSQL(sql,null);
    }

  // 查询参数用户收到的消息列表
    public List<Message> listByReceiveUname(String receiveUname) {
        List<Message> list = new ArrayList<Message>();
        Message message=null;
        String sql = "select * from TBL_MESSAGE where receiveUname='"+receiveUname+"'";
        try {
            conn=getConn();
            pstmt=conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
            while (rs.next()){
                message=new Message();
                message.setId(rs.getInt("id"));
                message.setNote(rs.getString("note"));
                message.setSendUname(rs.getString("sendUname"));
                message.setReceiveUname(rs.getString("receiveUname"));
                message.setPostTime(rs.getTimestamp("postTime"));
                message.setReadSign(rs.getInt("readSign"));
                list.add(message);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            this.closeAll(conn, pstmt, rs);
        }
        return list;
    }

    public List<Message> listBySendUname(String sendUname) {
        List<Message> list = new ArrayList<Message>();
        Message message=null;
        String sql = "select * from TBL_MESSAGE where sendUname='"+sendUname+"'";
        try {
            conn=getConn();
            pstmt=conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
            while (rs.next()){
                message=new Message();
                message.setId(rs.getInt("id"));
                message.setNote(rs.getString("note"));
                message.setSendUname(rs.getString("sendUname"));
                message.setReceiveUname(rs.getString("receiveUname"));
                message.setPostTime(rs.getTimestamp("postTime"));
                message.setReadSign(rs.getInt("readSign"));
                list.add(message);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            this.closeAll(conn, pstmt, rs);
        }
        return list;
    }
    //根据短信息id查一条短信息
    public Message findMessage(int id){
        Message message = null;
        String sql = "select * from TBL_MESSAGE where id='"+id+"'";
        try {
            conn=getConn();
            pstmt=conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
            while (rs.next()){
                message=new Message();
                message.setId(rs.getInt("id"));
                message.setNote(rs.getString("note"));
                message.setSendUname(rs.getString("sendUname"));
                message.setReceiveUname(rs.getString("receiveUname"));
                message.setPostTime(rs.getDate("postTime"));
                message.setReadSign(rs.getInt("readSign"));
            }
        } catch (ClassNotFoundException e) {
            message = null;
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            this.closeAll(conn, pstmt, rs);
        }
        return message;
    }
}
