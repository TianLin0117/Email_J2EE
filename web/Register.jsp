<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2020/5/27
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String isRegister=(String)session.getAttribute("isRegister");
%>
<html>
<head>
    <title>注册</title>
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
      height: 350px;
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
      margin: 0 50px 40px;
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
    <form name="logintable" method="post" action="doRegister.jsp">

      <input type="text" placeholder="用户名" name="name" class="id"/><br />
      <input type="password" placeholder="密码" name="password" class="psd"/><br />
      <%
        if(isRegister!=null){
      %>
      <span style="color: red;margin-left: 60px">用户名已存在，请重新输入！</span>
      <%
        }
      %>
      <input type="submit" value="注  册" class="submitt"/>
    </form>
  </div>
</div>
</body>
</html>
