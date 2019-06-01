<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="java.sql.*,util.JDBCUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
<title>用户查询</title>
<body>


  <br> <br>
  <h1 align="center">用户信息表</h1>
 <table align="center" border=1 cellspacing="0" cellpadding="0">  
      <tr style="background:#C7C7C7">   

            <td>用户账号</td>  
            <td>登录密码 </td>  
            <td>用户姓名 </td>  
            <td>工作单位</td>  
            <td>电&emsp;&emsp;话</td>  
            <td>地&emsp;&emsp;址</td>              
     </tr>  
 </table>    

<%

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8");

String x = request.getParameter("text");
String sql[]= new String[6];

  sql[0] = "select * from db43.user43 where  id ='"+x+"'";
  sql[1] = "select * from db43.user43 where  password = '"+x+"'" ;
  sql[2] = "select * from db43.user43 where  name = '"+x+"'";
  sql[3] = "select * from db43.user43 where  department = '"+x+"'" ;
  sql[4] = "select * from db43.user43 where  phone = '"+x+"'";
  sql[5] = "select * from db43.user43 where  address = '"+x+"'" ;
  
  for(int i=0;i<sql.length;i++){
	  
	  System.out.println(sql[i]);
  }
  
  
  int flag=0;
  
  for(int i=0;i<sql.length;i++){
	  
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			
			try {
			    conn = JDBCUtil.getConnection();
			    stmt = conn.createStatement();
			    rs = stmt.executeQuery(sql[i]);
			    
			    if(!rs.next()){
			    	
			    	flag++;
			    	
			    }

			    else{
			    	rs.previous();
			    	while(rs.next()){
			    		
%>					

      <table align="center" border=1 cellspacing="0" cellpadding="0">  
         <tr> 
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

	   }
			    
			    
			      } catch (SQLException sqle) {
				    sqle.printStackTrace();
				    } catch (Exception e) {
				    e.printStackTrace();
				   } finally {
				    JDBCUtil.realeaseAll(rs, stmt, conn,pstmt);
				   }		
			
  }	   
  
  if(flag==6){
  	
  	request.setAttribute("CannotFind", "true");
  	request.getRequestDispatcher("UserQuery.jsp").forward(request, response);
  	
  }

  
 %>

 

</body>
</html>