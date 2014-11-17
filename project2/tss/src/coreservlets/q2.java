/****************************************************************************
 *                 CSE532 -- Project 2
 * File name: q2.java
 * Author(s): Kin Sum Liu (109247869), Hao-Tsung Yang (109892492)
 * Brief description: Servlet to execute Query 2 and create the html to display the result
 ****************************************************************************/

package coreservlets;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import java.util.*;
import java.sql.*;

@WebServlet("/query2")
public class q2 extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// http://stackoverflow.com/questions/11652431/eclipse-add-jar-to-dynamic-web-project

		Connection conn = null;
		try {
			// Register JDBC driver
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection(
					"jdbc:postgresql://localhost:5432/tss", "kinsumliu", "pw");

			// Open a connection
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt
					.executeQuery("SELECT C1.name AS name1, C2.name AS name2 "
							+ "FROM Contestants C1, Contestants C2, "
							+ "Performances P1, Performances P2 "
							+ "WHERE P1.piece = P2.piece AND "
							+ "P1.contestant = C1.oid AND "
							+ "P2.contestant = C2.oid AND "
							+ "C1.name < C2.name AND "
							+ "( SELECT avg(r.score) FROM unnest(P1.results) r) = ( SELECT avg(r.score) FROM unnest(P2.results) r) ");

			String docType = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 "
					+ "Transitional//EN\">\n";
			String title = "Query 2";
			docType += "<HTML>\n" + "<HEAD><TITLE>" + title
					+ "</TITLE></HEAD>\n" + "<H1 ALIGN=CENTER>" + title
					+ "</H1>\n";
			while (rs.next()) {
				String name1 = rs.getString("name1");
				String name2 = rs.getString("name2");
				docType += name1 + "	" + name2 + "<br>\n";
			}
			docType += "</HTML>";
			PrintWriter out = response.getWriter();
			out.println(docType);
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
