import java.io.*;
import java.sql.*;
import javax.servlet.*;
public class LoginServlet extends GenericServlet
{
	Connection con;
	public void init()
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
	}
	public void service(ServletRequest req,ServletResponse res)
	{
		try
		{
			String s1=req.getParameter("uname");
			String s2=req.getParameter("pword");
			PreparedStatement s=con.prepareStatement("Select * from uinfo where uname=? and pword=?");
			s.setString(1,s1);
			s.setString(2,s2);
			ResultSet rs=s.executeQuery();
			PrintWriter pw=res.getWriter();
			pw.print("<html><body bgcolor=blue text=green><h1>");
			if(rs.next())
			{
                  pw.print("welcome"+s1);
			}
          else
             {
                   pw.print("invalid username/password");
             }
            pw.print("</h1></body></html>");
        }
        catch(Exception	e)
        {
	      System.out.print(e);
        }
    }
}
