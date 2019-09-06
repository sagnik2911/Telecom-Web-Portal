<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Bill</title>
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
#apDiv2 {
	position: absolute;
	left: 463px;
	top: 261px;
	width: 425px;
	height: 43px;
	z-index: 6;
	text-align: center;
	font-size: 36px;
}

#apDiv2 table {
	font-size: 18px;
}
#apDiv7 {
	position: absolute;
	left: 608px;
	top: 454px;
	width: 155px;
	height: 34px;
	z-index: 7;
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
<div id="apDiv1"><a href="Cust_Home.jsp"><img src="Images/HomeIcon.png" width="91" height="56" alt="Home" title="Go to Home Page"></a></div>
<div id="d1"><a href= "ViewBill.html"><img src="Images/BackButton.png" alt="back" width="79" height="59" title="Back"></a></div>



<%
String id="";
int curr=0,prev=0,tot=0;
try{
	
    
	String mobno=request.getParameter("t1");
	String pwd=request.getParameter("t2");
    String unm = session.getAttribute("unm").toString();
	//out.println(unm);
    Context ctx=new InitialContext();
	DataSource ds=(DataSource)ctx.lookup("java:OracleDS");
	Connection con=ds.getConnection();
	Statement st3=con.createStatement();
	ResultSet rs3= st3.executeQuery("Select * from clientdet where mob_no='"+mobno+"' and connection_status='Active'");
	if(rs3.next())
	{Statement st2=con.createStatement();
	String simno=rs3.getString(1);
	String name=rs3.getString(3);
	String address=rs3.getString(6);
	String email=rs3.getString(5);
	String city=rs3.getString(4);
	String country=rs3.getString(9);
	String pin=rs3.getString(10);
	
	//out.println("Select * from userdet where mob_no='"+unm+"' and password='"+pwd+"' or where username='"+unm+"' and password='"+pwd+"'");
	ResultSet rs2= st2.executeQuery("Select * from userdet where mob_no='"+unm+"' and password='"+pwd+"' or  username='"+unm+"' and password='"+pwd+"'");
    if(rs2.next())
	{Statement st1=con.createStatement();
	ResultSet rs1= st1.executeQuery("Select * from postpaid where mob_no='"+mobno+"'");
	if(rs1.next())
	{Statement st=con.createStatement();
	ResultSet rs= st.executeQuery("Select * from bill where mob_no='"+mobno+"'");	
	    
		while(rs.next())
		{ id = rs.getString(1);
	 curr = rs.getInt(3);
	 prev = rs.getInt(4);
	 tot = rs.getInt(5);}
		if(id!="")
		{
	%>
    <div id="apDiv7"><a href="PayBill.jsp"><img src="Images/paynow (1).png" width="153" height="32" alt="Paynow"></a></div>
    <div id="apDiv2">Bill Details
    <br>
    <br>
	<table border="2" cellpadding="5" cellspacing="5">
	<tr>
	<th>Bill Id</th>
	<th>Current Due</th>
	<th>Previous Due</th>
	<th>Total Due</th>
	</tr>
	<tr>
	<%
	
	out.println("<td>"+id+"</td>");
	out.println("<td>"+curr+"</td>");
	out.println("<td>"+prev+"</td>");
	out.println("<td>"+tot+"</td>");
	%>
    </tr>
	</table>
    </div>
	<%
	
	session.setAttribute("id",id);
	session.setAttribute("curr",""+curr);
	session.setAttribute("prev",""+prev);
	session.setAttribute("tot",""+tot);
	session.setAttribute("mno",mobno);
	session.setAttribute("simno",simno);
	session.setAttribute("name",name);
	session.setAttribute("address",address);
	session.setAttribute("email",email);
	session.setAttribute("city",city);
	session.setAttribute("country",country);
	session.setAttribute("pin",pin);
	response.sendRedirect("ShowBill.jsp");
	
		}
		else
		{   out.println("<div id=\"apDiv2\">");
			out.println("<hr><h3>No Bill Has Been generated<hr>");
			out.println("</div>");
		}
	}
	else
	{
		out.println("<div id=\"apDiv2\">");
		out.println("<hr><h3>Number is not postpaid<hr>");
		out.println("</div>");
	}
}
    else
    {
		out.println("<div id=\"apDiv2\">");
    	out.println("<hr><h3>Enter correct password<hr>");
		out.println("</div>");
    }
	}
	else
	{
		out.println("<div id=\"apDiv2\">");
    	out.println("<hr><h3>Mobile Number not Found<hr>");
		out.println("</div>");	
	}
	con.close();
	}
	catch(Exception e)
	{
		out.println(e);
		response.sendRedirect("Problem.html");
	}


%>
</body>
</html>