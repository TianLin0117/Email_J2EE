<%@ page language="java" pageEncoding="GBK"	import="njust.biz.*,njust.entity.*"%>
<%@ page import="njust.biz.MessageBiz" %>
<%@ page import="njust.entity.User" %>
<%@ page import="njust.entity.Message" %>
<%
	User loginUser = (User) session.getAttribute("loginUser");  // 从session中获得登录用户
	if (loginUser == null) {
		response.sendRedirect("index.jsp");
		return;
	}
	int msgId = Integer.parseInt(request.getParameter("msgid"));  // 从请求中取得要删除的短信息id
	MessageBiz messageBiz = new MessageBiz();
	Message message = messageBiz.findMessage(msgId);                     // 取得要删除短信息的对象
	if (loginUser.getName().equals(message.getReceiveUname())) {                 // 判断用户身份
		messageBiz.delete(msgId);
	}
	response.sendRedirect("listMsg.jsp");
%>
