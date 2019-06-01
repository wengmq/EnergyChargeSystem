<%@ page import="java.sql.*,util.JDBCUtil" language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加用户</title>
<link rel="stylesheet" type="text/css" href="../css/ErrorTip.css" />
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
		
		String str[] = new String[6];
		
		str[0] = request.getParameter("id"); //获取需要修改信息
		str[1] = request.getParameter("password");
		str[2] = request.getParameter("name");
		str[3] = request.getParameter("department");
		str[4] = request.getParameter("phone");
		str[5] = request.getParameter("address");
		
		
		for(int i=0; i<str.length;i++){//如果没有输入值则设置为空字符串
			
			if(str[i]==null)
			   str[i]="";
		}

		
		String sql1="select id from db43.user43 where id='"+str[0]+"'";
		String sql2 = "INSERT INTO `db43`.`user43` (`id`, `password`, `name`, `department`, `phone`, `address`) VALUES (?,?,?,?,?,?)";
		
		try {
		    conn = JDBCUtil.getConnection();
		    stmt = conn.createStatement();
		    rs = stmt.executeQuery(sql1);
		    
		    if (rs.next()) {/*若在数据库中查询到相应账号信息*/
		    	
		    	request.setAttribute("AlreadyAdd", "true");			
		    	request.getRequestDispatcher("UserAdd.jsp").forward(request,response);		 
		   
		        }
		    
		    else {//插入数据
		    	
		    pstmt = conn.prepareStatement(sql2);
		    
		    	for(int i=0;i<str.length;i++){
		    		pstmt.setString(i+1, str[i]);		
		    	  }
		    	
				pstmt.executeUpdate();
				
	    	    request.setAttribute("AddSuccess", "true");
		    	request.getRequestDispatcher("UserAdd.jsp").forward(request,response);	
		       }
		    
		
		    
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