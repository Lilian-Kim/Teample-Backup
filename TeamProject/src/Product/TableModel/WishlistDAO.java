package Product.TableModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Engine.Mysql;

public class WishlistDAO {

	public void insertWhislist(Wishlistbean wbean) { // 상품등록
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Mysql.getConnection();
			String sql = "insert into wishlist (id,product_no,product_name,e_time,state) values (?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, wbean.getId());
			pstmt.setInt(2, wbean.getProduct_no());
			pstmt.setString(3, wbean.getProduct_name());
			pstmt.setTimestamp(4, wbean.getE_time());
			pstmt.setInt(5, wbean.getState());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt);
		}
	}

	public List<Wishlistbean> getWishlist(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Wishlistbean> wishlist = null;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("select * from wishlist where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			wishlist = new ArrayList<Wishlistbean>();
			while (rs.next()) {
				Wishlistbean wbean = new Wishlistbean();
				wbean.setId(rs.getString("id"));
				wbean.setProduct_no(rs.getInt("product_no"));
				wbean.setProduct_name(rs.getString("product_name"));
				wbean.setE_time(rs.getTimestamp("e_time"));
				wbean.setState(rs.getInt("state"));
				wishlist.add(wbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return wishlist;
	}

	public boolean getwishcheck(String id, int product_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean ck = false;
		try {
			con = Mysql.getConnection();
			String sql = "select product_no from wishlist where id=? and product_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, product_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ck = false;
			} else {
				ck = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return ck;
	}
}
