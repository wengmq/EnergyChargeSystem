<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加单价表</title>
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
<h2>录入水电气单价信息</h2>

<form action="do_PriceAdd.jsp" method="post" > 
  <p>&emsp;&emsp; 年&emsp;&emsp;份：<input type="text" name="year" required></p>
  <p> &emsp;&emsp;月&emsp;&emsp;份：<input type="text" name="month" required></p>
  <p> 水单价&emsp;（元/吨）：<input type="text" name="shui" required></p>
  <p> 电单价&emsp;（元/度）：<input type="text" name="dian" required></p>   
  <p> 燃气单价（元/立方）：<input type="text" name="ranqi" required></p>
  
 
  
  <p> <input type="submit" name="submit" value="确认提交"></p>
   &emsp;
   
 </form>  
   
   



<%  if ((String)request.getAttribute("AlreadyAdd") == "true") { %>
      <script>  alert("该已存记录在，请重新添加！");</script>
<%}%>   
   
<%  if ((String)request.getAttribute("AddSuccess") == "true") { %>
      <script>  alert("添加成功！");</script>
<%}%>        





</body>
</html>