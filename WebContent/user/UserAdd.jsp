<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<style type="text/css">
body 
  {  
  background-image:url(../images/f.jpg);
  background-repeat:no-repeat;
  background-attachment:fixed;
  background-size: cover;
  margin:0 auto;
  text-align:center
  }
  </style>
</head>
<body>



<%-- 欢迎您<%= request.getParameter("id") %>! --%> 

<h2>录入用户信息</h2>

<form action="do_UserAdd.jsp" method="post" > 
  <p> 用户账号：<input type="text" name="id" required></p>
  <p> 登录密码：<input type="text" name="password" required></p>
  <p> 用户姓名：<input type="text" name="name" required></p>
  <p> 工作单位：<input type="text" name="department" required></p>   
  <p> 联系电话：<input type="text" name="phone" ></p>
  <p> 地&emsp;&emsp;址：<input type="text" name="address" ></p>
 
  
  <p> <input type="submit" name="submit" value="确认提交"></p>
   &emsp;
   
 </form>  
   
   



<%  if ((String)request.getAttribute("AlreadyAdd") == "true") { %>
      <script>  alert("该用户已存在，请重新添加！");</script>
<%}%>   
   
<%  if ((String)request.getAttribute("AddSuccess") == "true") { %>
      <script>  alert("添加成功！");</script>
<%}%>        





</body>
</html>