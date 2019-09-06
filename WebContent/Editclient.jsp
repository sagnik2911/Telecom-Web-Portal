<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@page import="con_pack.*" %>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Edit Client</title>
<style type="text/css">
<!--
body {
	font: 100%/1.4 Verdana, Arial, Helvetica, sans-serif;
	background-color: #660000;
	margin: 0;
	padding: 0;
	color: #000;
	background-image: url();
}

/* ~~ Element/tag selectors ~~ */
ul, ol, dl { /* Due to variations between browsers, it's best practices to zero padding and margin on lists. For consistency, you can either specify the amounts you want here, or on the list items (LI, DT, DD) they contain. Remember that what you do here will cascade to the .nav list unless you write a more specific selector. */
	padding: 0;
	margin: 0;
}
h1, h2, h3, h4, h5, h6, p {
	margin-top: 0;	 /* removing the top margin gets around an issue where margins can escape from their containing div. The remaining bottom margin will hold it away from any elements that follow. */
	padding-right: 15px;
	padding-left: 15px; /* adding the padding to the sides of the elements within the divs, instead of the divs themselves, gets rid of any box model math. A nested div with side padding can also be used as an alternate method. */
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
a img { /* this selector removes the default blue border displayed in some browsers around an image when it is surrounded by a link */
	border: none;
}
/* ~~ Styling for your site's links must remain in this order - including the group of selectors that create the hover effect. ~~ */
a:link {
	color: #42413C;
	text-decoration: underline; /* unless you style your links to look extremely unique, it's best to provide underlines for quick visual identification */
}
a:visited {
	color: #6E6C64;
	text-decoration: underline;
}
a:hover, a:active, a:focus { /* this group of selectors will give a keyboard navigator the same hover experience as the person using a mouse. */
	text-decoration: none;
}

/* ~~ this fixed width container surrounds all other elements ~~ */
.container {
	width: 960px;
	background-color: #FFF;
	margin: 0 auto; /* the auto value on the sides, coupled with the width, centers the layout */
}

/* ~~ This is the layout information. ~~ 

1) Padding is only placed on the top and/or bottom of the div. The elements within this div have padding on their sides. This saves you from any "box model math". Keep in mind, if you add any side padding or border to the div itself, it will be added to the width you define to create the *total* width. You may also choose to remove the padding on the element in the div and place a second div within it with no width and the padding necessary for your design.

*/
.content {

	padding: 10px 0;
}

/* ~~ miscellaneous float/clear classes ~~ */
.fltrt {  /* this class can be used to float an element right in your page. The floated element must precede the element it should be next to on the page. */
	float: right;
	margin-left: 8px;
}
.fltlft { /* this class can be used to float an element left in your page. The floated element must precede the element it should be next to on the page. */
	float: left;
	margin-right: 8px;
}
.clearfloat { /* this class can be placed on a <br /> or empty div as the final element following the last floated div (within the #container) if the overflow:hidden on the .container is removed */
	clear:both;
	height:0;
	font-size: 1px;
	line-height: 0px;
}
-->
</style>
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#apDiv1 {
	position: absolute;
	width: 960px;
	height: 115px;
	z-index: 1;
	left: 195px;
	top: 819px;
	font-size: small;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	background-image: url(Images/footer_background.jpg);
	background-repeat: no-repeat;
}
</style>
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
</head>

<body>

<div class="container">
  <div class="content">
    <table width="958" height="278" border="0" cellspacing="0">
      <tr>
        <td width="958" height="128"><a href="Admin_home.jsp"><img src="Images/logo.jpg" width="341" height="148" title="Click to go to Admin Home Page" /></a></td>
      </tr>
      <tr>
        <td height="31"><ul id="MenuBar1" class="MenuBarHorizontal">
<li><a href="Register.html">Register</a></li>
          <li><a href="Editclient.html">Edit Client</a></li>
          <li><a href="Edituser.html">Edit User</a></li>
          <li><a href="Generatebill.html">Generate Bill</a></li>
          <li><a href="Editbill.html">Edit bill</a></li>
          <li><a href="Customers.jsp">Customers</a></li>
          <li><a href="Userdetail.jsp">User's detail</a></li>
          <li><a href="Billdetail.jsp">Bill Detail</a></li>
          <li><a href="Prepaid.jsp">Prepaid</a></li>
          <li><a href="Postpaid.jsp">Postpaid</a></li>
          <li><a href="Logout.jsp">LogOut</a></li>
        </ul></td>
      </tr>
      <tr  align="right">
        <td><font color="#FF3300" size="+3" face="Palatino Linotype, Book Antiqua, Palatino, serif">Welcome Admin!</font></td>
      </tr>
      <tr align="center">
      <td>
	 <%
	 try{
			ConnectDB c=new ConnectDB();
			Connection con=c.connect();
			String unm=session.getAttribute("unm").toString();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from clientdet where MOB_NO='"+request.getParameter("MOB")+"'");
			boolean found=false;
			if(rs.next())
			{
				found=true;
				out.println("<form name=f1 method=post action=Edit.jsp>");
				out.println("<table cellpadding=10>");
				out.println("<tr>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<th>Previous details</th>");
				out.println("<th>Updated details</th>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>SIM NO:</th>");
				out.println("<td><input type=text value='"+rs.getString(1)+"' readonly style=background-color:Gainsboro;></td>");
				out.println("<td><input type=text name=SIM value='"+rs.getString(1)+"'></td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>MOB NO:</th>");
				out.println("<td><input type=text value='"+rs.getString(2)+"' readonly style=background-color:Gainsboro></td>");
				out.println("<td><input type=text name=MOB value='"+rs.getString(2)+"' readonly></td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>Name:</th>");
				out.println("<td><input type=text value='"+rs.getString(3)+"' readonly style=background-color:Gainsboro></td>");
				out.println("<td><input type=text name=Name value='"+rs.getString(3)+"'></td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>Address:</th>");
				out.println("<td><input type=text value='"+rs.getString(6)+"' readonly style=background-color:Gainsboro></td>");
				out.println("<td><input type=text name=Address value='"+rs.getString(6)+"'></td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>City:</th>");
				out.println("<td><input type=text value='"+rs.getString(4)+"' readonly style=background-color:Gainsboro></td>");
				out.println("<td><input type=text name=City value='"+rs.getString(4)+"'></td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>Pin Code:</th>");
				out.println("<td><input type=text value='"+rs.getString(10)+"' readonly style=background-color:Gainsboro></td>");
				out.println("<td><input type=text name=PIN value='"+rs.getString(10)+"'></td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>Country:</th>");
				out.println("<td><input type=text value='"+rs.getString(9)+"' readonly style=background-color:Gainsboro></td>");
				out.println("<td><input type=text name=Country value='"+rs.getString(9)+"'></td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>Mail:</th>");
				out.println("<td><input type=text value='"+rs.getString(5)+"' readonly style=background-color:Gainsboro></td>");
				out.println("<td><input type=text name=Mail value='"+rs.getString(5)+"'></td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>Connection type:</th>");
				out.println("<td><input type=text name=type value='"+rs.getString(7)+"' readonly style=background-color:Gainsboro></td>");
				out.println("<td>");
				out.println("<select name=Contype>");
				out.println("<option value=Postpaid>Postpaid</option>");
				out.println("<option value=Prepaid>Prepaid</option>");
				out.println("</td>");
				out.println("</tr>");
				out.println("<th>Connection status:</th>");
				out.println("<td><input type=text value='"+rs.getString(8)+"' readonly style=background-color:Gainsboro></td>");
				out.println("<td>");
				out.println("<select name=Constatus>");
				out.println("<option value=Active>Enable</option>");
				out.println("<option value=Inactive>Disable</option>");
				out.println("<option value=Stopped>Stop</option>");
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td align=right><input type=button value=Submit onClick=check()></td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("</form>");
			}
			if(!found)
			{
				out.println("<table cellpadding=10>");
				out.println("<tr>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<th align=center><font color=Orange>Mobile number not registered!</font></th>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("</tr>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("<td colspan=1 bgcolor=white>&nbsp;</td>");
				out.println("</tr>");
				out.println("</table>");
			}
			st.close();
			rs.close();
			con.close();
		}catch(Exception e)
		{
			response.sendRedirect("Problem.html");
		}
		%>
	  </td>
	  </tr>	
      <tr  align="center">
        <td>&nbsp;
        <p>&nbsp;</p>
        <div id="apDiv1">
          <p>Tata is a registered trademark of Tata Sons Ltd. The DOCOMO logo is a trademark  of NTT DOCOMO, INC. (Japan) in India.<br />
            �&nbsp;2015 Tata DOCOMO | Powered by&nbsp;ism<br />
            Follow us @ facebook and twitter<br />
            Best 3G mobile phones, 3G data card, 3G services in India from Tata  DOCOMO. Enjoy Tata DOCOMO 3G Services in India with best<br />
            3G mobile phone and 3G data card.</p>
        </div>
        <p>&nbsp;</p>        <pre></td>
      </tr>
    </table>
  </div>
  <!-- end .container --></div>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
function check()
{
  	var mob=document.f1.MOB.value;
  	var sim=document.f1.SIM.value;
  	var name=document.f1.Name.value;
  	var add=document.f1.Address.value;
  	var city=document.f1.City.value;
  	var pin=document.f1.PIN.value;
  	var country=document.f1.Country.value;
  	var mail=document.f1.Mail.value;
  	
  	var letter=/^[A-Za-z ]+$/;
  	var letter1=/^[A-Za-z]+$/;
  	
  	var x=mail.indexOf('@');
	var y=mail.indexOf('.');
  	
  	if (isNaN(sim))
  	{
  		alert("Entered detail contains character \n Should be a number");
  		document.f1.SIM.focus();
  	}
  	else if(sim=="")
  	{
  		alert("Sim no should be provided");
  		document.f1.SIM.focus();
  	}
  	else if(isNaN(mob) || mob.length<10)
  	{
  		alert("Not a valid mobile number");
  		document.f1.MOB.select();
  	}
  	else if(!name.match(letter))
  	{
  		alert("Name must have alphabet character only");
  		document.f1.Name.focus();
  	}
  	else if(name=="")
  	{
  		alert("Name must not be left blank");
  		document.f1.Name.focus();
  	}
  	else if(add=="")
  	{
  		alert("Address field must not be left blank");
  		document.f1.Address.focus();
  	}
  	else if(city=="")
  	{
  		alert("Provide City");
  		document.f1.City.focus();
  	}
  	else if(!city.match(letter1))
  	{
  		alert("City must have alphabet character only \n Spaces not allowed");
  		document.f1.City.focus();
  	}
  	else if (pin.length<6 || isNaN(pin))
  	{
  		alert("Not a valid Pin Code");
  		document.f1.PIN.focus();
  	}
  	else if(country=="")
  	{
  		alert("Country must not be left blank");
  		document.f1.Country.focus();
  	}
  	else if(!country.match(letter1))
  	{
  		alert("Country must have alphabet character only \n Spaces not allowed");
  		document.f1.Country.focus();
  	}
  	else if(mail=="" ||x==-1 || y==-1 || x>y)
	{	
		alert("Not a valid Email id")
		document.f1.Mail.select();
	}
  	else
  		document.f1.submit(); 
}
</script>
</body>
</html>
