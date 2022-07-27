<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2020/5/27
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,njust.entity.*,njust.biz.*"%>
<%
  request.setCharacterEncoding("GBK");
  String receiveUname=request.getParameter("name");
  String reveiveUpass=request.getParameter("password");
  String isRegister="failed";

  User user=new User();
  User isExist=new User();
  UserBiz userBiz=new UserBiz();

  isExist=userBiz.findByUname(receiveUname);

  if(isExist==null){
    user.setName(receiveUname);
    user.setPass(reveiveUpass);

    userBiz.save(user);

    response.sendRedirect("index.jsp");
  }
  else {
    session.setAttribute("isRegister",isRegister);
    response.sendRedirect("Register.jsp");
  }

%>
