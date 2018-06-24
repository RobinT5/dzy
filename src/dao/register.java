package dao;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBUtils.GetStatementObject;

@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public register() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Statement statement = new GetStatementObject().getStatementObject();

		String passname = request.getParameter("passname");
		String password=request.getParameter("password");
		String sql = "insert into user values(null,'" + passname+"','"+password+"')";
		try {
			statement.execute(sql);
			response.getWriter().print("<a href=\"/dzy/view/login.html\">注册成功，点击返回登陆页面。。</a>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
