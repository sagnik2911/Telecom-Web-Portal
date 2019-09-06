<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>
<script>
function check()
{
  cdno = document.f1.cardno.value;
  cdnam = document.f1.cardname.value;
  cvno = document.f1.ccvno.value;
 if (cdnam=="")
	{
	alert("Enter Card Name");
	document.f1.cardname.focus();
	}
else if(!isNaN(cdnam))
	{
	alert("Enter proper Card Name");
	document.f1.cardname.focus();	
	}

  
else if (cdno=="")
	{
	alert("Enter Card Number");
	document.f1.cardno.focus();
	}
else if(isNaN(cdno))
	{
	alert("Enter proper card number");
	document.f1.cardno.focus();	
	}
else if (cvno=="")
	{
	alert("Enter CVV No.");
	document.f1.ccvno.focus();
	}
else if(isNaN(cvno))
	{
	alert("Enter proper CVV No.");
	document.f1.ccvno.focus();	
	}
else
{
document.f1.submit();
}
  
}
</script>
<style type="text/css">

#div1 {
	position: absolute;
	left: 233px;
	top: 22px;
	width: 898px;
	height: 200px;
}
#div2 {
	position: absolute;
	left: 583px;
	top: 294px;
}
#div3 {
	position: absolute;
	left: 667px;
	top: 448px;
	width: 143px;
	height: 31px;
}
#div4 {
	position: absolute;
	left: 582px;
	top: 255px;
	width: 462px;
}

#apDiv1 {
	position: absolute;
	left: 608px;
	top: 517px;
	width: 135px;
	height: 99px;
	z-index: 1;
}
#apDiv4 {
	position: absolute;
	left: 930px;
	top: 358px;
	width: 112px;
	height: 43px;
	z-index: 4;
}
</style>
</head>
<body>
<div id="apDiv1"><img src="Images/cc_logo.jpg" width="255" height="135"></div>
<%try{
String rec = session.getAttribute("rec").toString();
String mobno = session.getAttribute("mno").toString();
int rech = Integer.parseInt(rec);
%>
<div id="div1">
   <!--<h1>Payment Gateway</h1>-->
   <img src="Images/payment_gateway-Copy.jpg" width="891" height="186" alt="Payment Gateway">
</div>
<div id="div4">
 Payment Amount :: <%out.println(rech); %> for Mobile No. <%out.println(mobno); %>
</div>
<form name="f1" method="post" action="Payment.jsp">
<div id="div2">
	<table align="center" border=0 cellpadding=5 cellspacing=0>
	<tr>
		<td> Select Card Type: </td>
		<td> <select name="cardtype" size=1> 
			<option value="Visa">Visa</option>
			<option value="Master">Master</option>
			</select>
		</td>
	</tr>
	<tr>
		<td> Enter Name on Card: </td>
		<td> <input type=text name="cardname" value=""  > </td>
	</tr>
	<tr>
		<td> Enter Card No: </td>
		<td> <input type=text name="cardno" value="" maxlength=16> </td>
	</tr>
		<tr>
		<td> Enter Expiry Date: </td>
		<td> <select name="expmon" size=1>  
		     <option value="01">01</option>
			 <option value="02">02</option>
			 <option value="03">03</option>
			 <option value="04">04</option>
			 <option value="05">05</option>
			 <option value="06">06</option>
			 <option value="07">07</option>
			 <option value="08">08</option>
			 <option value="09">09</option>
			 <option value="10">10</option>
			 <option value="11">11</option>
			 <option value="12">12</option>
			 </select>
			 /			 
			 <select name="expyear" size=1>  
		     <option value="15">15</option>
			 <option value="16">16</option>
			 <option value="17">17</option>
			 <option value="18">18</option>
			 <option value="19">19</option>
			 <option value="20">20</option>
			 <option value="21">21</option>
			 <option value="22">22</option>
			 <option value="23">23</option>
			 <option value="24">24</option>
			 <option value="25">25</option>
			 <option value="26">26</option>
			 </select>
		</td>
	</tr>
	<tr>
		<td> Enter CVV No: </td>
		<td> <input type=password name="ccvno" value="" maxlength=3 size=3> </td>
	</tr>
	</table>
    </div>
     <% //out.println("<input type= hidden name = \"rech\" value ="+ rech+">");
    //out.println("<input type= hidden name = \"mobno\" value ="+ mobno+">");
    %>
	<div id="div3">
    <br><input type=reset value="Clear" size=3> 
    &nbsp; &nbsp;  
   
	<input type=button value="Submit" size=3 onClick = "check()">
	</div>
    <div id="apDiv4"><a href="Cancel.jsp"><img src="Images/cancel-button-blue-hi.png" width="83" height="39" title="Cancel Transaction"></a></div>
</form>
<%
}
catch(Exception e)
{
   response.sendRedirect("Problem.html");
}
%>
</body>
</html>