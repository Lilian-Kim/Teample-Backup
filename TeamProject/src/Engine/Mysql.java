package Engine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Mysql {
	// 디비 연결 메소드
	public static Connection getConnection() throws Exception {
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jaturi");
		con = ds.getConnection();
		return con;
	}

	public static void freeConnection(Connection c, Statement s, ResultSet r) {
		try {
			if (r != null)
				r.close();
			if (s != null)
				s.close();
			if (c != null)
				c.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void freeConnection(Connection c, PreparedStatement p, ResultSet r) {
		try {
			if (r != null)
				r.close();
			if (p != null)
				p.close();
			if (c != null)
				c.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void freeConnection(Connection c, PreparedStatement p) {
		try {
			if (p != null)
				p.close();
			if (c != null)
				c.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}