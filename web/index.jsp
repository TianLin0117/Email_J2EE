<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="njust.entity.*" %>
<%
response.setCharacterEncoding("GBK");
User loginUser = (User)session.getAttribute("loginUser");  // ��session�л�õ�¼�û�
  String isLogin=(String)session.getAttribute("isLogin");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>���¼</title>
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
  	<%--  ��¼ --%>
  	<%
  	if(loginUser==null){ // δ��¼
  	%>

    <div class="head">
      <p class="Englishname">Mail</p>
      <p class="chinesename">����</p>
    </div>
    <div class="content">
      <p class="p1">�����䣬����ϵ��</p>
      <p class="p2">1982�꣬��һ�ŵ���Ц������<br/>���죬�����Ѿ�ϰ���������������<br/>
        ���ڣ���Ҳ�������ʼ���<br/>�ã���������һ��΢Ц�ı���
      </p>
    </div>
    <div class="login">
      <h1 style="height: 80px;line-height: 80px;text-align: center;border-bottom: #A0B1C4 solid 2px;color: #6F95C8;">�����¼</h1>
      <form  method="post" action="doLogin.jsp">
        <input type="text" placeholder="�û���" name="uname" class="input"/><br />
        <input type="password" placeholder="����" name="upass" class="psd"/><br />
        <%
          if(isLogin!=null){
        %>
        <span style="color: red;margin-left: 60px;">��¼ʧ�ܣ��û������������</span>
        <%
          }
        %>
        <input type="submit" value="��  ¼" class="submitt"/>
      </form>
      <a href="Register.jsp">û���˺ţ�����ע�ᡣ</a>
    </div>
    <%
    } else {            // �ѵ�¼
    	response.sendRedirect("firstpage.jsp");
    }
    %>
  </body>
</html>
