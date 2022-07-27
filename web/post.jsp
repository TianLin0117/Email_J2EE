<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="njust.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="njust.biz.UserBiz" %>
<%
	User loginUser = (User) session.getAttribute("loginUser");
	if (loginUser == null) {
		request.setAttribute("error_msg", "您尚未登录");
		response.sendRedirect("index.jsp");
		return;
	}
	String receiveUname = "";
	try {
		receiveUname = new String(request.getParameter("receiveUname").getBytes("ISO-8859-1"));
	} catch (NullPointerException e) {
		receiveUname = "";
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>发邮件</title>
	<script type="text/javascript">
		function check() {
			var receiveUname = document.forms[0].receiveUname.value;
			var note = document.forms[0].note.value;
			var errorMsg = "";
			if (receiveUname == "" || receiveUname == "请输入您的名字") {
				errorMsg += "作者不能为空";
			}
			if (note == "") {
				errorMsg += "\n内容不能为空";
			}
			if (note.length > 500) {
				errorMsg += "\n内容长度不能大于100";
			}
			if (receiveUname.length > 20) {
				errorMsg += "\n用户名长度不能大于20";
			}
			if (errorMsg != "") {
				alert(errorMsg);
				return false;
			}
	}
	</script>
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
			  background-color: rgb(73,94,118);
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
		  .nav li .writing{
			  color: white;
		  }
		  .nav .receive:hover{
			  background-color: rgb(214,219,224);
		  }
		  .nav .send:hover{
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
		  .content .mail{
			  display: block;
			  width: 140px;
			  height: 45px;
			  background-color: rgb(188,194,205);
			  text-align: center;
			  line-height: 45px;
			  font-size:20px;
			  font-weight: bold;
			  margin-top: 20px;
			  margin-left: 20px;
			  border-radius: 15px 15px 0 0;
		  }
		  .content .title{
			  width: 1100px;
			  height: 40px;
			  background-color:rgb(188,194,205) ;
			  margin-left: 20px;
			  border-radius: 0 15px 0 0;
		  }
		  .content .title .submitt{
			  width: 60px;
			  height: 30px;
			  margin-top: 5px;
			  margin-left: 30px;
		  }
		  .content .title .close{
			  width: 60px;
			  height: 30px;
			  margin-top: 5px;
			  margin-left: 30px;
		  }
		  .content .mailcontent{
			  width: 1100px;
			  height: 525px;
			  background-color: rgb(244,246,248);
			  margin-left: 20px;
			  position: fixed;
			  border-radius: 0 0 15px 15px ;
		  }
		  .content .mailcontent .sender{
			  width: 1000px;
			  height: 50px;
			  margin-left: 40px;
			  margin-top: 30px;
		  }
		  .content .mailcontent .receiver{
			  width:900px ;
			  height: 25px;
			  font-size: 20px;
			  border: 2px solid #ccc;
			  border-radius: 4px;
			  background-color: #f8f8f8;
		  }
		  .content .mailcontent .main{
			  width: 975px;
			  height: 310px;
			  margin-left: 40px;
			  margin-top: 20px;
		  }
		  textarea {
			  width: 100%;
			  height: 300px;
			  padding: 12px 20px;
			  box-sizing: border-box;
			  border: 2px solid #ccc;
			  border-radius: 4px;
			  background-color: #f8f8f8;
			  font-size: 16px;
			  resize: none;
		  }
		  .maintext{
			  margin-left: 40px;
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
		  <li class="write"><a href="post.jsp" class="writing">写信</a> </li>
		  <li class="receive"><a href="listMsg.jsp">收件箱</a> </li>
		  <li class="send"><a href="haveSend.jsp">已发送</a> </li>
	  </ul>
  </div>
  <div class="content">
	  <form action="doPost.jsp" method="post" onsubmit="return check()">
		  <input type="hidden" name="sendUname" value="<%=loginUser.getName() %>" />
		  <p class="mail">普通邮件</p>
		  <div class="title">
			  <input type="submit" value="发  送" class="submitt"/>
			  <input type="button" value="关  闭" class="close" onclick="javascrtpt:window.location.href='firstpage.jsp'" />
		  </div>
		  <div class="mailcontent">
			  <div class="sender">
				  <span>收件人：</span> <input type="text" name="receiveUname" class="receiver" value="<%=receiveUname.isEmpty()?"":receiveUname %>"/>
			  </div>
			  <span class="maintext">正&nbsp;&nbsp;&nbsp;文：&nbsp;</span>
			  <div class="main">
				  <textarea name="note" ></textarea>
			  </div>
			  <span style="margin-left: 50px;padding-top: 10px;">发送人：<%=loginUser.getName()%> </span><br />
			  <input type="submit" value="发  送" class="submitt"
					 style="width: 60px;height: 30px;margin-top: 20px;margin-left: 30px;"/>
			  <input type="button" value="关  闭" class="close"
					 onclick="javascrtpt:window.location.href='firstpage.jsp'"
					 style="width: 60px;height: 30px;margin-top: 20px;margin-left: 30px;"/>
		  </div>
  </form>
  </div>
  </body>
</html>
