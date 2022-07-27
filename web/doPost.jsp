<%@ page language="java" pageEncoding="GBK"
	import="java.util.*,njust.entity.*,njust.biz.*"%>
<%
	request.setCharacterEncoding("GBK");

	User loginUser = (User) session.getAttribute("loginUser");
	if (loginUser == null) {
		response.sendRedirect("index.jsp");
		return;
	}

	Message message = new Message();
	MessageBiz messageBiz = new MessageBiz();
	UserBiz userBiz = new UserBiz();
	User receiveUser = userBiz.findByUname(request.getParameter("receiveUname"));

	String issend="1";/* 1,表示发送成功，0,表示发送失败*/

	if(receiveUser!=null){
		String sendUname=loginUser.getName();
		String receiveUname = request.getParameter("receiveUname");
		String note=request.getParameter("note");
		int readSign=0;

		message.setNote(note);
		message.setSendUname(sendUname);
		message.setReceiveUname(receiveUname);
		message.setPostTime(new Date());
		message.setReadSign(readSign);

		messageBiz.save(message);
		issend="1";
		session.setAttribute("isSend",issend);
		response.sendRedirect("ifSend.jsp");
	}
	else {
		issend="0";
		session.setAttribute("isSend",issend);
		response.sendRedirect("ifSend.jsp");
	}
%>
