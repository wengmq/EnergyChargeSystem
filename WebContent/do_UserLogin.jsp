<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@page import="java.sql.*,util.JDBCUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>do_login</title>
</head>
<body>
<%

    //接收参数
    String id=request.getParameter("id");
    String password=request.getParameter("password");


    request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;

	
	String sql = "select * from DB43.User43";

 try{
    
	 
	    conn = JDBCUtil.getConnection();
	    stmt = conn.createStatement();
	    rs = stmt.executeQuery(sql);
		   
			while(rs.next()){
			if(id.equals(rs.getString(1)) && password.equals(rs.getString(2))){
				 response.sendRedirect("UserMain.jsp?id="+id);
			break;
			   }

			}
        response.sendRedirect("login.html?msg=false");
 
 } catch (SQLException sqle) {
	    sqle.printStackTrace();
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    JDBCUtil.realeaseAll(rs, stmt, conn,pstmt);
	}
	

%>


</body>
</html>