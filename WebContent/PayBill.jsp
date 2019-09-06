<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function check()
{rec = document.f1.t1.value;
if(rec=="")
  alert("Enter amount to be paid");
else if(isNaN(rec))
 {alert("Amount should be a number");}
else if(rec<10)
{
alert("Amount must be greater than 10");
document.f1.t1.focus();	
}	
else
  document.f1.submit();
 }  
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pay Bill</title>

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
	left: 606px;
	top: 421px;
	width: 155px;
	height: 34px;
	z-index: 7;
}
#in {
positon:absolute;
left:50px;
top:200px
}
#apDiv8 {
	position: absolute;
	left: 482px;
	top: 344px;
	width: 403px;
	height: 61px;
	z-index: 6;
	font-size: 18px;
	font-weight: bold;
}
#apDiv9 {
	position: absolute;
	left: 551px;
	top: 286px;
	width: 274px;
	height: 48px;
	z-index: 7;
	font-weight: bold;
	font-size: 18px;
}
#apDiv10 {
	position: absolute;
	left: 618px;
	top: 450px;
	width: 123px;
	height: 33px;
	z-index: 8;
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
<div id="d1"><a href= "ShowBill.jsp"><img src="Images/BackButton.png" alt="back" width="79" height="59" title="Back"></a></div>

<form name ="f1" method ="post" action="PayBill2.jsp">
<div id="apDiv8">Enter Amount To be Paid: 

<input type="text" name="t1" value="" maxlength="4">
</div>
<div id="apDiv10"><input type="image" src="Images/paynow (1).png" width="142" height="32" alt="Pay" onClick="check();return false;"></div>
</form>
<div id="apDiv9">Mobile Number:
<%try{
out.println(session.getAttribute("mno"));
}
catch(Exception e)
{
	response.sendRedirect("Problem.html");
}
%>
</div>
</body>
</html>