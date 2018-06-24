package DBUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class GetStatementObject {
	public Statement getStatementObject() {

		Statement statement = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost/personwebsite?characterEncoding=UTF-8",
					"root", "t123h456");
			statement = c.createStatement();
			return statement;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return statement;

		}

	}
}
