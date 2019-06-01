<%@ page import="java.sql.*,util.JDBCUtil" language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改水电气单价户信息</title>
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
		
		str[0] = request.getParameter("nyear"); //获取需要修改信息
		str[1] = request.getParameter("nmonth");
		str[2] = request.getParameter("shui");
		str[3] = request.getParameter("dian");
		str[4] = request.getParameter("ranqi");

		
		  String oyear =request.getParameter("oyear");
		  String omonth =request.getParameter("omonth");
		

		
		for(int i=0; i<str.length;i++){
			
			System.out.println(str[i]);
		}
		
		System.out.println(oyear);
		System.out.println(omonth);

		
		
		
		for(int i=0; i<str.length;i++){//如果没有输入值则设置为空字符串
			
			if(str[i]==null)
			   str[i]="";
		}

		
		
		String sql1="select * from db43.Price43 where year='"+str[0]+"' and month='"+str[1]+"'";
		String sql2 = "INSERT INTO `db43`.`Price43` (`year`, `month`, `shui`, `dian`, `ranqi`) VALUES (?,?,?,?,?)";
		String sql3 ="delete from db43.Price43 where year='"+oyear+"' and month='"+omonth+"'";
		
		String sql4 = "UPDATE `db43`.`Price43` SET `shui`=?, `dian`=?, `ranqi`=?  WHERE `year`='"+oyear+"' and month='"+omonth+"'";
		
		
		if(oyear.equals(str[0])==false||omonth.equals(str[1])==false){//有修改年月
		  
		try {
		    conn = JDBCUtil.getConnection();
		    stmt = conn.createStatement();
		    rs = stmt.executeQuery(sql1);
		    
		    if (rs.next()) {/*若在数据库中查询到相应账号信息*/
		    	
		    	request.setAttribute("AlreadyeExist", "true");			
		    	request.getRequestDispatcher("do_PriceModify.jsp?year="+oyear+"&month="+omonth).forward(request,response);		 
		   
		        }
		    
		    rs.previous();
		    if (!rs.next()) {/*若在数据库中未能查询到相应账号信息*/
		    	stmt.executeUpdate(sql3);//删除更改前的记录
		       pstmt = conn.prepareStatement(sql2);//再插入新数据
		    
		    	for(int i=0;i<str.length;i++){
		    		pstmt.setString(i+1, str[i]);		
		    	  }
		    	
				pstmt.executeUpdate();
				
	    	    request.setAttribute("ModifySuccess", "true");
	    	    
		    	request.getRequestDispatcher("do_PriceModify.jsp?year="+str[0]+"&month="+str[1]).forward(request,response);	
		       }
		    
		
		    
		} catch (SQLException sqle) {
		    sqle.printStackTrace();
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
		    JDBCUtil.realeaseAll(rs, stmt, conn,pstmt);
		}
}	

		
		
		if(oyear.equals(str[0])&&omonth.equals(str[1])){//没有修改年月
		
			  try{
				  
				  conn = JDBCUtil.getConnection();
				  pstmt = conn.prepareStatement(sql4);
				  
				  for(int i=2;i<str.length;i++){
			    		pstmt.setString(i-1, str[i]);		
			    	  }
			    	
					pstmt.executeUpdate();
					
		    	    request.setAttribute("ModifySuccess", "true");
		    	 
			    	request.getRequestDispatcher("do_PriceModify.jsp?year="+oyear+"&month="+omonth).forward(request,response);	
				  
			
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