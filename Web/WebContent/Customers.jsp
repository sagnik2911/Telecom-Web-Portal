<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@page import="con_pack.*" %>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customers</title>
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
	width: 953px;
	height: 115px;
	z-index: 1;
	left: 196px;
	top: 859px;
	font-size: small;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	background-image: url(footer_background.jpg);
	background-repeat: no-repeat;
}
</style>
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
</head>

<body>
<% 
try{
    
	Context ctx = new InitialContext();
    DataSource ds = (DataSource)ctx.lookup("java:OracleDS");
    Connection con= ds.getConnection();
    String unm=session.getAttribute("unm").toString();
    
    Statement st = con.createStatement();
    ResultSet rs= st.executeQuery("select * from clientdet");

    %>
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
      <tr>
      <td colspan=1 bgcolor=white>&nbsp;</td>
      </tr>
      <tr>
      <td colspan=1 bgcolor=white>&nbsp;</td>
      </tr>
      <tr>
      <td colspan=1 bgcolor=white>&nbsp;</td>
      </tr>
      <tr align="center">
      <td>
    	<table border="1"  bgcolor="gainsboro" cellpadding="0" >
    	<tr bgcolor=silver >
        <th>SIM NO.</th>
        <th>MOB NO.</th>
        <th>NAME</th>
        <th>EMAIL</th>
        <th>TYPE</th>
        <th>STATUS</th>
        <th>ADDRESS</th>
        <th>CITY</th>
        <th>COUNTRY</th>
        <th>PINCODE</th>
        </tr>
        <%
    		while(rs.next()){
    	%>
    	<tr>
    	<td><font size="-1" face="Arial"><%= rs.getString(1)%></font></td>
    	<td><font size="-1" face="Arial"><%= rs.getString(2)%></font></td>
    	<td><font size="-1" face="Arial"><%= rs.getString(3)%></font></td>
    	<td><font size="-1" face="Arial"><%= rs.getString(5)%></font></td>
    	<td><font size="-1" face="Arial"><%= rs.getString(7)%></font></td>
    	<td><font size="-1" face="Arial"><%= rs.getString(8)%></font></td>
    	<td><font size="-1" face="Arial"><%= rs.getString(6)%></font></td>
    	<td><font size="-1" face="Arial"><%= rs.getString(4)%></font></td>
    	<td><font size="-1" face="Arial"><%=  rs.getString(9)%></font></td>
    	<td><font size="-1" face="Arial"><%= rs.getString(10)%></font></td>
    	<% 
    		}
    	rs.close();
    	con.close();
		}
		catch(Exception e){
			response.sendRedirect("Problem.html");
		}
	%>
</tr>
</table>
      </td>
	  </tr>	
	  <tr>
      <td colspan=1 bgcolor=white>&nbsp;</td>
      </tr>
      <tr>
      <td colspan=1 bgcolor=white>&nbsp;</td>
      </tr>
	  <tr>
	  <td align=center>
	  <a href="javascript:jumpScroll()"><u>Jump to top of the page</u></a>
	  </td>
	  </tr>
	<tr>
      <td colspan=1 bgcolor=white>&nbsp;</td>
      </tr>
      <tr  align="center">
        <td>
        <a href="Admin_home.jsp"><img src="Images/HomeIcon.png" width="91" height="56" alt="Home" title="Go to Admin Home Page"></a>
        </td>
      </tr>
      <tr>
      <td colspan=1 bgcolor=white>&nbsp;</td>
      </tr>
      <tr>
      <td colspan=1 bgcolor=white>&nbsp;</td>
      </tr>
      <tr>
      <td colspan=1 bgcolor=white>&nbsp;</td>
      </tr>
    </table>
  </div>
  <!-- end .container --></div>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
function jumpScroll() {
   	window.scroll(0,0); // horizontal and vertical scroll targets
}
</script>
</body>
</html>
