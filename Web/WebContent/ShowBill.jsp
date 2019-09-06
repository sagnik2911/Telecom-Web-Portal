<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bill</title>
<style type="text/css">
#apDiv1 {
	position: absolute;
	left: 210px;
	top: 35px;
	width: 328px;
	height: 63px;
	z-index: 1;
}
#apDiv2 {
	position: absolute;
	left: 861px;
	top: 34px;
	width: 224px;
	height: 31px;
	z-index: 2;
	color: #000;
	font-size: large;
}
#apDiv3 {
	position: absolute;
	left: 903px;
	top: 34px;
	width: 260px;
	height: 229px;
	z-index: 3;
	font-size: large;
}
#apDiv4 {
	position: absolute;
	left: 0px;
	top: -11px;
	width: 183px;
	height: 692px;
	z-index: 4;
	background-color: #42090D;
}
#apDiv5 {
	position: absolute;
	left: 1180px;
	top: -11px;
	width: 183px;
	height: 692px;
	z-index: 4;
	background-color: #42090D;
}
#apDiv6 {
	position: absolute;
	left: 227px;
	top: 141px;
	width: 364px;
	height: 263px;
	z-index: 5;
	font-size: large;
}
#apDiv7 {
	position: absolute;
	left: 272px;
	top: 377px;
	width: 106px;
	height: 30px;
	z-index: 6;
}
#apDiv8 {
	position: absolute;
	left: 427px;
	top: 363px;
	width: 103px;
	height: 31px;
	z-index: 7;
}
#apDiv9 {
	position: absolute;
	left: 897px;
	top: 222px;
	width: 209px;
	height: 226px;
	z-index: 8;
}
#apDiv10 {
	position: absolute;
	left: 223px;
	top: 505px;
	width: 885px;
	height: 104px;
	z-index: 9;
}
#apDiv11 {
	position: absolute;
	left: 221px;
	top: 12px;
	width: 175px;
	height: 13px;
	z-index: 10;
}
</style>
</head>
<body>
<div id="apDiv5"></div>
<div id="apDiv4"></div>

<div id="apDiv7"><a href="PayBill.jsp"><img src="Images/paynow (1).png" width="142" height="32" alt="Pay" title="Pay Now"></a></div>
<div id="apDiv8"><a href="ViewBill.html"><img src="Images/BackButton.png" width="56" height="64" alt="Back" title="Back"></a></div>
<div id="apDiv9"><img src="Images/ranbir-kapoor-tata-docomo-ad-new.jpg" width="200" height="275" alt="Ad"></div>
<div id="apDiv10"><img src="Images/2.jpg" width="876" height="161" alt="Ad"></div>

<% try{ %>
<div id="apDiv1"><img src="Images/code128bar.jpg" width="306" height="62" alt="Barcode"></div>
<div id="apDiv11">Bill Id: <% out.println(session.getAttribute("id")); %></div>
<div id="apDiv3">
<%  out.println("<b>Billing Address</b>");
	out.println("<br><br>Name: "+session.getAttribute("name"));
   out.println("<br>Address: "+session.getAttribute("address"));
   out.println("<br>City: "+session.getAttribute("city"));
   out.println("<br>Pin: "+session.getAttribute("pin"));
   out.println("<br>Country: "+session.getAttribute("country"));
   out.println("<br>Mail Id: "+session.getAttribute("email"));

 %>
</div>
<div id="apDiv6">
<%  
	out.println("<b>Hello "+session.getAttribute("name")+"! Your Tata Docomo Bill:</b><br>");
    out.println("<p><table border=0 cellpadding=2>");
	out.println("<tr><th align=\"left\">Your Tata Docomo number</th><td> "+session.getAttribute("mno"));
   out.println("</td></tr><tr><th align=\"left\">Sim no </th><td>"+session.getAttribute("simno"));
   out.println("</td></tr><tr><th align=\"left\">Bill ID </th><td>"+session.getAttribute("id"));
   out.println("</td></tr><tr><th align=\"left\">Previous Due </th><td>Rs."+session.getAttribute("prev"));
   out.println("</th></tr><tr><th align=\"left\">Current Bill </th><td>Rs."+session.getAttribute("curr"));
   out.println("</th></tr><tr><th align=\"left\">Total Due </th><td>Rs."+session.getAttribute("tot"));
   out.println("</th></tr></table>");
   

 %>
</div>
<% }
    catch(Exception e)
	{
         response.sendRedirect("Problem.html");		
	}
%>
</body>
</html>