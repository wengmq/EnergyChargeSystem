<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%@page import="java.sql.*,util.JDBCUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户信息</title>

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
	
	  String id=request.getParameter("id");
	  System.out.print(id);
	  //String id ="201601";
	  String sql = "select * from DB43.user43 where id='"+id+"'";
	  
	  
 try {
	  	    conn = JDBCUtil.getConnection();
	  	    stmt = conn.createStatement();
	  	    rs = stmt.executeQuery(sql);
	  	    
	  	   if(rs.next()){
	  		   rs.previous();
	  		   
	  		   while(rs.next()){
	  			   
%>
      	<br><br>
    	<h1>修改用户信息</h1><br>
    	
 <form action="do_PersonalModify.jsp?id=<%=rs.getString(1) %>" method="post" > 
   	<h2>您的账户ID为：<%=rs.getString(1) %>，请修改以下的信息！</h2> 
    	
    	
  <%-- <p> 业主账号：<input type="text" name="nid" value=<%=rs.getString(1) %> required> </p> --%>
  <p> 登录密码：<input type="text" name="password" value=<%=rs.getString(2)%> required> ></p>
  <p> 用户姓名：<input type="text" name="name" value=<%=rs.getString(3) %> required>></p>
  <p> 工作单位：<input type="text" name="department" value=<%=rs.getString(4) %> required>></p>
  <p> 联系电话：<input type="text" name="phone" value=<%=rs.getString(5) %>>></p>   
  <p> 地&emsp;&emsp;址：<input type="text" name="address" value=<%=rs.getString(6) %>>></p>

<br><br>
           <p>    
                  <input type="submit" name="submit" value="确认修改"> &emsp;&emsp;&emsp;
                <!--   <a href="UserModify.jsp"><input type="button" value="返回"></a> -->
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
    
    
    
    

   
<%  if ((String)request.getAttribute("ModifySuccess") == "true") { %>
      <script>  alert("修改成功！");</script>
<%}%>        



</body>
</html>