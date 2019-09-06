<%@ page language="java" contentType="text/html; charset=iso-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {text-align:center; color:"#c60" }
h1 {text-align:center;}
h2 {text-align:center;}
#d1 {
	position: absolute;
	left: 599px;
	top: 493px;
	width: 98px;
	height: 70px;
}
#apDiv1 {
	position: absolute;
	left: 520px;
	top: 639px;
	width: 81px;
	height: 73px;
	z-index: 1;
}
#apDiv6 {
	position: absolute;
	left: 180px;
	top: 22px;
	width: 1146px;
	height: 135px;
	z-index: 1;
	text-align: center
}
#apDiv3 {
	position: absolute;
	left: 29px;
	top: 22px;
	width: 170px;
	height: 185px;
	z-index: 3;
}
#apDiv4 {
	position: absolute;
	left: 1005px;
	top: 249px;
	width: 254px;
	height: 346px;
	z-index: 4;
}
#apDiv5 {
	position: absolute;
	left: 32px;
	top: 236px;
	width: 257px;
	height: 369px;
	z-index: 5;
}
#dr2 {
	position: absolute;
	left=500px;
	top=500px;
	left: 459px;
	top: 333px;
}
body,td,th {
	color: #C60;
	font-size:25px;
}
#apDiv2 {
	position: absolute;
	left: 349px;
	top: 252px;
	width: 611px;
	height: 136px;
	z-index: 6;
	color: #C60;
}
#apDiv7 {
	position: absolute;
	left: 649px;
	top: 407px;
	width: 149px;
	height: 96px;
	z-index: 7;
}
#fapDiv12 {
	position: absolute;
	left: 32px;
	top: 629px;
	width: 1230px;
	height: 183px;
	z-index: 10;
	text-align: center;
	background-color: #D6D6D6;
	background-image: url(Images/footer_background.jpg);
}
#apDiv8 {
	position: absolute;
	left: 518px;
	top: 416px;
	width: 124px;
	height: 90px;
	z-index: 11;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>View Balance</title>
</head>
<body>
<div id="fapDiv12">
  <p>&nbsp;</p>
  <p>Tata is a registered trademark of Tata Sons Ltd. The DOCOMO logo is a trademark  of NTT DOCOMO, INC. (Japan) in India.<br>
    &copy;&nbsp;2015 Tata DOCOMO | Powered by&nbsp;iem<br>
    Follow us @ facebook and twitter<br>
    Best 3G mobile phones, 3G data card, 3G services in India from Tata  DOCOMO. Enjoy Tata DOCOMO 3G Services in India with best<br>
  3G mobile phone and 3G data card.</p>
</div>
<div id="apDiv6"><img src="Images/Ad1.jpg" width="896" height="185" alt="AD"></div>
<div id="apDiv3"><img src="Images/logo.jpg" width="258" height="185" alt="Logo"></div>
<div id="apDiv4"><img src="Images/Ad2.gif" width="213" height="352" alt="AD"></div>
<div id="apDiv5"><img src="Images/ad3.jpg" width="252" height="365" alt="Ad"></div>
<div id="apDiv2">
  <div align="center">
    <%
  
    try{
    	String unm=session.getAttribute("unm").toString();
    Context ctx=new InitialContext();
	DataSource ds=(DataSource)ctx.lookup("java:OracleDS");
	Connection con=ds.getConnection();
	Statement st=con.createStatement();
	ResultSet rs= st.executeQuery("Select * from userdet where mob_no = '"+unm+"' or username = '"+unm+"'");
	if(rs.next())
	{
		String mob=rs.getString(2).toString();
		Statement st2=con.createStatement();
		ResultSet rs2= st2.executeQuery("Select * from prepaid where mob_no = '"+mob+"'");
		if(rs2.next())
		{
			String mobile=rs2.getString(1);
			String bal=rs2.getString(2);
			 out.println("<center><br><table cellpadding=5 border=0>");
				
				out.println("<tr>");
				out.println("<th>Mobile Number:</th>");
				out.println("<td>"+ mobile+"</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>Balance:</th>");
				out.println("<td>"+ bal+"</td>");
				out.println("</tr></table></center>");	
		}
		else
		{
		 
			out.println("<hr><h2>Phone is not a prepaid number</h2><hr>");
				
		}
		
	}
    }catch(Exception e)
    {
    	response.sendRedirect("Problem.html");
    }
%>
  </div>
</div>
<div id="apDiv7"><a href="Logout.jsp"><img src="Images/canstock21253555.jpg" width="103" height="92" title="Log Out"></a></div>
<div id="apDiv8"><a href="Cust_Home.jsp"><img src="Images/BackButton.png" width="97" height="76" title="Back" alt="Back"></a></div>
</body>
</html>