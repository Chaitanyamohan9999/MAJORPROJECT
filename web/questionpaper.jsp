<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@ page import="java.sql.*" import="databaseconnection.*"%>




<%@ page import="java.io.*"%>
<%@ page import="java.math.BigInteger"%>
<%@ page import="java.sql.SQLException"%>

<%@ page import="javax.swing.JFrame"%>
<%@ page import="org.apache.poi.xwpf.usermodel.*"%>
<%@ page import="org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblWidth"%>
<%@ page import="org.openxmlformats.schemas.wordprocessingml.x2006.main.STTblWidth"%>





<%Connection c = null;
	Statement st = null;
    ResultSet rs=null;
    // String[] br_y = {"1 a)","1 b)","2 a)","2 b)"}; 
     
    // String[] br_m = {"7","8"}; 
String course=request.getParameter("Course");
String Regulation=request.getParameter("Regulation");
String branch=request.getParameter("branch");
String year=request.getParameter("year");
String Semister=request.getParameter("Semister");
String subject=request.getParameter("subject");
System.out.println("oldaaaaaaaaa   "+subject);
String resultx = subject.replaceAll(" ","");
System.out.println("newaaaaaaa   "+subject);
XWPFDocument doc = new XWPFDocument();
		FileOutputStream out1  = new FileOutputStream("QuestionPaper.doc");
        	
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
		    st = c.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	for(int j=1;j<=5;j++)
	{
            
          
                //String resultx = args[5].replaceAll(" ", "");
		String sql = "SELECT U"+j+" FROM `"+resultx+"` ORDER by RAND() limit 3 ";
                System.out.println("hhhh"+sql);
		try {
			rs = st.executeQuery(sql);
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
                        response.sendRedirect("Course.jsp?msg=fail");
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
                //response.sendRedirect("Course.jsp?msg=success");                           
      %>
