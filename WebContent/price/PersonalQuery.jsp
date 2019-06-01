<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*,util.JDBCUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改水电气单价信息</title>
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

String qyear =request.getParameter("qyear");
String qmonth =request.getParameter("qmonth");

  String sql = "select * from DB43.Price43 where year='"+qyear+"' and month='"+qmonth+"'";
	 
  
  try {
  	    conn = JDBCUtil.getConnection();
  	    stmt = conn.createStatement();
  	    rs = stmt.executeQuery(sql);
  
      if(!rs.next()){//如果查询不到，返回相应信息
    	  request.setAttribute("CannotFind", "true");			
	    	request.getRequestDispatcher("PriceModify.jsp").forward(request,response);		
 %>     	
    	
		    	
    	  
 <%
     } else{//查询到输出信息
 %>   
	  <h1 align="center">水电气单价信息</h1>
        <table align="center" border=1 cellspacing="0" cellpadding="0">  
          <tr style="background:#C7C7C7">   
            
                <td>年份</td>  
                <td>月份 </td>  
                <td>  水单价&emsp;（元/吨）</td>  
                <td>电单价&emsp;（元/度）</td>  
                <td>燃气单价（元/立方</td>  
                          
         </tr>  
         <tr> 
 
             <td ><%=rs.getString(1) %></td>  
             <td ><%=rs.getString(2) %></td>  
             <td ><%=rs.getString(3) %></td>  
             <td ><%=rs.getString(4) %></td>  
             <td ><%=rs.getString(5) %></td>  
                     
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
  
  <a href="PersonalPrice.jsp"><button align="center"> 返&emsp;&emsp;回 </button></a>
  
</body>
</html>