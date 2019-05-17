package ProductBoard.TableModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.media.jai.GeometricOpImage;

import Engine.Mysql;
import MemberBoard.TableModel.MemberBoardbean;

public class ProductBoardDAO {

	public int getQnaCount(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;
		try {
			con = Mysql.getConnection();
				sql = "select count(*) from product_board where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return count;
	}//getQnaCount
	
	public int getQnaSellerCount(int seller_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;
		try {
			con = Mysql.getConnection();
				sql = "select count(*) from product_board where seller_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, seller_no);
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return count;
	}//getQnaCount
	
	public void writeQna(ProductBoardbean pbbean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int num = 0;
		try {
			con = Mysql.getConnection();
			sql = "insert into product_board(id,seller_no,pw,subject,content,product_no,date) values(?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pbbean.getId());
			pstmt.setInt(2, pbbean.getSeller_no());
			pstmt.setString(3, pbbean.getPw());
			pstmt.setString(4, pbbean.getSubject());
			pstmt.setString(5, pbbean.getContent());
			pstmt.setInt(6, pbbean.getProduct_no());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt);
		}
	}//writeQna 끝
	
	
	public List<ProductBoardbean> getQnaList(String id, int startRow, int pageSize) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<ProductBoardbean> pboardList = new ArrayList<ProductBoardbean>();
		try {
			con = Mysql.getConnection();
			sql = "select * from product_board where id like ? order by date desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow - 1);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductBoardbean pbbean = new ProductBoardbean();
				pbbean.setProduct_no(rs.getInt("product_no"));
				pbbean.setNum(rs.getInt("num"));
				pbbean.setId(rs.getString("id"));
				pbbean.setSeller_no(rs.getInt("seller_no"));
				pbbean.setPw(rs.getString("pw"));
				pbbean.setSubject(rs.getString("subject"));
				pbbean.setContent(rs.getString("content"));
				pbbean.setDate(rs.getDate("date"));
				pbbean.setQnastatus(rs.getInt("qnastatus"));
				pboardList.add(pbbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return pboardList;
	} //pboardList 끝	
	
	public List<ProductBoardbean> getQnaSellerList(int seller_no, int startRow, int pageSize) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<ProductBoardbean> pboardList = new ArrayList<ProductBoardbean>();
		try {
			con = Mysql.getConnection();
			sql = "select * from product_board where seller_no like ? order by date desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, seller_no);
			pstmt.setInt(2, startRow - 1);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductBoardbean pbbean = new ProductBoardbean();
				pbbean.setProduct_no(rs.getInt("product_no"));
				pbbean.setNum(rs.getInt("num"));
				pbbean.setId(rs.getString("id"));
				pbbean.setSeller_no(rs.getInt("seller_no"));
				pbbean.setPw(rs.getString("pw"));
				pbbean.setSubject(rs.getString("subject"));
				pbbean.setContent(rs.getString("content"));
				pbbean.setDate(rs.getDate("date"));
				pbbean.setQnastatus(rs.getInt("qnastatus"));
				pboardList.add(pbbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return pboardList;
	} //pboardList 끝	
	
	
	public ProductBoardbean getDetailViewQna(int num) { //문의 내용보기
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		ProductBoardbean pbbean = null;
		try {
			con = Mysql.getConnection();
			sql = "select * from product_board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pbbean = new ProductBoardbean();
				pbbean.setContent(rs.getString("content"));
				pbbean.setDate(rs.getDate("date"));
				pbbean.setId(rs.getString("id"));
				pbbean.setNum(rs.getInt("num"));
				pbbean.setPw(rs.getString("pw"));
				pbbean.setReadcount(rs.getInt("readcount"));
				pbbean.setSubject(rs.getString("subject"));
				pbbean.setQnastatus(rs.getInt("qnastatus"));
				pbbean.setReply(rs.getString("reply"));
				pbbean.setReadcount(rs.getInt("readcount"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return pbbean;
	}// getDetailViewQna 끝
	
	
	public void updateQna(ProductBoardbean pbbean) { //문의 수정
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			con = Mysql.getConnection();
			
			String sql = "update product_board set id=?, pw=?, subject=?, content=?, reply=? "
					+ "where num=?";
						
			
			System.out.println("a"+pbbean.getNum());
			System.out.println("b" +pbbean.getPw());
			System.out.println("c"+pbbean.getPw());
			System.out.println("d"+pbbean.getSubject());
			System.out.println("e"+pbbean.getContent());
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, pbbean.getId());
			pstmt.setString(2, pbbean.getPw());
			pstmt.setString(3, pbbean.getSubject());
			pstmt.setString(4, pbbean.getContent());
			pstmt.setString(5, pbbean.getReply());
			pstmt.setInt(6, pbbean.getNum());
			
			
			
			pstmt.executeUpdate();
			System.out.println();
			con.close();
					
		} catch (Exception e) {
			System.out.println("getConnection" + e);
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		
	}//updateQna 끝
	
	
	public void deleteQna(int num, String pw) { //문의 삭제
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		
		try {
			con = Mysql.getConnection();
			sql = "delete from product_board where num=? and pw=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, pw);
			pstmt.executeUpdate();
		
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		
	}
	
}
