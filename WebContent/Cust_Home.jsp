<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Tata Docomo User Homepage</title>
<style type="text/css">
</style>
<link href="SpryAssets/SpryAssetsCustomer1/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css">
<style type="text/css">
#apDiv4 {
	position: absolute;
	left: 28px;
	top: 675px;
	width: 1221px;
	height: 192px;
	z-index: 2;
	background-image: url(Images/footer_background.jpg);
}
#apDiv3 {
	position: absolute;
	left: 96px;
	top: 484px;
	width: 335px;
	height: 72px;
	z-index: 3;
	font-family: "Comic Sans MS", cursive;
	color: #C60;
	text-align: center
}
#apDiv5 {
	position: absolute;
	left: 545px;
	top: 411px;
	width: 533px;
	height: 239px;
	z-index: 4;
}
#apDiv4 center p {
	color: #000;
}
</style>
<script src="SpryAssets/SpryAssetsCustomer1/SpryMenuBar.js" type="text/javascript"></script>
</head>
<body>
<div id="apDiv3">
<%
  
    try{
    String unm=session.getAttribute("unm").toString();
    Context ctx=new InitialContext();
	DataSource ds=(DataSource)ctx.lookup("java:OracleDS");
	Connection con=ds.getConnection();
	Statement st=con.createStatement();
	ResultSet rs= st.executeQuery("Select * from Userdet where mob_no = '"+unm+"' or username = '"+unm+"'");
	if(rs.next())
	{
		String nm=rs.getString(1).toString();
		out.println("<hr><h2>Welcome "+nm+"...</h2>");
		out.println("<hr>");
		rs.close();
		con.close();
	}
	}catch(Exception e)
	{
		response.sendRedirect("Problem.html");
		}
%>
</div>
<div id="apDiv5"><img src="Images/tata-docomo-logo-ad.jpg" width="618" height="227" /></div>
<div id="apDiv1"></div>
<div id="apDiv4">
  <center><p>&nbsp;</p>
    <p>Tata is a registered trademark of Tata Sons Ltd. The DOCOMO logo is a  trademark of NTT DOCOMO, INC. (Japan) in India.<br>
      &copy;&nbsp;2015 Tata DOCOMO | Powered by&nbsp;iem<br>
      Follow us @ facebook and twitter<br>
      Best 3G mobile phones, 3G data card, 3G services in India from Tata  DOCOMO. Enjoy Tata DOCOMO 3G Services in India with best<br>
      3G mobile phone and 3G data card.</p>
  </center>
</div>
<div id="apDiv2"></div>
<center>
  <table width="1181" height="871" border="0">
  <tr>
    <td width="1">&nbsp;</td>
    <td width="402" height="230"><img src="Images/unnamed.jpg" width="341" height="211"></td>
    <td colspan="3"><div align="center"><img src="Images/Tata-Docomo-price.jpg" width="760" height="209"></div></td>
    </tr>
  <tr>
    <td height="98" colspan="3" align= "right">&nbsp;</td>
    <td width="724" height="98" align= "right"><a href="Logout.jsp"><img src="Images/canstock21253555.jpg" title="Logout" width="114" height="84" /></a></td>
    <td width="33" align= "right">&nbsp;</td>
  </tr>
  <tr >

    <td  height="50" colspan="5" align="center"><ul id="MenuBar1" class="MenuBarHorizontal">
      <li><a href="AccountDet.jsp">Account Detail</a></li>
      <li><a href="PasswordChange.html">Edit Account</a></li>
      <li><a href="#" class="MenuBarItemSubmenu">Prepaid Billing</a>
        <ul>
          <li><a href="ViewBalance.jsp">View Balance</a></li>
          <li><a href="Recharge.html">Recharge Now</a></li>
        </ul>
      </li>
      <li><a href="#" class="MenuBarItemSubmenu">Postpaid Billing</a>
        <ul>
          <li><a href="ViewBill.html">View Bill</a></li>
          <li><a href="ViewBill.html">Pay Bill</a></li>
        </ul>
      </li>
</ul></td>

    </tr>
  <tr>
    <td height="268" colspan="4">&nbsp;</td>
    <td align= "center">&nbsp;</td>
    </tr>
  <tr>
    <td colspan="5">&nbsp;</td>
    </tr>
</table>
</center>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryAssetsCustomer1/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryAssetsCustomer1/SpryMenuBarRightHover.gif"});
</script>
</body>

</html>