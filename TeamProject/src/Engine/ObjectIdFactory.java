package Engine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class ObjectIdFactory extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static ObjectIdFactory uniqueInstance;
	private static final int FIRST_ID = 0x100000;
	private static int _curId = 0;

	public static ObjectIdFactory getInstance() {
		if (uniqueInstance == null) {
			uniqueInstance = new ObjectIdFactory();
		}
		return uniqueInstance;
	}

	public synchronized int nextId() {
		return _curId++;
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		getInstance(); // 최초 서블릿에서 로드시 객체 1번생성
		loadState();
	}

	private void loadState() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			try {
				con = Mysql.getConnection();
			} catch (Exception e) {
				e.printStackTrace();
			}
			pstmt = con.prepareStatement("select max(id)+1 as nextid from (select seller_no as id from member union all select product_no as id from product) obj");
			rs = pstmt.executeQuery();
			int id = 0;
			if (rs.next()) {
				id = rs.getInt("nextid");
			}
			if (id < FIRST_ID) {
				id = FIRST_ID;
			}
			_curId = id;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
	}
}