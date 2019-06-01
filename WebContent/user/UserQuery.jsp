<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户查询</title>
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

    <h1>用户查询 </h1>
    <form action="do_UserQuery.jsp" method="post"><br><br>
      <h2>	<p>请输入信息：<input type="text" name="text"></p></h2>
      	  &emsp;
      	<p><input type="submit" name="submit" value="查询"></p>
      
      </form>

 <%  if ((String)request.getAttribute("CannotFind") == "true") { %>
      <script>  alert("未查询到该用户");</script>
<%}%> 
</body>
</html>