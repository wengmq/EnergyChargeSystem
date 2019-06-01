<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*,util.JDBCUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>历史记录信息</title>

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
    width:80px;
    
  
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
      

  
  
      
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8");
 
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
      
	String id = request.getParameter("id");
	//String id= "201601";
	
	String sql = "select * from DB43.result where id='"+id+"'";
	 
try {
	    conn = JDBCUtil.getConnection();
	    stmt = conn.createStatement();
	    rs = stmt.executeQuery(sql);

     
     int pageSize=5;  //每一页要展示的记录条数
     int pageCount;  //总页数
     int showPage;   //页码
     
     //将游标移到最后一行   
     rs.last();  
   
     //获取最后一行的行号   
     int recordCount=rs.getRow();  
     
     //计算分页后的总数   
     pageCount=(recordCount%pageSize==0)?(recordCount/pageSize):(recordCount/pageSize+1);  
       
     //获取用户想要显示的页数：  
     String integer=request.getParameter("showPage");  
     if(integer==null){  
         integer="1";  
     }  
     try{showPage=Integer.parseInt(integer);  
     }catch(NumberFormatException e){  
         showPage=1;  
     }  
     if(showPage<=1){  
         showPage=1;  
     }  
     if(showPage>=pageCount){  
         showPage=pageCount;  
     }  
       
     //如果要显示第showPage页，那么游标应该移动到的position的值是：  
     int position=(showPage-1)*pageSize+1;  
     
     //设置游标的位置  
     rs.absolute(position);  
%>
      <br> <br>
      <h1 align="center">用户记录表</h1>
       <table align="center" border=1 cellspacing="0" cellpadding="0">  
          <tr style="background:#C7C7C7">   
                <td>用户账号</td>  
                <td>用户姓名</td>  
                <td>年份</td>  
                <td>月份 </td>  
                <td>水用量（/吨） </td>  
                <td>电用量（/度）</td>  
                <td>燃气用量（/立方）/</td>  
                <td>水单价（元/吨）</td>         
                <td>电单价（元/度）</td>  
                <td>燃气单价（元/立方）</td>  
                <td>月水费（元）</td>  
                <td>月电费（元）</td> 
                <td>月燃气费（元）</td>
                <td>月总费用（元）</td>
   
         </tr>  
     </table>  
       
<%  //用for循环显示本页中应显示的的记录  
   if(showPage!=pageCount){                  
     for(int i=1;i<=pageSize;i++){  
%> 

     <table align="center" border=1 cellspacing="0" cellpadding="0">  
         <tr> 
             <td ><%=rs.getString(1) %></td>  
             <td ><%=rs.getString(2) %></td>  
             <td ><%=rs.getString(3) %></td>  
             <td ><%=rs.getString(4) %></td>  
             <td ><%=rs.getString(5) %></td>  
             <td ><%=rs.getString(6) %></td>        
             <td ><%=rs.getString(7) %></td>  
             <td ><%=rs.getString(8) %></td>  
             <td ><%=rs.getString(9) %></td>  
             <td ><%=rs.getString(10) %></td>  
             <td ><%=rs.getString(11) %></td>  
             <td ><%=rs.getString(12) %></td> 
             <td ><%=rs.getString(13) %></td>  
             <td ><%=rs.getString(14) %></td>  
                
                
         </tr>   
     </table>  
               
 <%   
    rs.next();  
      }      	 
  }   
 %>  
 
 <%
   if(showPage==pageCount){//显示最后一页时
	 
	 for(int j=1;j<=recordCount-pageSize*(pageCount-1);j++){  

 %>
      <table align="center" border=1 cellspacing="0" cellpadding="0">  
         <tr> 

             <td ><%=rs.getString(1) %></td>  
             <td ><%=rs.getString(2) %></td>  
             <td ><%=rs.getString(3) %></td>  
             <td ><%=rs.getString(4) %></td>  
             <td ><%=rs.getString(5) %></td>  
             <td ><%=rs.getString(6) %></td>        
             <td ><%=rs.getString(7) %></td>  
             <td ><%=rs.getString(8) %></td>  
             <td ><%=rs.getString(9) %></td>  
             <td ><%=rs.getString(10) %></td>  
             <td ><%=rs.getString(11) %></td>  
             <td ><%=rs.getString(12) %></td> 
             <td ><%=rs.getString(13) %></td>  
             <td ><%=rs.getString(14) %></td>      
         </tr>   
     </table>  
             
<%   
    rs.next();  
   }     
}   	 
 
%> 
 
 <br>   <br> 
 第<%=showPage %>页（共<%=pageCount %>页）  
 <br>  
 <a href="PersonalHistory.jsp?showPage=1&id=<%= request.getParameter("id") %>">首页</a>  
 <a href="PersonalHistory.jsp?showPage=<%=showPage-1%>&id=<%= request.getParameter("id") %>">上一页</a>  
<%  
     //根据pageCount的值显示每一页的数字并附加上相应的超链接  
     for(int i=1;i<=pageCount;i++){  
%>  
         <a href="PersonalHistory.jsp?id=<%= request.getParameter("id") %>&showPage=<%=i%>"><%=i%></a>  
<%   
    }  
%>     
 <a href="PersonalHistory.jsp?showPage=<%=showPage+1%>&id=<%= request.getParameter("id") %>">下一页</a>  
 <a href="PersonalHistory.jsp?showPage=<%=pageCount%>&id=<%= request.getParameter("id") %>">末页</a>  
 <!-- 通过表单提交用户想要显示的页数 -->  
 <form action="" method="get">  
     跳转到第<input type="text" name="showPage" size="4">页  
     <input type="submit" name="submit" value="跳转">  
 </form>     
  
<%
 
    } catch (SQLException sqle) {
    sqle.printStackTrace();
    } catch (Exception e) {
    e.printStackTrace();
   } finally {
    JDBCUtil.realeaseAll(rs, stmt, conn,pstmt);
   }

 %>   
 
<!-- 
<form action="ModifyQuery.jsp" method="get">  
   <h2>
               输入用户ID查询:&emsp;<input type="text" name="qid" size="8"> &emsp;&emsp;&emsp;&emsp;
       <input type="submit" name="submit" value="查询">   
   </h2>
</form>      -->

    
<%  if ((String)request.getAttribute("CannotFind") == "true") { %>
      <script>  alert("未查询到该用户");</script>
<%}%> 
 
<%  if ((String)request.getAttribute("DeleteSuccess") == "true") { %>
      <script>  alert("删除成功");</script>
<%}%> 
      
</body>
</html>