package Product.TableModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Engine.Mysql;

public class CategoryDAO {

	public Categorybean getCategoryAddr(int category, int maincate, int subcate) { // 카테고리 경로 보여주기
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Categorybean cateaddr = null;
		String sql = "";
		try {
			con = Mysql.getConnection();
			if (category != 0) { // 소분류 클릭했을때
				sql = "select * from category where indexnum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, category);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					cateaddr = new Categorybean();
					cateaddr.setMainmemo(rs.getString("mainmemo"));
					cateaddr.setSubmemo(rs.getString("submemo"));
					cateaddr.setSub2memo(rs.getString("sub2memo"));
					cateaddr.setMaincate(maincate);
					cateaddr.setSubcate(subcate);
					cateaddr.setIndexnum(category);
				}
			} else {
				if (subcate == 0) { // 대분류 클릭했을때
					sql = "select * from category where maincate=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, maincate);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						cateaddr = new Categorybean();
						cateaddr.setMainmemo(rs.getString("mainmemo"));
						cateaddr.setMaincate(maincate);
					}
				} else { // 중분류 클릭했을때
					sql = "select * from category where maincate=? and subcate=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, maincate);
					pstmt.setInt(2, subcate);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						cateaddr = new Categorybean();
						cateaddr.setMainmemo(rs.getString("mainmemo"));
						cateaddr.setSubmemo(rs.getString("submemo"));
						cateaddr.setMaincate(maincate);
						cateaddr.setSubcate(subcate);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return cateaddr;
	}
}