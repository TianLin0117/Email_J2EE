<%@ page language="java" pageEncoding="GBK"
	import="java.util.*,njust.entity.*,njust.biz.*"%>
<%@ page import="njust.biz.UserBiz" %>
<%@ page import="njust.entity.User" %>
<%
	request.setCharacterEncoding("GBK");

	UserBiz userBiz = new UserBiz();
	User loginUser = userBiz.findByUname(request.getParameter("uname"));
	String isLogin="failed";

	if (loginUser != null && loginUser.getPass().equals(request.getParameter("upass"))) {
		session.setAttribute("loginUser",(User)loginUser);
		response.sendRedirect("firstpage.jsp");
	}
	else {
		session.setAttribute("isLogin",isLogin);
		response.sendRedirect("index.jsp");
	}
%>
