<%@ page import="java.sql.*" import="databaseconnection.*"%>
<% 
String su = request.getQueryString();Connection con = null;
System.out.println("OLD STRING"+su);
String subject = su.replaceAll("%20"," ");
System.out.println("NEW STRING"+subject);
Statement st = null;
    ResultSet rs1=null;
session.setAttribute("subject",subject);	
          String domain=(String)session.getAttribute("domain");            
                String subdomain1=(String)session.getAttribute("subdomain");
                String branch=(String)session.getAttribute("branch");
                String year=(String)session.getAttribute("year");
                  String semister=(String)session.getAttribute("semister");
       
        
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
<form method="post" name="form" action="questionpaper.jsp">

<tr>
<td width="163" height="46" class="paragraping"><font size="3">Course</font></td>
<td width="191" class="fielditem"><input name="Course" value="<%=domain%>">
</td>
</tr> 
<tr>
            <td width="101" height="46" class="paragraping"><font size="3">Regulation</font></td>
<td width="172" class="name"><input name="Regulation" value="<%=subdomain1%>">
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
<td width="172" class="name"><input name="subject" size="40" value="<%=subject%>"></td>
</tr>

<tr>
<td height="35"></td>
<td><input type="submit" name="B1" class="button2" value="Generate Question Paper" style="background-color: yellowgreen;color: #ffffff; height:30px;width:260px;">
</td>
</tr>
</form>

</table>
      </fieldset>          
 </div>
   </div>                                
                     
       

<!--FOOTER--> 

<!--END OF FOOTER--> 
</div>
</body>
</html>
