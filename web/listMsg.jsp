<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*,njust.biz.*,njust.entity.*"%>

<%
	response.setCharacterEncoding("GBK");
	User loginUser = (User) session.getAttribute("loginUser");             // ��session�л�õ�¼�û�
	if (loginUser == null) {                                                         // δ��¼��ת
		response.sendRedirect("index.jsp");
		return;
	}
	String pageNum="2";
	MessageBiz messageBiz = new MessageBiz();                                    // ��ö���Ϣҵ�����
	List<Message> messageList = messageBiz.listByReceiveUname(loginUser.getName());  // ���������Ϣ�б�Ķ���
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	  <title>�������Ϣ</title>
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
			  background-color: rgb(73,94,118);
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
		  .nav li .received{
			  color: white;
		  }
		  .nav .write:hover{
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
			  overflow: auto;
		  }
		  table{
			  margin-top: 10px;
			  margin-left: 100px;
			  font-size: 20px;
			  border: 2px solid #ccc;
			  border-radius: 4px;
			  background-color: #f8f8f8;
		  }
	  </style>
  </head>

  <body>
  <div class="head">
	  <p class="Englishname">Mail</p>
	  <p class="chinesename">����</p>
	  <p class="welcome">�𾴵��û������ã�</p>
	  <ul>
		  <li><a href="firstpage.jsp">������ҳ</a></li>
		  <li><a href="doLogout.jsp">�˳�</a></li>
		  <li><a href="changePsd.jsp">�޸�����</a> </li>
	  </ul>
  </div>
  <div class="nav">
	  <ul>
		  <li class="write"><a href="post.jsp">д��</a> </li>
		  <li class="receive"><a href="listMsg.jsp" class="received">�ռ���</a> </li>
		  <li class="send"><a href="haveSend.jsp">�ѷ���</a> </li>
	  </ul>
  </div>
  <div class="content">
	  <%
		  if(messageList.size()>0){
	  %>
	  <p style="margin-top: 30px;margin-left: 100px;font-size: 30px;color: rgb(0,27,85);">�ռ���</p>
	  <table border="1" cellspacing="0" >
		  <tr >
			  <td width="60px" height="40px">&nbsp;״  ̬</td>
			  <td width="170px" height="40px" >&nbsp;&nbsp;������</td>
			  <td width="310px" height="40px" >&nbsp;&nbsp;��  ��</td>
			  <td width="240px" height="40px" >&nbsp;&nbsp;ʱ  ��</td>
			  <td width="165px" height="40px" >&nbsp;&nbsp;��  ��</td>
		  </tr>
		  <%
			  for (int i = messageList.size()-1; i >=0 ; i--) {
				  Message message = messageList.get(i);
				  String note = message.getNote().length() > 10 ? message.getNote().substring(0, 10) + "... " : message.getNote();//������ʾ10���ַ�
				  int readSign = message.getReadSign();
		  %>
		  <tr>
			  <td width="50px" height="40px" align="center"><img src="image/<%= readSign==0 ? "new.jpg":"old.jpg" %>" style="width: 20px"/></td>
			  <td width="170px" height="40px" >&nbsp;&nbsp;<%=message.getSendUname()%></td>
			  <td width="310px" height="40px" >&nbsp;&nbsp;<a href="showMsg.jsp?messageId=<%= message.getId() %>&pageNum=<%=pageNum%>" style="text-decoration:none;color: dodgerblue">[<%=message.getSendUname() %>]�� <%= note %></a></td>
			  <td width="240px" height="40px" >&nbsp;&nbsp;<%=message.getPostTime()%> </td>
			  <td width="165px" height="40px" >&nbsp;&nbsp;<input type="button" value="ɾ  ��" onclick="javascrtpt:window.location.href='doDelete.jsp?msgid=<%=message.getId()%>'"
																  style="width: 50px;height:25px; margin-right: 20px;"/>
				  <%
					  if(readSign==0){
				  %>
				  <input type="button" value="��Ϊ�Ѷ�" onclick="javascrtpt:window.location.href='doRead.jsp?msgid=<%=message.getId()%>&pageNum=<%=pageNum%>'"
						 style="width: 63px;height:25px;"/>
				  <%
					  }else if(readSign==1){
				  %>
				  <input type="button" value="��Ϊδ��" onclick="javascrtpt:window.location.href='doSetToUnRead.jsp?msgid=<%=message.getId()%>'"
						 style="width: 63px;height:25px;"/>
				  <%
					  }
				  %>
			  </td>
		  </tr>
		  <%
			  }
		  %>
	  </table>
	  <input type="button" value="������ҳ" onclick="javascrtpt:window.location.href='firstpage.jsp'" style="width: 70px;height: 30px;margin-top: 30px;margin-left: 100px;"/><br/>
	  <%
			  }else {
		  %>
	  		<input type="button" value="������ҳ" onclick="javascrtpt:window.location.href='firstpage.jsp'" style="width: 70px;height: 30px;margin-top: 50px;margin-left: 220px;"/><br/>
		  <img src="image/noemail.png" style="margin: 50px 0 0 400px "/>
	      <%
			  }
	      %>
  </div>
  </body>
</html>
