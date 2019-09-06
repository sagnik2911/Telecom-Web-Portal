<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recharge</title>
<style type="text/css">
#d1 {
	position: absolute;
	left: 716px;
	top: 511px;
	width: 74px;
	height: 55px;
}
#apDiv1 {
	position: absolute;
	left: 587px;
	top: 510px;
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
	height: 363px;
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
}
#fapDiv4 {
	position: absolute;
	left: 34px;
	top: 614px;
	width: 1213px;
	height: 156px;
	z-index: 2;
	background-image: url(Images/footer_background.jpg);
}
</style>
</head>
<body>
<div id="fapDiv4">
  <center><p>&nbsp;</p>
    <p>Tata is a registered trademark of Tata Sons Ltd. The DOCOMO logo is a  trademark of NTT DOCOMO, INC. (Japan) in India.<br>
      &copy;&nbsp;2015 Tata DOCOMO | Powered by&nbsp;iem<br>
      Follow us @ facebook and twitter<br>
      Best 3G mobile phones, 3G data card, 3G services in India from Tata  DOCOMO. Enjoy Tata DOCOMO 3G Services in India with best<br>
      3G mobile phone and 3G data card.</p>
  </center>
</div>
<div id="apDiv6"><img src="Images/Ad1.jpg" width="896" height="185" alt="AD"></div>
<div id="apDiv3"><img src="Images/logo.jpg" width="258" height="185" alt="Logo"></div>
<div id="apDiv4"><img src="Images/Ad2.gif" width="213" height="352" alt="AD"></div>
<div id="apDiv5"><img src="Images/ad3.jpg" width="252" height="365" alt="Ad"></div>
<div id="apDiv1"><a href="Home.html"><img src="Images/HomeIcon.png" width="91" height="56" alt="Home" title="Go to Home Page"></a></div>
<div id="d1"><a href= Recharge.html><img src="Images/BackButton.png" alt="back" width="79" height="59" title="Back"></a></div>
<%

try
{
	String mob = request.getParameter("t1");
	String rec = request.getParameter("t2");
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:OracleDS");
	Connection con = ds.getConnection();
	Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("Select * from clientdet where mob_no = '"+mob+"' and connection_status='Active'");
	if(rs.next())
	{
		String contype = rs.getString(7);
		if(contype.equalsIgnoreCase("Prepaid"))
		{
			session.setAttribute("mno",mob);
			session.setAttribute("rec",rec);
			response.sendRedirect("Payment0.jsp");
		}
		else
		{ %>
		<div id="dr2">
		<%
			out.println("<hr><h2>Sorry.The mobile number is not a prepaid number</h2><hr>");
		%>
		</div>
		<%
		}
		
	}
	else
	{
		%>
		<div id="dr2">
		<%
		out.println("<hr><h2>Sorry.The mobile number is not present<br> in the database</h2><hr>");
		%>
		</div>
		<%
	}
	
}
catch (Exception e)
{
	response.sendRedirect("Problem.html");
}


%>

</body>
</html>