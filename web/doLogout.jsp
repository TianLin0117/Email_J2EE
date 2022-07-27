<%@ page language="java" pageEncoding="GBK"%>
<%
    session.removeAttribute("loginUser");
    session.removeAttribute("isLogin");
    session.removeAttribute("isRegister");
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
