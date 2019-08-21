<%@ page import="java.sql.*" import="databaseconnection.*"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>

<%@ page import="java.io.*"%>
<%@ page import="java.math.BigInteger"%>
<%@ page import="java.sql.SQLException"%>

<%@ page import="javax.swing.JFrame"%>
<%@ page import="org.apache.poi.xwpf.usermodel.*"%>
<%@ page import="org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblWidth"%>
<%@ page import="org.openxmlformats.schemas.wordprocessingml.x2006.main.STTblWidth"%>


<% 
String su = request.getQueryString();
Connection con = null;
System.out.println("OLD STRING"+su);
  String subject = (String)session.getAttribute("subject");
if(su!=null){
    subject  = su.replaceAll("%20"," ");
    System.out.println("NEW STRING"+subject);
    session.setAttribute("subject",subject);
} else {
    
}
    
    Statement st = null;
    ResultSet rs1=null;

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

.questionscontainer{
    position: absolute;
    left: 460px;
    top: 650px;
}
 
/* Holly Hack for IE \*/
* html .sidebarmenu ul li { float: left; height: 1%; }
* html .sidebarmenu ul li a { height: 1%; }
/* End */

</style>

</head>
<body>
<div id="topContainer">    
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
<form method="post" name="form" action="Generate.jsp">

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
            <td width="101" height="46" class="paragraping"><font size="3">Semester</font></td>
<td width="172" class="name"><input name="Semister" value="<%=semister%>"></td>
</tr>

<tr>
            <td width="101" height="46" class="paragraping"><font size="3">Subject</font></td>
<td width="172" class="name"><input name="subject" size="40" value="<%=subject%>"></td>
</tr>

<tr>
<td height="35"></td>
<td><input type="submit" name="B1" class="button2" onclick="generateBtn()" value="Generate Question Paper" style="background-color: yellowgreen;color: #ffffff; height:30px;width:260px;">
</td>
</tr>
</form>

</table>
      </fieldset>          
 </div>



    <div id="questioncontainer" class="questionscontainer">
    
    <%
       String generateBtn = (String)session.getAttribute("generateBtn");
       
      String  SubjectfromSession = (String)session.getAttribute("subject");
       if(SubjectfromSession!=null && !SubjectfromSession.equals("") && generateBtn!=null && generateBtn.equals("generated") ) {
           out.write("<h3>Generated Questions:</h3>");
        Connection c = null;
Statement subjectdStatement = null;
    ResultSet rs=null;
    // String[] br_y = {"1 a)","1 b)","2 a)","2 b)"}; 
     
    // String[] br_m = {"7","8"}; 
String course=request.getParameter("Course");
String Regulation = request.getParameter("Regulation");
String Semister=request.getParameter("Semister");
System.out.println("oldaaaaaaaaa   "+subject);
String resultx = subject.replaceAll(" ","");
System.out.println("newaaaaaaa   "+subject);
XWPFDocument doc = new XWPFDocument();
               // String webInfPath = getServletConfig().getServletContext().getRealPath("/WEB-INF/generated_questions/");
               // System.out.println("webInfPath "+webInfPath);
                File file = new File("QuestionPaper.doc");
               
FileOutputStream out1  = new FileOutputStream(file);
        
        XWPFParagraph para = doc.createParagraph();
        para.setAlignment(ParagraphAlignment.CENTER);
        XWPFRun title = para.createRun();
        title.setText(year+" "+course+" "+Semister+" Semister Examination");
        title.setFontSize(15);
        title.setBold(true);
        title.setFontFamily("Times New Roman");
        
        
        XWPFParagraph sub_name = doc.createParagraph();
        sub_name.setAlignment(ParagraphAlignment.CENTER);
        XWPFRun sub_run = sub_name.createRun();
        sub_run.setText("( "+subject+" )");
        sub_run.setBold(true);
        sub_run.setFontSize(12);
        sub_run.setFontFamily("Times New Roman");
        sub_run.addBreak();
        
        XWPFParagraph para3 = doc.createParagraph();
        para3.setAlignment(ParagraphAlignment.LEFT);
        XWPFRun para3_run = para3.createRun();
        para3_run.setText("Time : 3Hours                                                                                      Max Marks : 75");
        para3_run.setBold(true);
        para3_run.setFontSize(12);
        para3_run.setFontFamily("Times New Roman");
        para3_run.addBreak();
                para3_run.addBreak();
               
        //para3_run.setText("Max Marks : 75");
        
        XWPFParagraph inst1 = doc.createParagraph();
        inst1.setAlignment(ParagraphAlignment.CENTER);
        XWPFRun inst1_run = inst1.createRun();
        inst1_run.setText("Answer Any FIVE of the following");
        inst1_run.setFontSize(12);
        inst1_run.setBold(true);
        inst1_run.setFontFamily("Times New Roman");
        inst1_run.addBreak();
        
        XWPFParagraph inst2 = doc.createParagraph();
        inst2.setAlignment(ParagraphAlignment.CENTER);
        XWPFRun inst2_run = inst1.createRun();
        inst2_run.setText("All Questions Carry Equal Marks..");
        inst2_run.setFontSize(12);
        inst2_run.setBold(true);
        inst2_run.setFontFamily("Times New Roman");
        
        XWPFTable table = doc.createTable(14,3);
    XWPFTableRow tableRowOne = table.getRow(0);
    /*CTTblWidth width = table.getCTTbl().addNewTblPr().addNewTblW();
    width.setType(STTblWidth.DXA);
    width.setW(BigInteger.valueOf(9072));*/
    CTTblWidth width0 = tableRowOne.getCell(0).getCTTc().addNewTcPr().addNewTcW();
    width0.setType(STTblWidth.DXA);
    width0.setW(BigInteger.valueOf(1000));
    CTTblWidth width2 = tableRowOne.getCell(2).getCTTc().addNewTcPr().addNewTcW();
    width2.setType(STTblWidth.DXA);
    width2.setW(BigInteger.valueOf(1000));
    CTTblWidth width1 = tableRowOne.getCell(1).getCTTc().addNewTcPr().addNewTcW();
    width1.setType(STTblWidth.DXA);
    width1.setW(BigInteger.valueOf(7000));
    
    table.getRow(0).getCell(0).setText("1 a)");
    table.getRow(1).getCell(0).setText("1 b)");
    table.getRow(2).getCell(0).setText("2 a)");
    table.getRow(3).getCell(0).setText("2 b)");
    table.getRow(4).getCell(0).setText("3 a)");
    table.getRow(5).getCell(0).setText("3 b)");
    table.getRow(6).getCell(0).setText("4 a)");
    table.getRow(7).getCell(0).setText("4 b)");
    table.getRow(8).getCell(0).setText("5 a)");
    table.getRow(9).getCell(0).setText("5 b)");
    table.getRow(10).getCell(0).setText("6 a)");
    table.getRow(11).getCell(0).setText("6 b)");
    table.getRow(12).getCell(0).setText("7 a)");
    table.getRow(13).getCell(0).setText("7 b)");
    
    table.getRow(0).getCell(2).setText("7");
    table.getRow(1).getCell(2).setText("8");
    table.getRow(2).getCell(2).setText("7");
    table.getRow(3).getCell(2).setText("8");
    table.getRow(4).getCell(2).setText("7");
    table.getRow(5).getCell(2).setText("8");
    table.getRow(6).getCell(2).setText("7");
    table.getRow(7).getCell(2).setText("8");
    table.getRow(8).getCell(2).setText("7");
    table.getRow(9).getCell(2).setText("8");
    table.getRow(10).getCell(2).setText("7");
    table.getRow(11).getCell(2).setText("8");
    table.getRow(12).getCell(2).setText("7");
    table.getRow(13).getCell(2).setText("8");
           
                
                //second part
                
                String quest[] = new String[15];int i=0;

try {
Class.forName("com.mysql.jdbc.Driver");
c = DriverManager.getConnection("jdbc:mysql://localhost/gr11?serverTimezone=EST5EDT","root","Mysql@123");
   subjectdStatement = c.createStatement();
} catch (Exception e) {
e.printStackTrace();
}
for(int j=1;j<=5;j++)
{
            
          
                //String resultx = args[5].replaceAll(" ", "");
String sql = "SELECT U"+j+" FROM `"+resultx+"` ORDER by RAND() limit 3 ";
                System.out.println("hhhh"+sql);
try {
rs = subjectdStatement.executeQuery(sql);
while(rs.next())
{ System.out.println("xxxxxxx");
quest[i] = rs.getString(1)+"";
//table.getRow(0).getCell(1).setText(rs.getString(1)+"");
//System.out.println(quest[i]);
     i++;
}
} catch (Exception e) {
// TODO Auto-generated catch block
System.out.println("Cannot Ascess");
                        e.printStackTrace();
                        //response.sendRedirect("Course.jsp?msg=fail");
}
}
table.getRow(0).getCell(1).setText(quest[0]);
table.getRow(1).getCell(1).setText(quest[1]);
table.getRow(10).getCell(1).setText(quest[2]);

table.getRow(2).getCell(1).setText(quest[3]);
table.getRow(3).getCell(1).setText(quest[4]);
table.getRow(11).getCell(1).setText(quest[5]);

table.getRow(4).getCell(1).setText(quest[6]);
table.getRow(5).getCell(1).setText(quest[7]);
//table.getRow(12).getCell(1).setText(quest[8]);

table.getRow(6).getCell(1).setText(quest[9]);
table.getRow(7).getCell(1).setText(quest[10]);
table.getRow(12).getCell(1).setText(quest[11]);

table.getRow(8).getCell(1).setText(quest[12]);
table.getRow(9).getCell(1).setText(quest[13]);
table.getRow(13).getCell(1).setText(quest[14]);
out.print("<ol>");
                for(i=0; i<quest.length; i++){
                   out.print("<li>");
                    out.println(quest[i]);
                  out.print("</li>");
                   
                }
                  out.print("</ol>");
                
doc.write(out1);  
                //session.setAttribute("questionsfile", out1.toString());
                out1.flush();
                out1.close();
                
                
              
               out.print("<button onClick='downloadQuestions()'>Download File</button>");
                //response.sendRedirect("Course.jsp?msg=success");   
       }
      %>
    
      
    </div>



   </div>                                
                     
       

<!--FOOTER--> 

<!--END OF FOOTER--> 
</div>



</div>
      
      <script>
         function  generateBtn(){
           console.log("Generate Btn Clicked");
          <% 
              session.setAttribute("generateBtn", "generated"); 
          %>
          }
          
         function  downloadQuestions(){
             var req = new XMLHttpRequest();
     req.open("GET", "/QuestionPaperGenerator/DownloadQuestions", true);
     req.responseType = "blob";
     req.onload = function (event) {
         var blob = req.response;
         var fileName = req.getResponseHeader("filename") //if you have the fileName header available
         var link=document.createElement('a');
         link.href=window.URL.createObjectURL(blob);
         if(fileName===null){
             link.download="QuestionPaper.doc";
         }
         
         link.click();
     };

     req.send();
              console.log("DownloadQuestions clicked");
          }
         
      </script>
</body>
</html>
