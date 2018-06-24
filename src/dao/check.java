package dao;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBUtils.GetStatementObject;

@WebServlet("/check")
public class check extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public check() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Statement statement = new GetStatementObject().getStatementObject();

		String passname = request.getParameter("passname");
		String sql = "select * from user where passname='" + passname+"'";
		try {
			ResultSet resultSet = statement.executeQuery(sql);
			while(resultSet.next())
			{
				response.getWriter().print("ture");
				return ;
			}
			response.getWriter().print("false");
			return ;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
