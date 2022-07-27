<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2020/5/27
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,njust.biz.*,njust.entity.*"%>
<%
  response.setCharacterEncoding("GBK");
  String isSend=(String)session.getAttribute("isSend");
  User loginUser = (User) session.getAttribute("loginUser");             // 从session中获得登录用户
  if (loginUser == null) {                                                         // 未登录跳转
    response.sendRedirect("index.jsp");
    return;
  }
%>
<html>
<head>
    <title>发送状态</title>
  <style>
    *{
      margin: 0;
      padding: 0;
    }
    .head{
      width: 100%;
      height: 104px;
      background-color: #31455e;
      position: fixed;
      top: 0;
    }
    .head .Englishname{
      height: 104px;
      line-height: 104px;
      color: white;
      padding-left: 30px;
      font-size: 50px;
      font-weight: 800;
      float: left;
    }
    .head .chinesename{
      height: 104px;
      line-height: 104px;
      color: white;
      font-size:40px ;
      padding-left: 10px ;
      float: left;
    }
    .head .welcome{
      color: white;
      padding-left: 250px;
      padding-top:28px;
    }
    .head ul{
      margin-left: 250px;
    }
    .head ul li{
      display: inline-block;
      list-style: none;
      border-left: white solid 1px;
      padding-left: 10px;
      padding-right: 10px;
      margin-top: 2px;
    }
    .head ul li a{
      color: white;
      text-decoration: none;
    }
    .head ul li a:hover{
      text-decoration: underline;
    }
    .nav{
      width: 290px;
      height: 100%;
      border-right: 1px solid grey;
      background-color: #e8ebef;
      position: fixed;
      top: 104px;
    }
    .nav li{
      width: 290px;
      height: 55px;
      border-bottom: 2px solid #bfc8d8;
      line-height: 55px;
      list-style: none;
    }
    .nav .write{
      background: url(image/mailbox.png) no-repeat 73px center ;
      background-size:30px 30px ;
    }
    .nav .receive{
      background: url(image/receive.png) no-repeat 73px center;
      background-size: 30px 30px;
    }
    .nav .send{
      background: url(image/sent.png) no-repeat 77px center;
      background-size: 25px 25px;
    }
    .nav li a{
      display: block;
      padding-left: 110px;
      font-size: 30px;
      text-decoration: none;
      color: #504b66;
    }
    .nav li:hover{
      background-color: rgb(214,219,224);
    }
    .content{
      width: 1245px;
      height: 650px;
      background-color: #fffae8;
      position: fixed;
      top: 104px;
      left: 291px;
    }
  </style>
</head>
<body>
<div class="head">
  <p class="Englishname">Mail</p>
  <p class="chinesename">邮箱</p>
  <p class="welcome">尊敬的用户：您好！</p>
  <ul>
    <li><a href="firstpage.jsp">邮箱首页</a></li>
    <li><a href="doLogout.jsp">退出</a></li>
    <li><a href="changePsd.jsp">修改密码</a> </li>
  </ul>
</div>
<div class="nav">
  <ul>
    <li class="write"><a href="post.jsp">写信</a> </li>
    <li class="receive"><a href="listMsg.jsp">收件箱</a> </li>
    <li class="send"><a href="haveSend.jsp">已发送</a> </li>
  </ul>
</div>
<div class="content">
  <%
    if(isSend.equals("1")){
  %>
  <p style="margin-top: 50px; margin-left: 100px;font-size: 35px;">发送成功！！</p>
  <form>
    <input type="button" value="返回首页"
           onclick="javascrtpt:window.location.href='firstpage.jsp'"
           style="width: 70px;height: 30px;margin-top: 50px;margin-left: 120px;"/>
  </form>
  <%
    }else {
  %>
  <p style="margin-top: 50px; margin-left: 100px;font-size: 35px;">发送失败！用户名不存在！</p>
  <form>
    <input type="button" value="返回首页"
           onclick="javascrtpt:window.location.href='firstpage.jsp'"
           style="width: 70px;height: 30px;margin-top: 50px;margin-left: 120px;"/>
    <input type="button" value="重新编辑"
           onclick="javascrtpt:window.location.href='post.jsp'"
           style="width: 70px;height: 30px;margin-top: 50px;margin-left: 120px;"/>
  </form>
  <%
    }
  %>
</div>
</body>
</html>
