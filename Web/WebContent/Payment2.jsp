<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, javax.sql.*,javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>
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
	height: 467px;
	z-index: 5;
}
#dr2 {
	position: absolute;
	left=400px;
	top=500px;
	left: 459px;
	top: 333px;
}
#fdiv1 {
	position: absolute;
	left: 538px;
	top: 224px
}
#fdiv3 {
	position: absolute;
	left: 503px;
	top: 224px;
	color : black;
}
#fdiv2 {
	position: absolute;
	left: 646px;
	top: 333px
}
#fapDiv1 {
	position: absolute;
	left: 160px;
	top: 14px;
	width: 952px;
	height: 114px;
	z-index: 1;
}
#fapDiv2 {
	position: absolute;
	left: 490px;
	top: 379px;
	width: 411px;
	height: 90px;
	z-index: 2;
}

#fapDiv3 {
	position: absolute;
	left: 618px;
	top: 345px;
	width: 70px;
	height: 60px;
	z-index: 3;
}
body,td,th {
	color: #C60
}
#foDiv4 {
	position: absolute;
	left: 33px;
	top: 614px;
	width: 1214px;
	height: 156px;
	z-index: 2;
	background-image: url(Images/footer_background.jpg);
}
</style>
</head>
<body>

<%
	
    try
    {
    	String cno = session.getAttribute("cardno").toString();
    	String rec = session.getAttribute("rec").toString();
    	int r = Integer.parseInt(rec);
    	String m = session.getAttribute("mno").toString();
    	String pass = request.getParameter("pwd");
    	Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:OracleDS");
		Connection con = ds.getConnection();
		Statement st = con.createStatement();
		ResultSet rs;
	 	rs= st.executeQuery("Select * from card_db where card_no='"+cno+"' and password='"+pass+"'");
	 	if(rs.next())
	 	{%>
	 		<div id="foDiv4">
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
	 		<%
	 		//out.println("Recharge of Rs."+r+" for mobile no "+ m+" is successful!");
	 		Statement st2 = con.createStatement();
			ResultSet rs2 = st2.executeQuery("Select * from clientdet where mob_no='"+m+"'");
			if(rs2.next())
			{String t = rs2.getString(7);
			  if(t.equalsIgnoreCase("prepaid"))
					  {
				  Statement st3 = con.createStatement();
					ResultSet rs3 = st3.executeQuery("Select * from prepaid where mob_no='"+m+"'");
				  			if(rs3.next())
							{String bal = rs3.getString(2);
				  			int b = Integer.parseInt(bal);
				  			b=b+r;
				  			PreparedStatement ps= con.prepareStatement("update prepaid set balance = ? where mob_no = '"+m+"' ");
				  			ps.setInt(1,b);
				  			ps.executeUpdate();
				  			out.println("<div id=\"dr2\">");
				  			out.println("<hr><h2>Recharge of Rs."+r+" for mobile no "+ m+"<br> is successful!");
				  			out.println("<br>Current Balance: "+b+"</h2><hr>");
				  			out.println("</div>");
							}
				  		}
			  else if(t.equalsIgnoreCase("postpaid"))
			  {
				  Statement st3 = con.createStatement();
					ResultSet rs3 = st3.executeQuery("Select * from postpaid where mob_no='"+m+"'");
				  if (rs3.next())
					{String due = rs3.getString(2);
				  int b = Integer.parseInt(due);
		  			b=b-r;
		  			PreparedStatement ps= con.prepareStatement("update postpaid set billdue  = ? where mob_no = '"+m+"' ");
		  			ps.setInt(1,b);
		  			ps.executeUpdate();
		  			out.println("<div id=\"dr2\">");
		  			out.println("<hr><h2>Payment of Rs."+r+" for mobile no "+ m+"<br> is successful!");
		  			out.println("<br>Bill due: "+b);
		  			out.println("</h2><hr></div>");
					}
			  }
			  Statement st4 = con.createStatement();
			  ResultSet rs3 = st4.executeQuery("Select * from card_db where card_no='"+cno+"'");
			  if(rs3.next())
			  { int d = rs3.getInt(6);
			  PreparedStatement ps1= con.prepareStatement("update card_db set bill_due  = ? where card_no= '"+cno+"' ");	  
			  ps1.setInt(1,r+d);
	  		  ps1.executeUpdate();
			  }
			  session.invalidate();
			
			  }
			else
				out.println("No rec found");
				
			}
	 	else
	 	{%>
	 		<div id="fapDiv1"><img src="Images/payment_gateway-Copy.jpg" width="897" height="180" alt="Payment Gateway"></div>
	 		<div id="fapDiv2"><img src="Images/payment-gateway.jpg" width="300" height="170" alt="Certified"></div>
			<div id="fdiv3">   
			<% out.println("<hr><h2>OOPs.Something went Wrong.<br>Session terminated!</h2><hr>");
			session.invalidate();
			%>
            </div>
            <div id="fapDiv3"><a href="Home.html"><img src="Images/back.jpg" width="49" height="52" alt="Back" title="Click here to Go back to home page"></a></div>
		<%
	 		
	 	}
    }catch (Exception e)
    {
    	response.sendRedirect("Problem.html");
    }

%>
</body>
</html>
