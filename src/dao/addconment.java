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

@WebServlet("/addconment")
public class addconment extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public addconment() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String aid=request.getParameter("aid");
		String content=request.getParameter("content");
//		System.out.println(1);
		Statement statement=new GetStatementObject().getStatementObject();
		String sql="insert into conment values(null,"+aid+",'"+content+"',null)"; 
		response.sendRedirect("/dzy/artical?cid="+aid);
		try {
			statement.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
