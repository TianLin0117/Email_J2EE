<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2020/5/29
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,njust.biz.*,njust.entity.*"%>

<%
  response.setCharacterEncoding("GBK");
  User loginUser = (User) session.getAttribute("loginUser");             // 从session中获得登录用户
  if (loginUser == null) {                                                         // 未登录跳转
    response.sendRedirect("index.jsp");
    return;
  }
  UserBiz userBiz=new UserBiz();
  String wrongOldPsd="0";
  String odlPsd=request.getParameter("oldPsd");
  String newPsd=request.getParameter("newPsd");
  if(loginUser!=null&&loginUser.getPass().equals(odlPsd)){
    userBiz.updatePsd(newPsd,loginUser.getName());
    response.sendRedirect("firstpage.jsp");
  }
  else {
    session.setAttribute("wrongOldPsd",wrongOldPsd);
    response.sendRedirect("changePsd.jsp");
  }
%>
