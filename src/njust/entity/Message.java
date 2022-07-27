/*
 * njust.entity.Message
 * 2007-08-13
 * 短消息类
 */
package njust.entity;

import java.util.Date;

public class Message {
    private int id;              // 消息id
    private String note;          // 消息内容
    private String sendUname;     // 发送者的id
    private String receiveUname;  // 接收者的id
    private Date postTime;      // 发送时间
    private int    readSign;      // 已读标记，1表示已读，0表示未读
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
    public String getNote() {
        return note;
    }
    public void setNote(String note) {
        this.note = note;
    }
    
    public String getReceiveUname() {
        return receiveUname;
    }
    public void setReceiveUname(String receiveUname) {
        this.receiveUname = receiveUname;
    }
    
    public String getSendUname() {
        return sendUname;
    }
    public void setSendUname(String sendUname) {
        this.sendUname = sendUname;
    }
    
    public Date getPostTime() {
        return postTime;
    }
    public void setPostTime(Date postTime) {
        this.postTime = postTime;
    }
    
    public int getReadSign() {
        return readSign;
    }
    public void setReadSign(int readSign) {
        this.readSign = readSign;
    }
}
