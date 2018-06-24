package dao;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBUtils.GetStatementObject;

@WebServlet("/addartical")
public class addartical extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public addartical() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Statement statement = new GetStatementObject().getStatementObject();
		String type = request.getParameter("type");
		String content ;
		String title = request.getParameter("title");
		String sql = "select max(aid) from artical";
		int aid;
		try {
			ResultSet resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				aid = Integer.parseInt(resultSet.getString(1)) + 1;
				content=
						"<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\" pageEncoding=\"UTF-8\"%>"
						+ "<%@ taglib uri=\"http://java.sun.com/jsp/jstl/core\" prefix=\"c\" %>"
						+ "<%@ taglib uri=\"http://java.sun.com/jsp/jstl/functions\" prefix=\"fn\" %>"
						+ "<jsp:include page=\"/conment/head.jsp\" ></jsp:include>"
						+"文章主体:<br><p class=\"artical\">"
						+ "<c:out value=\""
						+request.getParameter("content").replace("\n", "<br>")
						+"\"  escapeXml=\"false\" />"
						+ "</p><jsp:include page=\"/conment/conment.jsp\" ><jsp:param name=\"id\" value=\""
						+aid
						+"\" />"
						+ "</jsp:include>";
				System.out.println(request.getParameter("content"));
				sql = "insert into artical values(" + aid + "," + type + ",'" + title + "')";
				System.out.println(this.getServletContext().getRealPath(""));
				new GetStatementObject().getStatementObject().execute(sql);
				File f = new File(request.getServletContext().getRealPath("artical"), aid + ".jsp");
				// f.getParentFile().mkdirs();
				f.createNewFile();
				OutputStreamWriter write = new OutputStreamWriter(new FileOutputStream(f), "UTF-8");
				BufferedWriter writer = new BufferedWriter(write);
				writer.write(content);
				writer.close();
				response.getWriter().print("<a href=\"/dzy/main/home.jsp\">插入成功，点击返回。。</a>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
