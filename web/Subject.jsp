<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*" import="databaseconnection.*"%>
<% 
String semister = request.getQueryString();Connection con = null;
	Statement st = null;
    ResultSet rs1=null;
	session.setAttribute("semister",semister);	
          String domain=(String)session.getAttribute("domain");            
                String subdomain1=(String)session.getAttribute("subdomain");
                String branch=(String)session.getAttribute("branch");
                String year=(String)session.getAttribute("year");
                String year_semister=year+"_"+semister;
       try{
		Class.forName("com.mysql.jdbc.Driver"); 
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gr11","root","root");
		st = con.createStatement();
		String str1="select *  from "+branch+"";
                System.out.println(str1);
		rs1=st.executeQuery(str1); 
        
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Automatic Question Paper Generator</title>
<link href="css/common.css" rel="stylesheet" type="text/css" />
<style type="text/css">

.sidebarmenu ul{
margin: 0;
padding: 0;
list-style-type: none;
font: bold 13px Verdana;
width: 180px; /* Main Menu Item widths */
border-bottom: 1px solid #ccc;
}
 
.sidebarmenu ul li{
position: relative;
}

/* Top level menu links style */
.sidebarmenu ul li a{
display: block;
overflow: auto; /*force hasLayout in IE7 */
color: white;
text-decoration: none;
padding: 6px;
border-bottom: 1px solid #778;
border-right: 1px solid #778;
}

.sidebarmenu ul li a:link, .sidebarmenu ul li a:visited, .sidebarmenu ul li a:active{
background-color: #FFAB21; /*background of tabs (default state)*/
}

.sidebarmenu ul li a:visited{
color: white;
}

.sidebarmenu ul li a:hover{
background-color: black;
}

/*Sub level menu items */
.sidebarmenu ul li ul{
position: absolute;
width: 170px; /*Sub Menu Items width */
top: 0;
visibility: hidden;
}

.sidebarmenu a.subfolderstyle{
background: url(right.gif) no-repeat 97% 50%;
}

 
/* Holly Hack for IE \*/
* html .sidebarmenu ul li { float: left; height: 1%; }
* html .sidebarmenu ul li a { height: 1%; }
/* End */

</style>
<script type="text/javascript">
	
function fu()
{
 

var c=document.form.subject.options[document.form.subject.selectedIndex].value;


window.location="./Generate.jsp?"+c;

}
</script>
</head>
<body>
<div id="Container">
<div><img src="images/bb.jpeg" width="1362" height="150" ></div>
<div style="position:absolute; left:30px; top:20px"> </div>
<div style="position:absolute; left:260px;  top:60px"><font size="6"><img src="images/cooltext191952079640160.png" ></font></div>

  
  <!--CONTENT -->
  <div id="Content">
    

 <div style="position:absolute; left:460px; top:180px"> 
  <h1 style="position:absolute; left:160px;"><font size="4">Question Paper Generator</font></h1>
  <br><br>
 <fieldset style="border: 2px #FF9900 solid;">
       <legend><font color="#000099" size="4"><strong>View</strong></font></legend>

	
		  <table width="366" align="center">
<form method="post" name="form">

<tr>
<td width="163" height="46" class="paragraping"><font size="3">Course</font></td>
<td width="191" class="fielditem"><input name="domain" value="<%=domain%>">
</td>
</tr> 
<tr>
            <td width="101" height="46" class="paragraping"><font size="3">Regulation</font></td>
<td width="172" class="name"><input name="subdomain" value="<%=subdomain1%>">
		</td>
</tr>
<tr>
            <td width="101" height="46" class="paragraping"><font size="3">Branch</font></td>
<td width="172" class="name"><input name="branch" value="<%=branch%>">
</td>
</tr>
<tr>
            <td width="101" height="46" class="paragraping"><font size="3">Year</font></td>
<td width="172" class="name"><input name="year" value="<%=year%>"></td>
</tr>
<tr>
            <td width="101" height="46" class="paragraping"><font size="3">Semister</font></td>
<td width="172" class="name"><input name="Semister" value="<%=semister%>"></td>
</tr>

<tr>
            <td width="101" height="46" class="paragraping"><font size="3">Subject</font></td>
<td width="172" class="name"><select type="text"  name="subject" onChange="fu()">
<option>-----Select Subject----</option>
        
<%
		while(rs1.next())
		{
                     
                    
		%>
				<option value="<%=rs1.getString(year_semister)%>"><%= rs1.getString(year_semister)%></option>

		<%
                
                /*Class.forName("com.mysql.jdbc.Driver"); 
		Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/gr11","root","root");
		Statement st1 = con1.createStatement();
                String result = rs1.getString(year_semister).replaceAll(" ", "");
		String str11="create table "+result+"(U1 varchar(600),U2 varchar(600),U3 varchar(600),U4 varchar(600),U5 varchar(600));";
                System.out.println(str11);
                System.out.println("xxxxxxxxxx"+result);
		int res1=st1.executeUpdate(str11);
	    
               */
                
                }
                		
       
		%>
                
		</select></td>
</tr>




</form>
<%
}
	catch(Exception e2){
		out.println(e2.getMessage());
	}
%>
</table>
      </fieldset>          
 </div>
   </div>                                
                     
       

<!--FOOTER--> 

<!--END OF FOOTER--> 
</div>
</body>
</html>
