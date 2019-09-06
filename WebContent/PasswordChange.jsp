<%@ page language="java" contentType="text/html; charset=iso-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {text-align:center; }
h1 {text-align:center;}
h2 {text-align:center;}
#d1 {
	position: absolute;
	left: 553px;
	top: 447px;
	width: 127px;
	height: 84px;
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
	height: 357px;
	z-index: 5;
}
#dr2 {
	position: absolute;
	left=500px;
	top=500px;
	left: 565px;
	top: 328px;
}
#dr3 {
	position: absolute;
	left: 499px;
	top: 301px;	
}
body,td,th {
	color: #C60;
}
#apDiv2 {
	position: absolute;
	left: 699px;
	top: 444px;
	width: 117px;
	height: 85px;
	z-index: 6;
}
#apDiv7 {
	position: absolute;
	left: 684px;
	top: 446px;
	width: 104px;
	height: 88px;
	z-index: 6;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>New User</title>
</head>
<body>
<div id="apDiv6"><img src="Images/Ad1.jpg" width="896" height="185" alt="AD"></div>
<div id="apDiv3"><img src="Images/logo.jpg" width="258" height="185" alt="Logo"></div>
<div id="apDiv4"><img src="Images/Ad2.gif" width="213" height="352" alt="AD"></div>
<div id="apDiv5"><img src="Images/ad3.jpg" width="252" height="365" alt="Ad"></div>
<div id="apDiv7"><a href="Logout.jsp"><img src="Images/400_F_43356582_xppel8dOjSjki2KLbunQA1TdIeCl7z9v.jpg" title="Logout" width="82" height="78" alt="LogOut"></a></div>
<%
	
	//String s;
	
	try
	{
		String currpwd = request.getParameter("currpwd");
		String newpwd = request.getParameter("newpwd");
		String conpwd = request.getParameter("conpwd");
		String unm=session.getAttribute("unm").toString(); 
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:OracleDS");
		Connection con = ds.getConnection();
		Statement st = con.createStatement();
		ResultSet rs= st.executeQuery("Select * from userdet where mob_no = '"+unm+"' or username = '"+unm+"'");
		if(rs.next())
		{
			if(currpwd.equals(rs.getString(3)))
					{
				if(newpwd.equals(conpwd)){
			PreparedStatement ps= con.prepareStatement("update userdet set password='"+newpwd+"'where mob_no = '"+unm+"' or username = '"+unm+"'");
			ps.executeUpdate();
			
			%>
<div id="dr3">
			<%
			out.println("<hr><h2>Congrats!!<br> Your Password Has Been Updated.</h1>");
			out.println("<hr>");
			%>
			</div>
<div id="d1"><a href= Cust_Home.jsp><img src="Images/BackButton.png" alt="back" width="89" height="78" title="Back"></a></div>     
			<%
			
			ps.close();
			}
			else
			{
				%>
<div id="dr2">
				<%
				out.println("<hr><h2>Please Verify Your Password Correctly.</h1><hr>");
			%>
</div>
<div id="d1"><a href= Cust_Home.jsp><img src="Images/BackButton.png" alt="back" width="89" height="78" title="Back"></a></div>     
			<%
			}
			//
			%>
			
			<%
			
			con.close();
		}
		else
		{
			%>
            <div id="dr2">
            <%
			out.println("<hr><h2>Wrong Password Entered.</h2><hr>");
			%>
            </div>
			<div id="d1"><a href= Cust_Home.jsp><img src="Images/BackButton.png" alt="back" width="89" height="78" title="Back"></a></div>            
			<%
		}
	}
	
	}catch(Exception e)
	{
		response.sendRedirect("Problem.html");
	}
           %>
<br>

</body>
</html>