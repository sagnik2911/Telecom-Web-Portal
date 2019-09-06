<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@page import ="java.io.*,java.sql.*,javax.sql.*,javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor= darkred>
<% 
try{
    
	Context ctx = new InitialContext();
    DataSource ds = (DataSource)ctx.lookup("java:OracleDS");
    Connection con= ds.getConnection();
    
    
    Statement st = con.createStatement();
    ResultSet rs= st.executeQuery("select * from prepaid");

    %>
    <center>
    <table border="1" style="width:50%" bgcolor="gainsboro" cellspacing=0 cellpadding="10" >
    <tr bgcolor=silver >
       
        <th><font size=3 color=black ><b>MOB NO.</b></font></th>
        <th><font size=3 color=black ><b>BALENCE</b></font></th>
       
        
        
    <%
            while(rs.next()){
    	%>
    	<tr>
    	<td height=10%><center><%= rs.getString(1)%></center></td>
    	<td height=10%><center><%= rs.getString(2)%></center></td>
    	
    	
    <% 
    }
    rs.close();
    con.close();
}catch(NamingException ex){
	out.print(ex);}
catch(Exception e){
	out.println(e);
}
%>
</tr>
</table>
</center>
</body>
</html>