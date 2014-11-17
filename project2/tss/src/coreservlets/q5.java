package coreservlets;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import java.util.*;
import java.sql.*;

@WebServlet("/query5")
public class q5 extends HttpServlet {
  @Override
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {

	  //http://stackoverflow.com/questions/11652431/eclipse-add-jar-to-dynamic-web-project
	 	  
	  Connection conn = null;
	  try {
		 // Register JDBC driver
         Class.forName("org.postgresql.Driver");
         conn = DriverManager
            .getConnection("jdbc:postgresql://localhost:5432/tss",
            "kinsumliu", "pw");

		  // Open a connection 
		  Statement stmt = conn.createStatement();
		  ResultSet rs = stmt.executeQuery(
				  "SELECT * FROM Coaudition C WHERE C.name1 < C.name2"
				  );
		  		  
		  String docType =
			      "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
			      "Transitional//EN\">\n";
		  String title = "Query 5";
		  docType += "<HTML>\n"+
				  "<HEAD><TITLE>" + title + "</TITLE></HEAD>\n" +
				  "<H1 ALIGN=CENTER>" + title + "</H1>\n";
		  while (rs.next()){
			  String name1 = rs.getString("name1");
			  String name2 = rs.getString("name2");
			  docType += name1 +"	" + name2 + "<br>\n";
		  }
		  docType += "</HTML>";
		  PrintWriter out = response.getWriter();
		  out.println(docType);
		  rs.close();
		  stmt.close();
		  conn.close();
	  } catch (Exception e){
		  e.printStackTrace();
	  }  
  }

  @Override
  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
