<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
  body {text-align:center;  }
   #div1 {
	position: absolute;
	left: 930px;
	top: 431px
} 	
   #div2 {
	position: absolute;
	left: 262px;
	top: 313px;
	text-align: left;
}
	#div3 {
	position : absolute;
	left: 560px;
	top: 431px;
	width: 58px;
	height: 31px;
}
  #div4{
	position : absolute;
	left: 262px;
	top: 267px;
  }
  #div5{
	position : absolute;
	left: 221px;
	top: 27px;
	width: 869px;
  }
#apDiv1 {
	position: absolute;
	left: 423px;
	top: 221px;
	width: 45px;
	height: 152px;
	z-index: 1;
}
#apDiv2 {
	position: absolute;
	left: 710px;
	top: 269px;
	width: 322px;
	height: 29px;
	z-index: 1;
}
#apDiv3 {
	position: absolute;
	left: 670px;
	top: 216px;
	width: 39px;
	height: 219px;
	z-index: 2;
}
#apDiv4 {
	position: absolute;
	left: 22px;
	top: 180px;
	width: 186px;
	height: 398px;
	z-index: 3;
}
#apDiv5 {
	position: absolute;
	left: 1105px;
	top: 26px;
	width: 216px;
	height: 559px;
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
#apDiv7 {
	position: absolute;
	left: 614px;
	top: 504px;
	width: 106px;
	height: 87px;
	z-index: 6;
}
#apDiv8 {
	position: absolute;
	left: 260px;
	top: 318px;
	width: 792px;
	height: 43px;
	z-index: 6;
	font-size: x-large;
	font-weight: bold;
	color: #FFF;
}
#apDiv8 {
	color: #FFF;
	background-color: #F60;
	
}
#apDiv12 {
}
#apDiv9 {
	position: absolute;
	left: 441px;
	top: 409px;
	width: 402px;
	height: 208px;
	z-index: 7;
}
#apDiv10 {
	position: absolute;
	left: 674px;
	top: 642px;
	width: 123px;
	height: 105px;
	z-index: 8;
}
#apDiv11 {
	position: absolute;
	left: 547px;
	top: 625px;
	width: 113px;
	height: 108px;
	z-index: 9;
}
#apDiv12 {
	position: absolute;
	left: 22px;
	top: 738px;
	width: 1296px;
	height: 183px;
	z-index: 10;
	text-align: center;
	background-color: #D6D6D6;
	background-image: url(Images/footer_background.jpg);
}
#apDiv13 {
	position: absolute;
	left: 927px;
	top: 222px;
	width: 112px;
	height: 86px;
	z-index: 11;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Your Details</title>
</head>
<body>
<div id="apDiv10"><a href="Cust_Home.jsp"><img src="Images/BackButton.png" width="84" height="81" title="Back"></a></div>
<div id="apDiv11"><a href="PasswordChange.html"><img src="Images/GuestCentric-Support-Page-originalchangepass-PNG.png" title="Change Password" width="104" height="105"></a></div>
<div id="apDiv12">
  <p>&nbsp;</p>
  <p>Tata is a registered trademark of Tata Sons Ltd. The DOCOMO logo is a trademark  of NTT DOCOMO, INC. (Japan) in India.<br>
    &copy;&nbsp;2015 Tata DOCOMO | Powered by&nbsp;iem<br>
    Follow us @ facebook and twitter<br>
    Best 3G mobile phones, 3G data card, 3G services in India from Tata  DOCOMO. Enjoy Tata DOCOMO 3G Services in India with best<br>
  3G mobile phone and 3G data card.</p>
</div>
<div id="apDiv13"><a href="Logout.jsp"><img src="Images/canstock21253555.jpg" title="Logout" width="105" height="87"></a></div>	
	
	

<div id="apDiv8"> User Details :</div>
<div id="apDiv9">
  <table bgcolor="gainsboro" width="395" height="183" border="1">
  
    <tr>
      <th width="190" height="40"><center>Username</center></th>
      
     <%
     try{
     	String unm= session.getAttribute("unm").toString();
     	
     	Context ctx=new InitialContext();
     	DataSource ds=(DataSource)ctx.lookup("java:OracleDS");
     	Connection con=ds.getConnection();
     	Statement st=con.createStatement();
     	ResultSet rs= st.executeQuery("Select * from userdet where mob_no = '"+unm+"' or username = '"+unm+"'");
     	if(rs.next())
     	{
     	String us=rs.getString(1);
     	String ps=rs.getString(3);
     	String mob=rs.getString(2);
     	String ty=rs.getString(4);
     	%>
     	<td><center><%= us%> </center></td>
    </tr>
    <tr>
      <th height="52">Password</th>
     <td><center><%= ps %> </center></td>
    </tr>
    <tr>
      <th height="38">Registered Number</th>
     <td><center><%= mob%> </center></td>
    </tr>
    <tr>
      <th height="41">User Type</th>
    <td><center><%= ty %></center></td>
    </tr>
  
  <%
     	}
  con.close();
  rs.close();
  }catch(Exception e)
{
response.sendRedirect("Problem.html");	  
}
%>
</table>
  </div>


<div id="apDiv4"><img src="Images/ad2.jpg" width="181" height="386"></div>
<div id="apDiv5"><img src="Images/ad3.jpg" width="199" height="527"></div>
<div id="apDiv6"><img src="Images/Tata-Docomo-Logo-LMI.jpg" width="185" height="140"></div>
<center>
<br> 
<br>
<br>

<form name="F1" method="post" action="Login.jsp">
</form>
<div id="div5">
  <img src="Images/Ad1.jpg" width="858" height="185" alt="Ad1">
  
</div>
</body>