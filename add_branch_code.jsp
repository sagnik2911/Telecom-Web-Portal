<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*,java.util.*,java.sql.*,java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Branch</title>
</head>
<body>
<jsp:include page="regional_master.jsp"></jsp:include>
<p>
<%
try
{
    Context ctx=new InitialContext();
    DataSource ds=(DataSource)ctx.lookup("java:OracleDS");
    Connection con=ds.getConnection();

	String pbnm=request.getParameter("bnm");
	String padd=request.getParameter("add");
	String pcity=request.getParameter("city");
	String pstate=request.getParameter("state");
	String pcnt=request.getParameter("cnt");
	String podt=request.getParameter("odt");
	String pstatus=request.getParameter("sts");
		
	//DateFormat df = new SimpleDateFormat("dd/MM/yyyy"); 
	DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
	//out.println(df);
	
	String brid=" ";
	Statement st_br=con.createStatement();

    ResultSet rs_br=st_br.executeQuery("select substr(branch_code,3,5) from branch");
    int f=1000;
    while(rs_br.next())
    {
	  f++;
	  brid=rs_br.getString(1);
    }
    if(f==1000)
    {
	  
      brid=String.valueOf(1000);
    }
    else
    {
	   int bridno=Integer.parseInt(brid);
	   bridno=bridno+1;
	   brid=String.valueOf(bridno);
    }


    String bcode="BR"+brid;
    
    Statement st_brnm=con.createStatement();

    ResultSet rs_brnm=st_brnm.executeQuery("select * from branch where branch_name='"+pbnm+"'");
    if(!rs_brnm.next())
    {
    	
	PreparedStatement ps=con.prepareStatement("insert into branch values(?,?,?,?,?,?,?,?)");
	ps.setString(1,bcode);
	ps.setString(2,pbnm);
	ps.setString(3,padd);
	ps.setString(4,pcity);
	ps.setString(5,pstate);
	ps.setString(6,pcnt);
	ps.setDate(7,new java.sql.Date(df.parse(podt).getTime()));
	//out.print(podt);
	ps.setString(8,pstatus);
	
	ps.executeUpdate();
	
	out.println("<font size=5 color=purple>Branch created"+"<br>"+"Branch ID:"+bcode);
	out.println("<br>Your will be redirected to main page within a few seconds");
	response.setHeader("Refresh", "5; URL=admin_home.jsp");
	
	ps.close();
    }
    else
    {
    	out.print("<center><font size=5 color=purple>Choose different name as Branch-name<br><a href=add_branch.jsp>Please try again</a>");
    }
}
catch(Exception e)
{
	out.print(e);
}
%>

</body>
</html>