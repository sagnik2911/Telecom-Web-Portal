<%@ page language="java" contentType="text/html; charset=iso-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*,java.util.*,java.sql.*,java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Create Branch</title>
<script language="JavaScript">
function check()
{
	bnm=document.f1.bnm.value;
	add=document.f1.add.value;
	city=document.f1.city.value;
	state=document.f1.state.value;
	cnt=document.f1.cnt.value;
	odt=document.f1.odt.value;
	sts=document.f1.sts.value;
	
	if(bnm=="")
	{
	  alert("Please enter Branch name");
	  document.f1.bnm.focus();
	}
	else if(bnm.length>25)
	{
	   alert("Maximum branch name field length:25");
	   document.f1.bnm.focus();
	}
	else if(!isNaN(bnm))
	{
	   alert("Name field should contain character only");
	   document.f1.bnm.focus();
	}
	
	else if(add=="")
	{
	  alert("Please enter Address");
	  document.f1.add.focus();
	}
	else if(add.length>50)
	{
	   alert("Maximum address field length:50");
	   document.f1.aadd.focus();
	}
	
	else if(city=="")
	{
	  alert("Please enter city name");
	  document.f1.city.focus();
	}
	else if(city.length>30)
	{
	   alert("Maximum city field length:30");
	   document.f1.city.focus();
	}
	else if(!isNaN(city))
	{
	   alert("City field should contain character only");
	   document.f1.city.focus();
	}
	
	
	else if(state=="")
	{
	  alert("Please enter state name");
	  document.f1.state.focus();
	}
	else if(state.length>30)
	{
	   alert("Maximum State field length:30");
	   document.f1.state.focus();
	}
	else if(!isNaN(state))
	{
	   alert("state field should contain character only");
	   document.f1.state.focus();
	}
	
	
	else if(cnt=="")
	{
		alert("Contact no field can't kept blank");
		document.f1.cnt.focus();
	}	
	else if(isNaN(cnt))
	{
	   alert("Contact no should only contain digits");
	   document.f1.cnt.focus();
	}
	
	else if(cnt.length<8 || cnt.length>10 )
	{
	   alert("Not a valid contact No");
	   document.f1.cnt.select();
	}
	
	else if(odt=="") {
    alert("Please Select Opening date");
    }
	
	else if(sts=="-1") {
    alert("Please Select Branch Status");
    }
	
	else
		document.f1.submit();
		
}
	
</script>

<style type="text/css">
body,td,th {
	font-family: Calibri;
	font-size: 16px;
	color: #000;
}
.fnt1 {
	font-family: Calibri;
}
</style>
</head>
<body>
<jsp:include page="regional_master.jsp"></jsp:include>
<p>





<form name="f1" method="post" action="add_branch_code.jsp">
  
  <table width="973" height="329" align="center">
  <tr><td colspan="4" bgcolor="#CC0099">&nbsp;</td></tr>
   <tr>
     <td width="134" class="fnt1">&nbsp;</td>
     <td width="173">&nbsp;</td>
     <td width="650" rowspan="10"><img src="st.jpg" width="359" height="172"></td>
   </tr>
   <tr>
      <td class="fnt1">Branch Name :</td>
      <td><input type="text" name="bnm"></td>
    </tr>
   <tr>
      <td>Address:</td>
      <td><input type="text" name="add"></td>
    </tr>
   <tr> 
      <td>City:</td>
      <td><input type="text" name="city"></td>
    </tr>
   <tr>
      <td>State:</td>
      <td><input type="text" name="state"></td>
    </tr>
   <tr> 
      <td>Contact No:</td>
      <td><input type="text" name="cnt"></td>
    </tr>
   <tr>
      <td>Opening Date:</td>
      <td>
      <%

Context ctx=new InitialContext();
DataSource ds=(DataSource)ctx.lookup("java:OracleDS");
Connection con=ds.getConnection();
Statement st=con.createStatement();


DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
ResultSet rs=st.executeQuery("select sysdate from dual");

while(rs.next())
{
	java.sql.Date dt=rs.getDate(1);
%>
<input type="date" name="odt" min=<%=dt%>>
<%} %>
      
      </td>
    </tr>
   <tr>
      <td>Status:</td>
      <td><select name="sts" >
        <option value="-1">--Select Status--</option>
        <option value="Open">Open</option>
        <option value="Dead">Dead</option>
      </select></td>
    </tr>
   <tr>
      <td><input type=reset value=Reset></td>
      <td><input type=button value=ADD onClick="check()"></td>
    </tr>
    <tr>
      <td height="21">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3" bgcolor="#CC0099">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3">&nbsp;</td>
    </tr>
  </table>
  <p>&nbsp;</p>
  
 
</form>

</body>
</html>