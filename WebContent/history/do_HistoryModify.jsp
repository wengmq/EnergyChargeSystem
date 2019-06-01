<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%@page import="java.sql.*,util.JDBCUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改水电气使用户信息</title>

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


</head>
<body>
    <%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	
	 String id =request.getParameter("id");
	  String year =request.getParameter("year");
	  String month =request.getParameter("month");
	  
System.out.print(id);
	  
	  String sql = "select * from DB43.History43 where year='"+year+"' and month='"+month+"' and id='"+id+"'";
	  
	  
 try {
	  	    conn = JDBCUtil.getConnection();
	  	    stmt = conn.createStatement();
	  	    rs = stmt.executeQuery(sql);
	  	    
	  	   if(rs.next()){
	  		   rs.previous();
	  		   
	  		   while(rs.next()){
	  			   
%>
      	<br><br>
    	<h1>修改水电表单价信息</h1><br>
    	
 <form action="do_HistoryModify2.jsp?oyear=<%=rs.getString(3) %>&omonth=<%=rs.getString(4) %>&oid=<%=rs.getString(1) %>" method="post" > 
    <%-- 	<h2>用户账户ID为：<%=rs.getString(1) %>，请修改以下的信息！</h2> --%>
    	
   <p> 用户账号：<input type="text" name="nid" value=<%=rs.getString(1) %> required> </p>	
    <p> 用户姓名：<input type="text" name="name" value=<%=rs.getString(2) %> required> </p>	
  <p> 年份：<input type="text" name="nyear" value=<%=rs.getString(3) %> required> </p>
  <p> 月份：<input type="text" name="nmonth" value=<%=rs.getString(4)%> required> ></p>
  <p> 水用量（元）：<input type="text" name="ShuiUse" value=<%=rs.getString(5) %> required>></p>
  <p> 电用量（元）：<input type="text" name="DianUse" value=<%=rs.getString(6) %> required>></p>
  <p> 燃气用量（元）：<input type="text" name="RanqiUse" value=<%=rs.getString(7) %>  required>></p>   
 

<br><br>
           <p>    
                  <input type="submit" name="submit" value="确认修改"> &emsp;&emsp;&emsp;
                  <a href="HistoryModify.jsp"><input type="button" value="返回"></a>
           </p>
 </form>  		   
	  			
<% 	   
    }  
 }
    
      } catch (SQLException sqle) {
      sqle.printStackTrace();
      } catch (Exception e) {
       e.printStackTrace();
      } finally {
      JDBCUtil.realeaseAll(rs, stmt, conn,pstmt);
      }
  
    
%>    
    
    
    
    
<%  if ((String)request.getAttribute("AlreadyeExist") == "true") { %>
      <script>  alert("该记录已存在，请重新输入！");</script>
<%}%>   
   
<%  if ((String)request.getAttribute("ModifySuccess") == "true") { %>
      <script>  alert("修改成功！");</script>
<%}%>        



</body>
</html>