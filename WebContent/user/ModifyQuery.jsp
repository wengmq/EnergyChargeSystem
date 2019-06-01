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
  text-align:center;
  }
  
  td{
    width:100px;
    
  
  }
  
  tr{
    height:50px; 
  }
  tr:hover{
background-color: #CAE1FF;
}
  </style>
</head>
<body>
<script type="text/javascript">

function beforeDelete(){ return confirm("您是否确认删除该记录？");}

</script>
  
<% if ((String)request.getAttribute("msg") == "true") { %>
 <script>  alert("成功删除"); </script>
<%  } %>
  


<%

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
PreparedStatement pstmt = null;

  String qid=request.getParameter("qid");
  String sql = "select * from DB43.user43 where id='"+qid+"'";
	 
  
  try {
  	    conn = JDBCUtil.getConnection();
  	    stmt = conn.createStatement();
  	    rs = stmt.executeQuery(sql);
  
      if(!rs.next()){//如果查询不到，返回相应信息
    	  request.setAttribute("CannotFind", "true");			
	    	request.getRequestDispatcher("UserModify.jsp").forward(request,response);		
 %>     	
    	
		    	
    	  
 <%
     } else{//查询到输出信息
 %>   
	  <h1 align="center">用户信息</h1>
        <table align="center" border=1 cellspacing="0" cellpadding="0">  
          <tr style="background:#C7C7C7">   
                <td>操&emsp;&emsp;作</td>  
                <td>操&emsp;&emsp;作</td>  
                <td>用户账号</td>  
                <td>登录密码 </td>  
                <td>用户姓名 </td>  
                <td>工作单位</td>  
                <td>电&emsp;&emsp;话</td>  
                <td>地&emsp;&emsp;址</td>              
         </tr>  
         <tr> 
             <td ><a href="do_UserModify.jsp?id=<%=rs.getString(1)%>" >修改</a></td>    
             <td ><a href="do_UserDelete.jsp?id=<%=rs.getString(1)%>" onclick="return beforeDelete();">删除</a></td>   
             <td ><%=rs.getString(1) %></td>  
             <td ><%=rs.getString(2) %></td>  
             <td ><%=rs.getString(3) %></td>  
             <td ><%=rs.getString(4) %></td>  
             <td ><%=rs.getString(5) %></td>  
             <td ><%=rs.getString(6) %></td>          
         </tr>
       </table>
       
       
  <%
  
    } 
       
      } catch (SQLException sqle) {
      sqle.printStackTrace();
      } catch (Exception e) {
      e.printStackTrace();
      } finally {
     JDBCUtil.realeaseAll(rs, stmt, conn,pstmt);
     }
  
  %>  
  <br>  <br>  <br>  <br>
  
  <a href="UserModify.jsp"><button align="center"> 返&emsp;&emsp;回 </button></a>
  
</body>
</html>