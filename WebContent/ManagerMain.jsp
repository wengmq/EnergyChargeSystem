<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>managerMain</title>


</head>
<% String id=request.getParameter("id"); %>


<FRAMESET id=index 
border=5 frameSpacing=0 rows=60,* frameBorder=1>

  <FRAME id=topFrame 
name=topFrame src="top.jsp?id=<%= request.getParameter("id") %>" noResize scrolling=no>

  <FRAMESET 
border=5 frameSpacing=0 frameBorder=1 cols=180px,*>

  <FRAME id=leftFrame 
name=leftFrame src="ManagerLeft.jsp?id=<%= request.getParameter("id") %>" noResize scrolling=no>

<FRAME 
id=mainFrame name=mainFrame src="main.jsp" noResize 
scrolling=yes>


  </FRAMESET>
</FRAMESET>

 
   

</html>