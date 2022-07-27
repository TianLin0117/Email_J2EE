# Email_J2EE
An email system completed by J2EE


配置说明
1.安装mysql 5.7，root密码1234，启动MySQL，并添加sms用户，具有DBA权限
2.安装数据库管理工具 Mysql Workbench 6.3 CE
3.用sms用户登陆，创建名为sms的数据库，使用gb2312字符
4.运行本项目提供的sql代码,在sms数据库中创建tbl_message和tbl_user表
5.安装JDK 7.0.86
6.安装Tomcat 7,打开在Tomcat安装目录中的bin文件夹，找到catalina.bat文件，用记事本打开，
  找到set JAVA_HOME和set JRE_HOME，jdk的安装目录配置到set JAVA_HOME,jre7的安装目录配置到set JRE_HOME。
  再打开Tomcat安装目录中的conf文件夹，找到server.xml,用记事本打开，查找所有“8080”字样改为“8888”并保存。
7.安装IntelliJ IDEA 14.1.5
8.将整个项目用IntelliJ打开，在工具栏file中点击setting进行配置，在Editor中将File Encoding中的ide enconding和
  project encoding设置为GBK；下拉Build，Execution...点击applicatiion Sercers进行添加Tomcat Server；
  在plugins中，将所有选项全部勾选，最后点击apply完成当前配置。
9.以上配置好后，在工具栏file中点击Project Structure进行配置，点击Project配置project SDK为1.7版本；
  点击Libraries导入mysql库文件，点击apply;在Artifacts中查看是否成功将MySQL库文件成功导入，若lib目录下
  有mysql库文件则导入成功，否则点击右下角fix即可完成导入，最后点击apply即可。
10.在工具栏中选择Run,点击其中Edit Configuration,将application Server 配置成Tomcat 7.0.86
   在Development中将application context 设置为 /bbs_Meg1(注意大小写)；点击apply完成配置。
11.将bbs_Meg1.war复制到Tomcat安装目录下的webapps文件夹下，再到安装目录下的bin文件夹中以管理员身份运行
   startup.bat启动Tomcat
12.打开浏览器在地址栏输入localhost:8888/bbs_Meg1/即可访问。
13.完成。 
