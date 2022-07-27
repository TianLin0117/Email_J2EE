<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2020/5/29
  Time: 14:04
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
  String wrongOldPsd=(String)session.getAttribute("wrongOldPsd");
%>
<html>
<head>
    <title>修改密码</title>
  <style>
    *{
      margin: 0;
      padding: 0;
    }
    .box{
      width: 100%;
      height: 750px;
      background-color: #eff8ff;
      background-image: url(image/paperplane.png) ;
      background-repeat: no-repeat;
      background-position: right bottom;
      position: absolute;
    }
    .box .register{
      width:400px;
      height: 400px;
      margin: 50px auto;
      border: #A0B1C4 solid 2px;
    }
    .register .id{
      margin: 30px 50px 25px;
      width: 300px;
      height: 40px;
      font-size: 20px;
    }
    .register .psd{
      margin: 0 50px 35px;
      width: 300px;
      height: 40px;
      font-size: 20px;
    }
    .register .submitt{
      width: 300px;
      height: 40px;
      margin: 0 50px 20px;
      background-color: #5a98de;
      color: white;
      font-size: 20px;
    }
  </style>
</head>
<body>
<div class="box">
  <div class="register">
    <h1 style="height: 80px;line-height: 80px;text-align: center;border-bottom: #A0B1C4 solid 2px;color: #6F95C8;">欢迎注册邮箱账号</h1>
    <form name="logintable" method="post" action="doSetPsd.jsp">

      <input type="password" placeholder="旧密码" name="oldPsd" class="id"/><br />
      <input type="password" placeholder="新密码" name="newPsd" class="psd"/><br />
      <%
        if(wrongOldPsd!=null){
      %>
      <span style="color: red;margin-left: 60px">旧密码输入错误，请重新输入！</span>
      <%
        }
      %>
      <input type="submit" value="保  存" class="submitt"/>
      <input type="button" value="放弃修改" class="submitt" onclick="javascrtpt:window.location.href='firstpage.jsp'">
    </form>
  </div>
</div>
</body>
</html>
