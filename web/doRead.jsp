<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2020/5/28
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="njust.biz.MessageBiz" %>
<%@ page import="njust.entity.User" %>
<%@ page import="njust.entity.Message" %>
<%
  User loginUser = (User) session.getAttribute("loginUser");  // 从session中获得登录用户
  if (loginUser == null) {
    response.sendRedirect("index.jsp");
    return;
  }
  int msgId = Integer.parseInt(request.getParameter("msgid"));// 从请求中取得要删除的短信息id
  String pageNum=request.getParameter("pageNum");
  MessageBiz messageBiz = new MessageBiz();
  Message message = messageBiz.findMessage(msgId);                     // 取得要删除短信息的对象
  if (loginUser.getName().equals(message.getReceiveUname())) {                 // 判断用户身份
    messageBiz.setToRead(msgId);
  }
  if(pageNum.equals("1")){
    response.sendRedirect("unRead.jsp");
  }else if(pageNum.equals("2")){
    response.sendRedirect("listMsg.jsp");
  }

%>

