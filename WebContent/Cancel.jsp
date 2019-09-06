<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction cancelled</title>
<script>
function redirect()
{
   window.setTimeout("d()","5000");
}
function d()
{
    window.location="Home.html";
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


#apDiv1 {
	position: absolute;
	left: 608px;
	top: 517px;
	width: 135px;
	height: 99px;
	z-index: 1;
}
#apDiv2 {
	position: absolute;
	left: 534px;
	top: 428px;
	width: 411px;
	height: 90px;
	z-index: 2;
}
#apDiv3 {
	position: absolute;
	left: 618px;
	top: 356px;
	width: 70px;
	height: 60px;
	z-index: 3;
}
#div3 {
	position: absolute;
	left: 530px;
	top: 241px
}
</style>

</head>
<body onLoad="redirect()">
<div id="div3">   
			<hr><h2>Transaction Cancelled.<br>Session terminated!</h2><hr>
  <%session.invalidate();%>
		
</div>
<div id="div1">
   <!--<h1>Payment Gateway</h1>-->
   <img src="Images/payment_gateway-Copy.jpg" width="891" height="186" alt="Payment Gateway">
</div>
<div id="apDiv2"><img src="Images/cc_logo.jpg" width="255" height="135"></div>
<div id="apDiv3"><a href="Home.html"><img src="Images/back.jpg" width="49" height="52" alt="Back" title="Click here to Go back to home page"></a></div>
</body>
</html>