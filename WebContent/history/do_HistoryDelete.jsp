<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@page import="java.sql.*,util.JDBCUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除使用记录</title>
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
         
       	String id   = request.getParameter("id");
       	String year = request.getParameter("year");
    	String month = request.getParameter("month");
    	
    	System.out.print(id);
    	System.out.print(year);
    	System.out.print(month);
       	String sql = "delete from DB43.History43 where year='"+year+"' and month='"+month+"'and id='"+id+"'";
       	 
       try {
       	    conn = JDBCUtil.getConnection();
       	    stmt = conn.createStatement();
       	    stmt.executeUpdate(sql);
       
         request.setAttribute("DeleteSuccess", "true");
         request.getRequestDispatcher("HistoryModify.jsp").forward(request, response);
       
         
         
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