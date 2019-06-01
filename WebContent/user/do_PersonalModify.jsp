<%@ page import="java.sql.*,util.JDBCUtil" language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>保存用户信息</title>
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

	<%
	
	
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		String str[] = new String[5];
		

		str[0] = request.getParameter("password");
		str[1] = request.getParameter("name");
		str[2] = request.getParameter("department");
		str[3] = request.getParameter("phone");
		str[4] = request.getParameter("address");
		
		
		String id = request.getParameter("id");
		
		for(int i=0; i<str.length;i++){
			
			System.out.println(str[i]);
		}
		
	
		for(int i=0; i<str.length;i++){//如果没有输入值则设置为空字符串
			
			if(str[i]==null)
			   str[i]="";
		}

		

		
		String sql = "UPDATE `db43`.`user43` SET `password`=?, `name`=?, `department`=?, `phone`=?, `address`=?  WHERE `id`="+id;	
		
		
		
		
		
		
			  try{
				  
				  conn = JDBCUtil.getConnection();
				  pstmt = conn.prepareStatement(sql);
				  
				  for(int i=0;i<str.length;i++){
			    		pstmt.setString(i+1, str[i]);		
			    	  }
			    	
					pstmt.executeUpdate();
					
		    	    request.setAttribute("ModifySuccess", "true");
		    	 
			    	request.getRequestDispatcher("PersonalModify.jsp?id="+id).forward(request,response);	
				  
			
		} catch (SQLException sqle) {
		    sqle.printStackTrace();
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
		    JDBCUtil.realeaseAll(rs, stmt, conn,pstmt);
		}
		
		
				
		
	
		
%>

<br><br><br><br>
</body>
</html>