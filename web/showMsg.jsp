<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="njust.biz.*,njust.entity.*,njust.util.Tool"%>

<%
	response.setCharacterEncoding("GBK");
	User loginUser = (User) session.getAttribute("loginUser");             // 从session中获得登录用户
	if (loginUser == null) {                                                         // 未登录跳转
		response.sendRedirect("index.jsp");
		return;
	}
	MessageBiz messageBiz = new MessageBiz();// 获得短消息业务对象
	String pageNum=request.getParameter("pageNum");
	int msgId = 0;
	try {
		msgId = Integer.parseInt(request.getParameter("messageId"));  // 从请求中获取短信id
	} catch (Exception e) {
		response.sendRedirect("listMsg.jsp");
		return;
	}
	Message message=new Message();
	if(pageNum.equals("1")||pageNum.equals("2")) {
		message = messageBiz.findMessage(msgId);// 创建存放消息列表的对象
	}
	else if(pageNum.equals("3")){
		message=messageBiz.findMsg(msgId);
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>查看邮件</title>
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
			/* margin-left: 291px; */
			/* margin-top: 104px; */
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
		/*.content .title .submitt{*/
			/*width: 60px;*/
			/*height: 30px;*/
			/*margin-top: 5px;*/
			/*margin-left: 30px;*/
		/*}*/
		/*.content .title .close{*/
			/*width: 60px;*/
			/*height: 30px;*/
			/*margin-top: 5px;*/
			/*margin-left: 30px;*/
		/*}*/
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
			/*margin-bottom: 10px;*/
		}
		.content .mailcontent .receiver{
			width:900px ;
			height: 25px;
			font-size: 20px;
			border: 2px solid #ccc;
			border-radius: 4px;
			background-color: #f8f8f8;
			float: left;
		}
		.content .mailcontent .main{
			width: 975px;
			height: 300px;
			margin-left: 40px;
			margin-top: 20px;
			padding: 12px 20px;
			box-sizing: border-box;
			border: 2px solid #ccc;
			border-radius: 4px;
			background-color: #f8f8f8;
			font-size: 16px;
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
		<li class="write"><a href="post.jsp">写信</a> </li>
		<li class="receive"><a href="listMsg.jsp">收件箱</a> </li>
		<li class="send"><a href="haveSend.jsp">已发送</a> </li>
	</ul>
</div>
<div class="content">
	<form action="doPost.jsp" method="post">
		<p class="mail">普通邮件</p>
		<div class="title">
			<%
				if(pageNum.equals("1")){
			%>
			<input type="button" value="删  除" style="width: 60px;	height: 30px;margin-top: 5px;margin-left: 30px;" class="submitt" onclick="javascrtpt:window.location.href='doDelete.jsp?msgid=<%=message.getId()%>'" />
			<input type="button" value="回  复" style="width: 60px;	height: 30px;margin-top: 5px;margin-left: 30px;" class="close" onclick="javascrtpt:window.location.href='post.jsp?receiveUname=<%= message.getSendUname() %>'" />
			<input type="button" value="返  回" style="width: 60px;	height: 30px;margin-top: 5px;margin-left: 30px;" onclick="javascrtpt:window.location.href='unRead.jsp'" />
			<%
				}else if(pageNum.equals("2")){
			%>
			<input type="button" value="删  除" style="width: 60px;	height: 30px;margin-top: 5px;margin-left: 30px;" class="submitt" onclick="javascrtpt:window.location.href='doDelete.jsp?msgid=<%=message.getId()%>'" />
			<input type="button" value="回  复" style="width: 60px;	height: 30px;margin-top: 5px;margin-left: 30px;" class="close" onclick="javascrtpt:window.location.href='post.jsp?receiveUname=<%= message.getSendUname() %>'" />
			<input type="button" value="返  回" style="width: 60px;	height: 30px;margin-top: 5px;margin-left: 30px;" onclick="javascrtpt:window.location.href='listMsg.jsp'" />
			<%
				}else if(pageNum.equals("3")){
			%>
			<input type="button" value="撤  回" style="width: 60px;	height: 30px;margin-top: 5px;margin-left: 30px;" class="submitt" onclick="javascrtpt:window.location.href='doDelete.jsp?msgid=<%=message.getId()%>'" />
			<input type="button" value="返  回" style="width: 60px;	height: 30px;margin-top: 5px;margin-left: 30px;" onclick="javascrtpt:window.location.href='haveSend.jsp'" />
			<%
				}
			%>
		</div>
		<div class="mailcontent">
			<div class="sender">
				<span style="float: left;margin-top: 5px">来&nbsp;&nbsp;&nbsp;自：&nbsp;</span> <div class="receiver" >&nbsp;&nbsp;<%=message.getSendUname() %></div>
			</div>
			<span class="maintext">正&nbsp;&nbsp;&nbsp;文：&nbsp;</span>
			<div class="main">
				<%= message.getNote() %>
			</div>
			<%
				if(pageNum.equals("1")||pageNum.equals("2")){
			%>
			<span style="margin-left: 50px;padding-top: 10px;">接收人：<%=loginUser.getName()%> </span>
			<%
				}else if(pageNum.equals("3")){
			%>
			<span style="margin-left: 50px;padding-top: 10px;">接收人：<%=message.getReceiveUname()%> </span>
			<%
				}
			%>
			<span style="margin-left: 20px;padding-top: 10px">邮件接收时间：[<%=Tool.Date2Str(message.getPostTime(),"yyyy-MM-dd  HH:mm:ss").substring(0, 19) %>]</span><br />
			<%
				if(pageNum.equals("1")){
			%>
			<input type="button" value="删  除" class="submitt"
				   style="width: 60px;height: 30px;margin-top: 20px;margin-left: 30px;" onclick="javascrtpt:window.location.href='doDelete.jsp?msgid=<%=message.getId()%>'"/>
			<input type="button" value="回  复" class="close"
				   style="width: 60px;height: 30px;margin-top: 20px;margin-left: 30px;" onclick="javascrtpt:window.location.href='post.jsp?receiveUname=<%= message.getSendUname() %>'"/>
			<input type="button" value="返  回" style="width: 60px;	height: 30px;margin-top: 5px;margin-left: 30px;" onclick="javascrtpt:window.location.href='unRead.jsp'" />
			<%
			}else if(pageNum.equals("2")){
			%>
			<input type="button" value="删  除" class="submitt" style="width: 60px;height: 30px;margin-top: 20px;margin-left: 30px;" onclick="javascrtpt:window.location.href='doDelete.jsp?msgid=<%=message.getId()%>'"/>
			<input type="button" value="回  复" class="close"   style="width: 60px;height: 30px;margin-top: 20px;margin-left: 30px;" onclick="javascrtpt:window.location.href='post.jsp?receiveUname=<%= message.getSendUname() %>'"/>
			<input type="button" value="返  回" style="width: 60px;	height: 30px;margin-top: 5px;margin-left: 30px;" onclick="javascrtpt:window.location.href='listMsg.jsp'" />
			<%
			}else if(pageNum.equals("3")){
			%>
			<input type="button" value="撤  回" class="submitt"
				   style="width: 60px;height: 30px;margin-top: 20px;margin-left: 30px;" onclick="javascrtpt:window.location.href='doDelete.jsp?msgid=<%=message.getId()%>'"/>
			<input type="button" value="返  回" style="width: 60px;	height: 30px;margin-top: 5px;margin-left: 30px;" onclick="javascrtpt:window.location.href='haveSend.jsp'" />
			<%
				}
			%>
		</div>
	</form>
</div>
</body>
</html>
