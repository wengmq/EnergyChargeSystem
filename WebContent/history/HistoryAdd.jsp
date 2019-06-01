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

<h2>录入用户水电气使用信息</h2>

<form action="do_HistoryAdd.jsp" method="post" > 
  <p> 用户账号：<input type="text" name="id" required></p>
  <p> 用户姓名：<input type="text" name="name" required></p>
  <p> 年份：<input type="text" name="year" required></p>
  <p> 月份：<input type="text" name="month" required></p>
  <p> 水用量：<input type="text" name="ShuiUse" ></p>   
  <p> 电用量：<input type="text" name="DianUse" ></p>
  <p> 燃气用量：<input type="text" name="RanqiUse" ></p>
 
  
  <p> <input type="submit" name="submit" value="确认提交"></p>
   &emsp;
   
 </form>  
   
   



<%  if ((String)request.getAttribute("AlreadyAdd") == "true") { %>
      <script>  alert("该记录已存在，请重新添加！");</script>
<%}%>   
   
<%  if ((String)request.getAttribute("AddSuccess") == "true") { %>
      <script>  alert("添加成功！");</script>
<%}%>        





</body>
</html>