package Product.TableModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Engine.Mysql;

public class ProductDAO {

	public boolean insertProduct(Productbean pbean) { // 상품등록
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Mysql.getConnection();
			String sql = "insert into product (product_no,category,product_name,price_action,price_promptly,price_end,s_time,e_time,end_option,product_contend,product_mainimg,commission,state,seller_no,name,maincate,subcate, search_keyword) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pbean.getProduct_no());
			pstmt.setInt(2, pbean.getCategory());
			pstmt.setString(3, pbean.getProduct_name());
			pstmt.setInt(4, pbean.getPrice_action());
			pstmt.setInt(5, pbean.getPrice_promptly());
			pstmt.setInt(6, pbean.getPrice_end());
			pstmt.setTimestamp(7, pbean.getS_time());
			pstmt.setTimestamp(8, pbean.getE_time());
			pstmt.setInt(9, pbean.getEnd_option());
			pstmt.setString(10, pbean.getProduct_contend());
			pstmt.setString(11, pbean.getProduct_mainimg());
			pstmt.setInt(12, pbean.getCommission());
			pstmt.setInt(13, pbean.getState());
			pstmt.setInt(14, pbean.getSeller_no());
			pstmt.setString(15, pbean.getName()); // 현수
			pstmt.setInt(16, pbean.getMaincate()); // 현수
			pstmt.setInt(17, pbean.getSubcate()); // 현수
			pstmt.setString(18, pbean.getSearch_keyword()); //검색키워드 -장군
			if (pstmt.executeUpdate() == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt);
		}
		return false;
	}

	/**
	 * 모든 상품 리스트 정보를 리스트에 저장
	 * 
	 * @return
	 */
	public static List<Productbean> getProductList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Productbean> boardList = new ArrayList<Productbean>();
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("select * from product");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Productbean pbean = new Productbean();
				pbean.setState(rs.getInt("state"));
				if (rs.getInt("state") == 4)
					continue;
				pbean.setProduct_no(rs.getInt("product_no"));
				pbean.setCategory(rs.getInt("category"));
				pbean.setProduct_name(rs.getString("product_name"));
				pbean.setPrice_action(rs.getInt("price_action"));
				pbean.setPrice_promptly(rs.getInt("price_promptly"));
				pbean.setPrice_end(rs.getInt("price_end"));
				pbean.setS_time(rs.getTimestamp("s_time"));
				pbean.setE_time(rs.getTimestamp("e_time"));
				pbean.setEnd_option(rs.getInt("end_option"));
				pbean.setProduct_mainimg(rs.getString("product_mainimg"));
				pbean.setProduct_contend(rs.getString("product_contend"));
				pbean.setCommission(rs.getInt("commission"));
				pbean.setSeller_no(rs.getInt("seller_no"));
				pbean.setSearch_keyword(rs.getString("search_keyword"));// 검색키워드 -장군
				pbean.setEnd_buyer_no(rs.getInt("end_buyer_no"));
				if (pbean.getE_time().getTime() < System.currentTimeMillis())
					continue;
				boardList.add(pbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return boardList;
	}

	/**
	 * 판매완료된 상품정보를 purchase_list 추가
	 * 
	 * @param pbean
	 */
	public static void addPurchaseList(Productbean pbean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Mysql.getConnection();
			String sql = "insert into purchase_list (seller_no,product_no,product_name,product_mainimg,e_time,price_end,buyer_no) values (?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pbean.getSeller_no());
			pstmt.setInt(2, pbean.getProduct_no());
			pstmt.setString(3, pbean.getProduct_name());
			pstmt.setString(4, pbean.getProduct_mainimg());
			pstmt.setTimestamp(5, pbean.getE_time());
			pstmt.setInt(6, pbean.getPrice_end());
			pstmt.setInt(7, pbean.getEnd_buyer_no());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt);
		}
	}

	/**
	 * 판매중인 상품중 종료된상품 판매리스트에서 삭제
	 * 
	 * @param product_no
	 */
	public static void endTimeProductDel(int product_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("delete from product where product_no=?");
			pstmt.setInt(1, product_no);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt);
		}
	}

	/**
	 * 회원의 개인 판매중인 상풉 판매 리스트
	 * 
	 * @return
	 */
	public List<Productbean> getSellerList(int seller_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Productbean> boardList = null;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("select * from product where seller_no=?");
			pstmt.setInt(1, seller_no);
			rs = pstmt.executeQuery();
			boardList = new ArrayList<Productbean>();
			while (rs.next()) {
				Productbean pbean = new Productbean();
				pbean.setState(rs.getInt("state"));
				if(rs.getInt("state")==4)continue;
				pbean.setProduct_no(rs.getInt("product_no"));
				pbean.setCategory(rs.getInt("category"));
				pbean.setProduct_name(rs.getString("product_name"));
				pbean.setPrice_action(rs.getInt("price_action"));
				pbean.setPrice_promptly(rs.getInt("price_promptly"));
				pbean.setPrice_end(rs.getInt("price_end"));
				pbean.setS_time(rs.getTimestamp("s_time"));
				pbean.setE_time(rs.getTimestamp("e_time"));
				pbean.setEnd_option(rs.getInt("end_option"));
				pbean.setProduct_mainimg(rs.getString("product_mainimg"));
				pbean.setProduct_contend(rs.getString("product_contend"));
				pbean.setCommission(rs.getInt("commission"));
				pbean.setSeller_no(rs.getInt("seller_no"));
				pbean.setSearch_keyword(rs.getString("search_keyword"));//검색키워드 -장군
				pbean.setEnd_buyer_no(rs.getInt("end_buyer_no"));
				boardList.add(pbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return boardList;
	}

	/**
	 * 판매중인 상품 클릭시 판매상품 상세정보
	 * 
	 * @return
	 */
	public Productbean getProductDetail(int product_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Productbean pbean = null;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("select * from product where product_no=?");
			pstmt.setInt(1, product_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				pbean = new Productbean();
				pbean.setProduct_no(rs.getInt("product_no"));
				pbean.setCategory(rs.getInt("category"));
				pbean.setProduct_name(rs.getString("product_name"));
				pbean.setPrice_action(rs.getInt("price_action"));
				pbean.setPrice_promptly(rs.getInt("price_promptly"));
				pbean.setPrice_end(rs.getInt("price_end"));
				pbean.setS_time(rs.getTimestamp("s_time"));
				pbean.setE_time(rs.getTimestamp("e_time"));
				pbean.setEnd_option(rs.getInt("end_option"));
				pbean.setProduct_mainimg(rs.getString("product_mainimg"));
				pbean.setProduct_contend(rs.getString("product_contend"));
				pbean.setCommission(rs.getInt("commission"));
				pbean.setState(rs.getInt("state"));
				pbean.setSeller_no(rs.getInt("seller_no"));
				pbean.setSearch_keyword(rs.getString("search_keyword"));//검색키워드 -장군
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return pbean;
	}

	public List<Productbean> getCategoryList(int category, int maincate, int subcate) { // 카테고리별 등록상품 뿌리기
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Productbean> boardList = null;
		String sql = "";
		try {
			con = Mysql.getConnection();
			if (category != 0) { // 소분류 클릭했을때
				sql = "select * from product where category=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, category);
			} else {
				if (subcate == 0) { // 대분류 클릭했을때
					sql = "select * from product where maincate=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, maincate);
				} else { // 중분류 클릭했을때
					sql = "select * from product where maincate=? and subcate=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, maincate);
					pstmt.setInt(2, subcate);
				}
			}
			rs = pstmt.executeQuery();
			boardList = new ArrayList<Productbean>();
			while (rs.next()) {
				Productbean pbean = new Productbean();
				pbean.setState(rs.getInt("state"));
				if(rs.getInt("state")==4)continue;
				pbean.setProduct_no(rs.getInt("product_no"));
				pbean.setCategory(rs.getInt("category"));
				pbean.setProduct_name(rs.getString("product_name"));
				pbean.setPrice_action(rs.getInt("price_action"));
				pbean.setPrice_promptly(rs.getInt("price_promptly"));
				pbean.setPrice_end(rs.getInt("price_end"));
				pbean.setS_time(rs.getTimestamp("s_time"));
				pbean.setE_time(rs.getTimestamp("e_time"));
				pbean.setEnd_option(rs.getInt("end_option"));
				pbean.setProduct_contend(rs.getString("product_contend"));
				pbean.setCommission(rs.getInt("commission"));
				pbean.setSeller_no(rs.getInt("seller_no"));
				pbean.setName(rs.getString("name"));
				pbean.setMaincate(rs.getInt("maincate"));
				pbean.setSubcate(rs.getInt("subcate"));
				pbean.setProduct_mainimg(rs.getString("product_mainimg"));
				pbean.setGrade(rs.getInt("grade"));
				pbean.setSearch_keyword(rs.getString("search_keyword")); //검색키워드 -장군
				boardList.add(pbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return boardList;
	}
	
	//헤더 검색어 받아서 리스트 보여주기. -장군
	public List<Productbean> getSearchList(String search) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Productbean> boardList = new ArrayList<Productbean>();
		String sql = "";
		try {
			con = Mysql.getConnection();
			sql = "select * from product where search_keyword like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
			    Productbean pbean = new Productbean();
				pbean.setProduct_no(rs.getInt("product_no"));
				pbean.setCategory(rs.getInt("category"));
				pbean.setProduct_name(rs.getString("product_name"));
				pbean.setPrice_action(rs.getInt("price_action"));
				pbean.setPrice_promptly(rs.getInt("price_promptly"));
				pbean.setPrice_end(rs.getInt("price_end"));
				pbean.setS_time(rs.getTimestamp("s_time"));
				pbean.setE_time(rs.getTimestamp("e_time"));
				pbean.setEnd_option(rs.getInt("end_option"));
				pbean.setProduct_contend(rs.getString("product_contend"));
				pbean.setCommission(rs.getInt("commission"));
				pbean.setState(rs.getInt("state"));
				pbean.setSeller_no(rs.getInt("seller_no"));
				pbean.setName(rs.getString("name"));
				pbean.setMaincate(rs.getInt("maincate"));
				pbean.setSubcate(rs.getInt("subcate"));
				pbean.setProduct_mainimg(rs.getString("product_mainimg"));
				pbean.setGrade(rs.getInt("grade"));
				pbean.setSearch_keyword(rs.getString("search_keyword")); //검색키워드 -장군
				boardList.add(pbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return boardList;
	}

	public void updatePrice_end(int product_no, int tender_price) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("update product set price_end=? where product_no=?");
			pstmt.setInt(1, tender_price);
			pstmt.setInt(2, product_no);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt);
		}
	}
	
	public void setEndBuyerNo(int product_no){ // 최종낙찰자 end_buyer_no에 입력
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("select buyer_no from tender_list where product_no=? and state=1");
			pstmt.setInt(1, product_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				pstmt = con.prepareStatement("update product set end_buyer_no=? where product_no=?");
				pstmt.setInt(1, rs.getInt("buyer_no"));
				pstmt.setInt(2, product_no);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
	}
	
}