package Product.TableModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Engine.Mysql;

public class TenderDAO {

	public void insertTender(Tenderbean tbean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			con = Mysql.getConnection();
			sql = "insert into tender_list (product_no,product_name,product_mainimg,seller_no,buyer_no,buyer_id,tender_time,end_time,tender_price,count,state) values (?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tbean.getProduct_no());
			pstmt.setString(2, tbean.getProduct_name());
			pstmt.setString(3, tbean.getProduct_mainimg());
			pstmt.setInt(4, tbean.getSeller_no());
			pstmt.setInt(5, tbean.getBuyer_no());
			pstmt.setString(6, tbean.getBuyer_id());
			pstmt.setTimestamp(7, tbean.getTender_time());
			pstmt.setTimestamp(8, tbean.getEnd_time());
			pstmt.setInt(9, tbean.getTender_price());
			pstmt.setInt(10, tbean.getCount());
			pstmt.setInt(11, tbean.getState());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
	}

	public List<Tenderbean> getTenderList(int buyer_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Tenderbean> tenderList = null;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("select * from tender_list where buyer_no=?");
			pstmt.setInt(1, buyer_no);
			rs = pstmt.executeQuery();
			tenderList = new ArrayList<Tenderbean>();
			while (rs.next()) {
				Tenderbean tbean = new Tenderbean();
				tbean.setProduct_no(rs.getInt("product_no"));
				tbean.setProduct_name(rs.getString("product_name"));
				tbean.setProduct_mainimg(rs.getString("product_mainimg"));
				tbean.setSeller_no(rs.getInt("seller_no"));
				tbean.setBuyer_no(rs.getInt("buyer_no"));
				tbean.setBuyer_id(rs.getString("buyer_id"));
				tbean.setTender_time(rs.getTimestamp("tender_time"));
				tbean.setEnd_time(rs.getTimestamp("end_time"));
				tbean.setTender_price(rs.getInt("tender_price"));
				tbean.setCount(rs.getInt("count"));
				tbean.setState(rs.getInt("state"));
				tenderList.add(tbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return tenderList;
	}

	public List<Tenderbean> getTenderMypageList(int buyer_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Tenderbean> tenderList = null;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("SELECT a.*, b.tender_price2 "
					+ "FROM tender_list a, (SELECT product_no, buyer_no, MAX(tender_price) tender_price2 FROM tender_list GROUP BY product_no, buyer_no) b where 1=1 "
					+ "AND a.product_no = b.product_no AND a.buyer_no = b.buyer_no AND a.tender_price = b.tender_price2 AND a.buyer_no = ?;");
			pstmt.setInt(1, buyer_no);
			rs = pstmt.executeQuery();
			tenderList = new ArrayList<Tenderbean>();
			while (rs.next()) {
				Tenderbean tbean = new Tenderbean();
				tbean.setProduct_no(rs.getInt("product_no"));
				tbean.setProduct_name(rs.getString("product_name"));
				tbean.setProduct_mainimg(rs.getString("product_mainimg"));
				tbean.setSeller_no(rs.getInt("seller_no"));
				tbean.setBuyer_no(rs.getInt("buyer_no"));
				tbean.setBuyer_id(rs.getString("buyer_id"));
				tbean.setTender_time(rs.getTimestamp("tender_time"));
				tbean.setEnd_time(rs.getTimestamp("end_time"));
				tbean.setTender_price(rs.getInt("tender_price"));
				tbean.setCount(rs.getInt("count"));
				tbean.setState(rs.getInt("state"));
				tenderList.add(tbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return tenderList;
	}

	public List<Tenderbean> getProductTenderList(int product_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Tenderbean> tenderList = null;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("select * from tender_list where product_no=? order by tender_price desc");
			pstmt.setInt(1, product_no);
			rs = pstmt.executeQuery();
			tenderList = new ArrayList<Tenderbean>();
			while (rs.next()) {
				Tenderbean tbean = new Tenderbean();
				tbean.setProduct_no(rs.getInt("product_no"));
				tbean.setProduct_name(rs.getString("product_name"));
				tbean.setProduct_mainimg(rs.getString("product_mainimg"));
				tbean.setSeller_no(rs.getInt("seller_no"));
				tbean.setBuyer_no(rs.getInt("buyer_no"));
				tbean.setBuyer_id(rs.getString("buyer_id"));
				tbean.setTender_time(rs.getTimestamp("tender_time"));
				tbean.setEnd_time(rs.getTimestamp("end_time"));
				tbean.setTender_price(rs.getInt("tender_price"));
				tbean.setCount(rs.getInt("count"));
				tbean.setState(rs.getInt("state"));
				tenderList.add(tbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return tenderList;
	}

	/**
	 * 등록된 상품번호중 가장높은 입찰가격을 가져온다.
	 * 
	 * @param product_no
	 * @return
	 */
	public int getTenderMaxPrice(int product_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int maxPrice = 0;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("select MAX(tender_price) from tender_list where product_no=?");
			pstmt.setInt(1, product_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				maxPrice = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return maxPrice;
	}

	/**
	 * 입찰시 해당 상품번호에 해당하는 나머지 상품들을 입찰한 가격과 비교 (제일 높은가격보다 낮은 입찰자들의 상태를 0으로)
	 * 
	 * @param product_no
	 * @param tender_price
	 */
	public void updateTenderState(int product_no, int tender_price) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("update tender_list set state=0 where product_no=? and tender_price < ?");
			pstmt.setInt(1, product_no);
			pstmt.setInt(2, tender_price);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
	}

	public void setStateCount(int product_no, int state) { // 진행 상황에 따른 스테이트 업카운트
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int prestate = state - 1;

		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("update tender_list set state=? where product_no=? and state=?");
			pstmt.setInt(1, state);
			pstmt.setInt(2, product_no);
			pstmt.setInt(3, prestate);
			pstmt.executeUpdate();
			pstmt = con.prepareStatement("update product set state=? where product_no=?");
			pstmt.setInt(1, state);
			pstmt.setInt(2, product_no);
			pstmt.executeUpdate();

			if (state == 4) { // 모든 경매 과정이 완료되면 purchase_list에 값 넘겨줌
				pstmt = con.prepareStatement("select * from product where product_no=?");
				pstmt.setInt(1, product_no);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					Productbean pbean = new Productbean();
					pbean.setSeller_no(rs.getInt("seller_no"));
					pbean.setProduct_no(rs.getInt("product_no"));
					pbean.setProduct_name(rs.getString("product_name"));
					pbean.setProduct_mainimg(rs.getString("product_mainimg"));
					pbean.setE_time(rs.getTimestamp("e_time"));
					pbean.setPrice_end(rs.getInt("price_end"));
					pbean.setEnd_buyer_no(rs.getInt("end_buyer_no"));

					pstmt = con.prepareStatement("insert into purchase_list (seller_no,product_no,product_name,product_mainimg,e_time,price_end,buyer_no) values (?,?,?,?,?,?,?)");
					pstmt.setInt(1, pbean.getSeller_no());
					pstmt.setInt(2, pbean.getProduct_no());
					pstmt.setString(3, pbean.getProduct_name());
					pstmt.setString(4, pbean.getProduct_mainimg());
					pstmt.setTimestamp(5, pbean.getE_time());
					pstmt.setInt(6, pbean.getPrice_end());
					pstmt.setInt(7, pbean.getEnd_buyer_no());
					pstmt.executeUpdate();

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}

	}

	public boolean checkTender(int product_no, int seller_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean tenderList = false;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("select * from tender_list where product_no=? and buyer_no=? order by tender_price desc");
			pstmt.setInt(1, product_no);
			pstmt.setInt(2, seller_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int state = rs.getInt("state");
				if(state == 1) {
					tenderList = true;
				} else {
					tenderList = false;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return tenderList;
	}
	
	
	public int cancelTender(int product_no, int tender_price) { //입찰 취소 후 차상위 입찰자에게 낙찰권 넘겨줌
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int secondprice = 0;
		try {
			con = Mysql.getConnection();
			
			pstmt = con.prepareStatement("delete from tender_list where product_no=? and tender_price=?");
			pstmt.setInt(1, product_no);
			pstmt.setInt(2, tender_price);
			pstmt.executeUpdate();
			
			pstmt = con.prepareStatement("select * from tender_list where product_no=? order by tender_price desc");
			pstmt.setInt(1, product_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				secondprice = rs.getInt("tender_price");
				pstmt = con.prepareStatement("update tender_list set state=1 where buyer_no=? and tender_price=?");
				pstmt.setInt(1, rs.getInt("buyer_no"));
				pstmt.setInt(2, secondprice);
				pstmt.executeUpdate();
			}		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt);
		}
		return secondprice;
	}

	
	
	public void tradecancel(int product_no, int buyer_no) { //낙찰 후 구매 취소
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = Mysql.getConnection();
			
			pstmt = con.prepareStatement("update tender_list set state=5 where product_no=? and buyer_no=?");
			pstmt.setInt(1, product_no);
			pstmt.setInt(2, buyer_no);
			pstmt.executeUpdate();
			
			pstmt = con.prepareStatement("update product set state=5, end_buyer_no=0 where product_no=? and end_buyer_no=?");
			pstmt.setInt(1, product_no);
			pstmt.setInt(2, buyer_no);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt);
		}
		
	}

	
}