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
    ResultSet rs= st.executeQuery("select * from clientdet");

    %>
    <center>
    <table border="1" style="width:60% "  bgcolor="gainsboro" cellspacing=0 cellpadding="5" >
    <tr bgcolor=silver >
        <th ><font size=3 color=black ><b> SIM NO.</b></font></th>
        <th ><font size=3 color=black ><b>MOB NO.</b></font></th>
        <th ><font size=3 color=black ><b>NAME</b></font></th>
        <th ><font size=3 color=black ><b>EMAIL ID</b></font></th>
        <th ><font size=3 color=black ><b>CONNECTION TYPE</b></font></th>
        <th ><font size=3 color=black ><b>CONNECTION STATUS</b></font></th>
        <th ><font size=3 color=black ><b>ADDRESS</b></font></th>
        <th ><font size=3 color=black ><b>CITY</b></font></th>
        <th ><font size=3 color=black ><b>COUNTRY</b></font></th>
        <th ><font size=3 color=black ><b>PIN CODE</b></font></th>
        </tr>
        
    <%
    while(rs.next()){
    	%>
    	<tr>
    	<td height=10%><font size=2><%= rs.getString(1)%></font></td>
    	<td height=10%><font size=2> <%=rs.getString(2) %></font></td>
    	<td height=10%><font size=2><%= rs.getString(3)%></font></td>
    	<td height=10%><font size=2><%= rs.getString(5)%></font></td>
    	<td height=10%><center><font size=2><%= rs.getString(7)%></font></center></td>
    	<td height=10%><center><font size=2><%= rs.getString(8)%></font></center></td>
    	<td height=10%><font size=2><%= rs.getString(6)%></font></td>
    	<td height=10%><font size=2><%= rs.getString(4)%></font></td>
    	<td height=10%><center><font size=2><%=  rs.getString(9)%></font></center></td>
    	<td height=10%><font size=2><%= rs.getString(10)%></font></td>
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