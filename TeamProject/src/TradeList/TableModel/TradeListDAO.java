package TradeList.TableModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Engine.Mysql;

public class TradeListDAO {

	// 구매내역페이지중 판매물품 리스트 가져오는 메소드
	public List<TradeListbean> getSellList(int seller_no, int sellTab) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<TradeListbean> sellList = null;

		try {
			con = Mysql.getConnection();
			if (sellTab == 0) { // 기간별 검색 전체
				pstmt = con.prepareStatement("select * from purchase_list where seller_no=? order by e_time desc");
			} else if (sellTab == 1) { // 기간별 검색 최근 1개월
				pstmt = con.prepareStatement("select * from purchase_list where seller_no=? and e_time BETWEEN DATE_ADD(NOW(),INTERVAL -1 MONTH ) AND NOW() ORDER BY e_time desc;");
			} else if (sellTab == 3) { // 기간별 검색 최근 3개월
				pstmt = con.prepareStatement("select * from purchase_list where seller_no=? and e_time BETWEEN DATE_ADD(NOW(),INTERVAL -3 MONTH ) AND NOW() ORDER BY e_time desc;");
			} else if (sellTab == 6) { // 기간별 검색 최근 6개월
				pstmt = con.prepareStatement("select * from purchase_list where seller_no=? and e_time BETWEEN DATE_ADD(NOW(),INTERVAL -6 MONTH ) AND NOW() ORDER BY e_time desc;");
			}
			pstmt.setInt(1, seller_no);
			rs = pstmt.executeQuery();
			sellList = new ArrayList<TradeListbean>();
			while (rs.next()) {
				TradeListbean tbean = new TradeListbean();
				tbean.setSeller_no(rs.getInt("seller_no"));
				tbean.setProduct_no(rs.getInt("product_no"));
				tbean.setProduct_name(rs.getString("product_name"));
				tbean.setProduct_mainimg(rs.getString("product_mainimg"));
				tbean.setE_time(rs.getTimestamp("e_time"));
				tbean.setPrice_end(rs.getInt("price_end"));
				tbean.setBuyer_no(rs.getInt("buyer_no"));
				sellList.add(tbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return sellList;
	}// getSellList끝

	// 구매내역페이지중 구매물품 리스트 가져오는 메소드
	public List<TradeListbean> getBuyList(int seller_no, int buyTab) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<TradeListbean> buyList = null;
		try {
			con = Mysql.getConnection();
			if (buyTab == 0) { // 기간별 검색 전체
				pstmt = con.prepareStatement("select * from purchase_list where buyer_no=? order by e_time desc");
			} else if (buyTab == 1) { // 기간별 검색 최근 1개월
				pstmt = con.prepareStatement("select * from purchase_list where buyer_no=? and e_time BETWEEN DATE_ADD(NOW(),INTERVAL -1 MONTH ) AND NOW() ORDER BY e_time desc;");
			} else if (buyTab == 3) { // 기간별 검색 최근 3개월
				pstmt = con.prepareStatement("select * from purchase_list where buyer_no=? and e_time BETWEEN DATE_ADD(NOW(),INTERVAL -3 MONTH ) AND NOW() ORDER BY e_time desc;");
			} else if (buyTab == 6) { // 기간별 검색 최근 6개월
				pstmt = con.prepareStatement("select * from purchase_list where buyer_no=? and e_time BETWEEN DATE_ADD(NOW(),INTERVAL -6 MONTH ) AND NOW() ORDER BY e_time desc;");
			}
			pstmt.setInt(1, seller_no);
			rs = pstmt.executeQuery();
			buyList = new ArrayList<TradeListbean>();
			while (rs.next()) {
				TradeListbean tbean = new TradeListbean();
				tbean.setSeller_no(rs.getInt("seller_no"));
				tbean.setProduct_no(rs.getInt("product_no"));
				tbean.setProduct_name(rs.getString("product_name"));
				tbean.setProduct_mainimg(rs.getString("product_mainimg"));
				tbean.setE_time(rs.getTimestamp("e_time"));
				tbean.setPrice_end(rs.getInt("price_end"));
				tbean.setBuyer_no(rs.getInt("buyer_no"));
				buyList.add(tbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return buyList;
	}// getBuyList끝
}