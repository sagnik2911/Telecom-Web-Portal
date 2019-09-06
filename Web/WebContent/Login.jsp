<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
  body {text-align:center;  }
   
  #div5{
	position : absolute;
	left: 221px;
	top: 27px;
	width: 869px;
  }

#apDiv4 {
	position: absolute;
	left: 22px;
	top: 180px;
	width: 186px;
	height: 371px;
	z-index: 3;
}
#apDiv1 {
	position: absolute;
	left: 587px;
	top: 510px;
	width: 81px;
	height: 73px;
	z-index: 1;
}

#apDiv5 {
	position: absolute;
	left: 1105px;
	top: 26px;
	width: 216px;
	height: 517px;
	z-index: 4;
}
#apDiv6 {
	position: absolute;
	left: 19px;
	top: 28px;
	width: 187px;
	height: 138px;
	z-index: 5;
}
#d1 {
	position: absolute;
	left: 716px;
	top: 511px;
	width: 74px;
	height: 55px;
}
#dr2 {
	position: absolute;
	left=500px;
	top=500px;
	left: 565px;
	top: 349px;
}
body,td,th {
	color: #C60;
}
#fapDiv4 {
	position: absolute;
	left: 19px;
	top: 614px;
	width: 1228px;
	height: 156px;
	z-index: 2;
	background-image: url(Images/footer_background.jpg);
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>2nd Page</title>
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
<div id="d1"><a href= Login.html><img src="Images/BackButton.png" alt="back" width="79" height="59" title="Back"></a></div>
<div id="apDiv1"><a href="Home.html"><img src="Images/HomeIcon.png" width="91" height="56" alt="Home" title="Go to Home Page"></a></div>
<div id="div5">
<img src="Images/Ad1.jpg" width="858" height="185" alt="Ad1">

</div>

<div id="apDiv4"><img src="Images/ad2.jpg" width="181" height="359"></div>
<div id="apDiv5"><img src="Images/ad3.jpg" width="199" height="495"></div>
<div id="apDiv6"><img src="Images/Tata-Docomo-Logo-LMI.jpg" width="185" height="140"></div>
<br>
<!--<img src="error.gif">  -->
<%
	String unm = request.getParameter("t1");
	String pwd = request.getParameter("p1");
	try
	{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:OracleDS");
		Connection con = ds.getConnection();
		Statement st = con.createStatement();
		//out.println("Select * from userdet where username = '"+unm+"' password="+pwd);
		ResultSet rs;
     	rs= st.executeQuery("Select * from userdet where mob_no = '"+unm+"' or username = '"+unm+"'");
		
		if(rs.next())
		{
			
			{if(pwd.equals(rs.getString(3)))
					{
										
						//session.setAttribute("stype",rs.getString(4));
						if(rs.getString(4).equalsIgnoreCase("ADMIN"))
						{
							session.setAttribute("unm",unm);
							response.sendRedirect("Admin_home.jsp");
							
							
						}
						else
						{
							session.setAttribute("unm",unm);
							response.sendRedirect("Cust_Home.jsp");
						}
					}
			else
				{
				%>
				<div id="dr2">
				<%
				out.println("<hr><h2>Wrong Password!</h2><hr>");
				}
			%>
			</div>
		<%
			
		}
		}
		else
		{%>
		<div id="dr2">
		<%
			out.println("<hr><h2>No such User found!</h2><hr>");
			
		%>
		</div>
		<br>
		
		<%
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}

%>
</body>
</html>