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
		
		String str[] = new String[6];
		
		str[0] = request.getParameter("nid"); //获取需要修改信息
		str[1] = request.getParameter("password");
		str[2] = request.getParameter("name");
		str[3] = request.getParameter("department");
		str[4] = request.getParameter("phone");
		str[5] = request.getParameter("address");
		
		
		String oid = request.getParameter("oid");
		
		for(int i=0; i<str.length;i++){
			
			System.out.println(str[i]);
		}
		
		System.out.println(oid);
		for(int i=0; i<str.length;i++){//如果没有输入值则设置为空字符串
			
			if(str[i]==null)
			   str[i]="";
		}

		
		
		String sql1="select id from db43.user43 where id='"+str[0]+"'";
		String sql2 = "INSERT INTO `db43`.`user43` (`id`, `password`, `name`, `department`, `phone`, `address`) VALUES (?,?,?,?,?,?)";
		String sql3 ="delete from db43.user43 where id='"+oid+"'";
		
		String sql4 = "UPDATE `db43`.`user43` SET `password`=?, `name`=?, `department`=?, `phone`=?, `address`=?  WHERE `id`="+oid;	
		
		
		if(!oid.equals(str[0])){//有修改ID
		  
		try {
		    conn = JDBCUtil.getConnection();
		    stmt = conn.createStatement();
		    rs = stmt.executeQuery(sql1);
		    
		    if (rs.next()) {/*若在数据库中查询到相应账号信息*/
		    	
		    	request.setAttribute("AlreadyeExist", "true");			
		    	request.getRequestDispatcher("do_UserModify.jsp?id="+oid).forward(request,response);		 
		   
		        }
		    rs.previous();
		    if (!rs.next()) {/*若在数据库中未能查询到相应账号信息*/
		    	stmt.executeUpdate(sql3);//删除更改前的id
		       pstmt = conn.prepareStatement(sql2);//再插入新数据
		    
		    	for(int i=0;i<str.length;i++){
		    		pstmt.setString(i+1, str[i]);		
		    	  }
		    	
				pstmt.executeUpdate();
				
	    	    request.setAttribute("ModifySuccess", "true");
	    	    
		    	request.getRequestDispatcher("do_UserModify.jsp?id="+str[0]).forward(request,response);	
		       }
		    
		
		    
		} catch (SQLException sqle) {
		    sqle.printStackTrace();
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
		    JDBCUtil.realeaseAll(rs, stmt, conn,pstmt);
		}
}	

		
		
		if(oid.equals(str[0])){//没有修改ID
		
			  try{
				  
				  conn = JDBCUtil.getConnection();
				  pstmt = conn.prepareStatement(sql4);
				  
				  for(int i=1;i<str.length;i++){
			    		pstmt.setString(i, str[i]);		
			    	  }
			    	
					pstmt.executeUpdate();
					
		    	    request.setAttribute("ModifySuccess", "true");
		    	 
			    	request.getRequestDispatcher("do_UserModify.jsp?id="+oid).forward(request,response);	
				  
			
		} catch (SQLException sqle) {
		    sqle.printStackTrace();
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
		    JDBCUtil.realeaseAll(rs, stmt, conn,pstmt);
		}
		
		
		}
		
		
	
		
%>

<br><br><br><br>
</body>
</html>