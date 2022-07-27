<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="njust.entity.*" %>
<%
response.setCharacterEncoding("GBK");
User loginUser = (User)session.getAttribute("loginUser");  // 从session中获得登录用户
  String isLogin=(String)session.getAttribute("isLogin");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>请登录</title>
    <style>
      *{
        margin: 0;
        padding: 0;
      }
      .head{
        width: 100%;
        height: 104px;
        background-color: #eff4fa;
        position: fixed;
        top: 0;
      }
      .head .Englishname{
        height: 104px;
        line-height: 104px;
        color: #219ce2;
        padding-left: 30px;
        font-size: 50px;
        font-weight: 800;
        float: left;
      }
      .head .chinesename{
        height: 104px;
        line-height: 104px;
        color: #219CE2;
        font-size:40px ;
        padding-left: 10px ;
        float: left;
      }
      .content{
        height: 650px;
        width: 900px;
        background: url(image/smile.png) no-repeat 600px 330px;
        background-size: 300px;
        position: fixed;
        top: 104px;
      }
      .content .p1{
        margin-top: 182px;
        margin-left: 241px;
        margin-bottom: 20px;
        font-size: 35px;
        color: #6f95c8;
        font-weight: bold;
      }
      .content .p2{
        margin-left: 241px;
        line-height: 35px;
        font-size: 20px;
      }
      .login{
        width: 400px;
        height: 450px;
        background-color: bisque;
        margin-left: 950px;
        margin-top: 200px;
        border: 2px solid #a0b1c4;
      }
      .login .input{
        margin: 30px 50px 25px;
        width: 300px;
        height: 40px;
        font-size: 20px;
      }
      .login .psd{
        margin: 0 50px 35px;
        width: 300px;
        height: 40px;
        font-size: 20px;
      }
      .login .submitt{
        width: 300px;
        height: 40px;
        margin: 0 50px 40px;
        background-color: #5a98de;
        color: white;
        font-size: 20px;
      }
      a{
        text-decoration: none;
        margin: 0 120px 20px;
      }
    </style>
  </head>

  <body>
  	<%--  登录 --%>
  	<%
  	if(loginUser==null){ // 未登录
  	%>

    <div class="head">
      <p class="Englishname">Mail</p>
      <p class="chinesename">邮箱</p>
    </div>
    <div class="content">
      <p class="p1">用邮箱，常联系！</p>
      <p class="p2">1982年，第一张电脑笑脸诞生<br/>今天，人们已经习惯用它来表达心情<br/>
        现在，你也可以在邮件里<br/>用：）来传达一个微笑的表情
      </p>
    </div>
    <div class="login">
      <h1 style="height: 80px;line-height: 80px;text-align: center;border-bottom: #A0B1C4 solid 2px;color: #6F95C8;">邮箱登录</h1>
      <form  method="post" action="doLogin.jsp">
        <input type="text" placeholder="用户名" name="uname" class="input"/><br />
        <input type="password" placeholder="密码" name="upass" class="psd"/><br />
        <%
          if(isLogin!=null){
        %>
        <span style="color: red;margin-left: 60px;">登录失败！用户名或密码错误！</span>
        <%
          }
        %>
        <input type="submit" value="登  录" class="submitt"/>
      </form>
      <a href="Register.jsp">没有账号？立即注册。</a>
    </div>
    <%
    } else {            // 已登录
    	response.sendRedirect("firstpage.jsp");
    }
    %>
  </body>
</html>
