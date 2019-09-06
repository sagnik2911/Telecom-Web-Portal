<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, javax.sql.*,javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>
<script language="JavaScript">
function check()
{
	
	pwd = document.f2.pwd.value;
	if(pwd=="")
	{
	alert("Enter Password!!");
	}
	else
	{
	document.f2.submit();
	}
}
</script>
<style type="text/css">
body {text-align:center}
#div1 {
	position: absolute;
	left: 538px;
	top: 224px
}
#div3 {
	position: absolute;
	left: 503px;
	top: 224px
}
#div2 {
	position: absolute;
	left: 646px;
	top: 333px
}
#apDiv1 {
	position: absolute;
	left: 160px;
	top: 14px;
	width: 952px;
	height: 114px;
	z-index: 1;
}
#apDiv2 {
	position: absolute;
	left: 470px;
	top: 379px;
	width: 411px;
	height: 90px;
	z-index: 2;
}

#apDiv3 {
	position: absolute;
	left: 618px;
	top: 345px;
	width: 70px;
	height: 60px;
	z-index: 3;
}
#apDiv4 {
	position: absolute;
	left: 853px;
	top: 272px;
	width: 112px;
	height: 43px;
	z-index: 4;
}
</style>
</head>
<body>
<div id="apDiv1"><img src="Images/payment_gateway-Copy.jpg" width="897" height="180" alt="Payment Gateway"></div>
<div id="apDiv2"><img src="Images/payment-gateway.jpg" width="300" height="170" alt="Certified"></div>


<%
    	try{
    		String ph= session.getAttribute("mno").toString();
    		String cno = request.getParameter("cardno");
    		String cname = request.getParameter("cardname");
    		String ctype = request.getParameter("cardtype");
    		String cvn = request.getParameter("ccvno");
    		String exdate = request.getParameter("expmon")+"/"+request.getParameter("expyear");
	
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:OracleDS");
		Connection con = ds.getConnection();
		Statement st = con.createStatement();
		//out.println("Select * from card_db where card_no='"+cno+"' and name='"+cname+"' and type='"+ctype+"'and ccv='"+cvn+"' and expdate='"+exdate+"'");
		ResultSet rs;
	 	rs= st.executeQuery("Select * from card_db where card_no='"+cno+"' and name='"+cname+"' and type='"+ctype+"'and ccv='"+cvn+"' and expdate='"+exdate+"'");
		
	 	if(rs.next())
			{//out.println("Match Found");
	%>
    <form name="f2" action="Payment2.jsp" method=post>
    <div id="div1">
	<h3>Payment Authenticated</h3>
	
	<table align="center" border=0 cellpadding=5 cellspacing=0>
	<tr>
		<td> Enter Password: </td>
		<td> <input type=password name="pwd" value="" >
		</td>
	</tr>
	</table>
    </div>
    <div id="div2">
	<input type=button value="Proceed" onClick = "check()" >
    </div>
</form>
<div id="apDiv4"><a href="Cancel.jsp"><img src="Images/cancel-button-blue-hi.png" width="83" height="39" title="Cancel Transaction"></a></div>
	<%	session.setAttribute("cardno",cno);
		//session.setAttribute("rech",request.getParameter("rech"));
		//session.setAttribute("mobno",request.getParameter("mobno"));
	
			}
		else
			{
				%>
             <div id="div3">   
			<% out.println("<hr><h2>OOPs.Something went Wrong.<br>Session terminated!</h2><hr>");
			session.invalidate();
			%>
            </div>
            <div id="apDiv3"><a href="Home.html"><img src="Images/back.jpg" width="49" height="52" alt="Back" title="Click here to Go back to home page"></a></div>
            
            <%
			}
	} catch ( Exception e)
	{
         response.sendRedirect("Problem.html");		
	}
	
%>
</body>
</html>