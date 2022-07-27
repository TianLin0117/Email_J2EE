/*
 *njust.biz.MessageBiz.java
 * 2007-08-10
 * 短消息业务类
 */
package njust.biz;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import njust.dao.MessageDao;
import njust.entity.Message;

public class MessageBiz {
    private MessageDao messageDao = new MessageDao(); // 获得短消息的数据访问对象
    
    //保存留言
    public int save(Message message){
        return messageDao.save(message);
    }
    
     //删除留言
    public int delete(int id){
        return messageDao.delete(id);
    }

    //设为已读
    public int setToRead(int id){return messageDao.updateToRead(id);}

    //设为未读
    public int setToNotRead(int id){return messageDao.updateToNotRead(id);}

    //查询留言
    public List listByReceiveUname(String uname){
        return messageDao.listByReceiveUname(uname);
    }

    //查询已发送留言
    public List listBySendUname(String uname){return messageDao.listBySendUname(uname);}
    
     //根据短信息id查一条短信息
    public Message findMessage(int id){
        Message message=new Message();
        message = messageDao.findMessage(id);
        int sign = message.getReadSign();
        message.setReadSign(sign);
        if(sign==0){
            messageDao.update(message);
        }
        return message;
    }

    //查询消息但不改变是否已读
    public Message findMsg(int id){
        Message message=new Message();
        message = messageDao.findMessage(id);
        return message;
    }
}
