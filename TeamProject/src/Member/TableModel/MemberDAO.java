package Member.TableModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;

import Engine.Mysql;

public class MemberDAO {

	/**
	 * 회원가입시 정보 DB에 Insert
	 * 
	 * @param mbean
	 * @return
	 */
	public boolean insertMember(Memberbean mbean) { // 회원가입
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Mysql.getConnection();
			String sql = "insert into member (seller_no,id,pw,name,phone,email,zipcode,addr,detailaddr) values (?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mbean.getSeller_no());
			pstmt.setString(2, mbean.getId());
			pstmt.setString(3, mbean.getPw());
			pstmt.setString(4, mbean.getName());
			pstmt.setString(5, mbean.getPhone());
			pstmt.setString(6, mbean.getEmail());
			pstmt.setInt(7, mbean.getZipcode());
			pstmt.setString(8, mbean.getAddr());
			pstmt.setString(9, mbean.getDetailaddr());
			// pstmt.setInt(11, mbean.getInfomail());
			if (pstmt.executeUpdate() == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt);
		}
		return false;
	}// 회원가입 끝

	/**
	 * 회원 id와 pass가 일치하는지 확인
	 * 
	 * @param id
	 * @param pass
	 * @return 0: 일치, 1:불일치, 2:해당 id가 존재하지 않음
	 */
	public int userPassCheck(String id, String pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = 2;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("select pw from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (pass.equals(rs.getString("pw"))) {
					check = 0;
				} else {
					check = 1;
				}
			} else {
				check = 2;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return check;
	}

	/**
	 * 유저 정보를 받아오는 메소드
	 * 
	 * @param id
	 * @return
	 */
	public Memberbean userInfo(String id) {
		Memberbean bean = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 해당 id가 존재함
				bean = new Memberbean();
				bean.setSeller_no(rs.getInt("seller_no"));
				bean.setId(rs.getString("id"));
				bean.setPw(rs.getString("pw"));
				bean.setName(rs.getString("name"));
				bean.setPhone(rs.getString("phone"));
				bean.setEmail(rs.getString("email"));
				bean.setZipcode(rs.getInt("zipcode"));
				bean.setAddr(rs.getString("addr"));
				bean.setDetailaddr(rs.getString("detailaddr"));
				bean.setMoney(rs.getInt("money"));
				bean.setDeduction_money(rs.getInt("deduction_money"));
				bean.setGrade(rs.getInt("grade"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	public int getMoney(String id) { // 현재 보유중인 금액 표시
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("select money from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("money");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		} // finally
		return result;
	} // getMoney()

	public int getdeductionMoney(String id) { // 현재 차감대기중인 금액 표시
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("select money from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("deduction_money");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		} // finally
		return result;
	} //
	
	public boolean chargeMoney(String id, int total) { // 금액 충전
		boolean result = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("update member set money=? where id=?");
			pstmt.setInt(1, total);
			pstmt.setString(2, id);
			int pandan = pstmt.executeUpdate();
			if (pandan == 1)
				result = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt);
		} // finally
		return result;
	} // chargeMoney()

	public boolean updateMember(Memberbean mb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		String sql = "update member set pw=?, name=?, phone=?, email=?, zipcode=?, addr=?, detailaddr=? where id=?";
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getPw());
			pstmt.setString(2, mb.getName());
			pstmt.setString(3, mb.getPhone());
			pstmt.setString(4, mb.getEmail());
			pstmt.setInt(5, mb.getZipcode());
			pstmt.setString(6, mb.getAddr());
			pstmt.setString(7, mb.getDetailaddr());
			pstmt.setString(8, mb.getId());
			int pandan = pstmt.executeUpdate();
			if (pandan == 1) {
				result = true;
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt);
		}
		return result;
	}// updateMember()

	public void deleteMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("delete from member where id=?");
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt);
		}
	}// deleteMember()

	// 구매자 아이디 가져오는 메소드
	public Memberbean userInfo(int buyer) {
		Memberbean bean = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = Mysql.getConnection();
			pstmt = con.prepareStatement("select * from member where seller_no=?");
			pstmt.setInt(1, buyer);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 해당 id가 존재함
				bean = new Memberbean();
				bean.setSeller_no(rs.getInt("seller_no"));
				bean.setId(rs.getString("id"));
				bean.setPw(rs.getString("pw"));
				bean.setName(rs.getString("name"));
				bean.setPhone(rs.getString("phone"));
				bean.setEmail(rs.getString("email"));
				bean.setZipcode(rs.getInt("zipcode"));
				bean.setAddr(rs.getString("addr"));
				bean.setDetailaddr(rs.getString("detailaddr"));
				bean.setMoney(rs.getInt("money"));
				bean.setGrade(rs.getInt("grade"));
				bean.setBuy_complete(rs.getInt("buy_complete"));
				bean.setBuy_cancel(rs.getInt("buy_cancel"));
				bean.setSell_complete(rs.getInt("sell_complete"));
				bean.setSell_cancel(rs.getInt("sell_cancel"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	public void setTradeCount(int seller_no, int sellplus, int buyer_no, int buyplus, int state) { //진행 상황에 따른 상벌점 카운트

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = Mysql.getConnection();
			if (state == 1) { //입찰자가 입찰취소
				sql = "update member set buy_cancel=? where seller_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, buyplus);
				pstmt.setInt(2, buyer_no);
				pstmt.executeUpdate();
			} else if (state == 2) { //구매자가 구매취소
				sql = "update member set buy_cancel=? where seller_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, buyplus);
				pstmt.setInt(2, buyer_no);
				pstmt.executeUpdate();
			//스테이트 1과 2가 나중에도 들어가는 값만 다르고 기능 차이가 없으면 통합하자...
			} else if (state == 3) { //구매자가 구매확정 누름
				sql = "update member set sell_complete=? where seller_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, sellplus);
				pstmt.setInt(2, seller_no);
				pstmt.executeUpdate();
				sql = "update member set buy_complete=? where seller_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, buyplus);
				pstmt.setInt(2, buyer_no);
				pstmt.executeUpdate();
			} else if (state == 4) { //판매자가 경매취소
				sql = "update member set sell_cancel=? where seller_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, sellplus);
				pstmt.setInt(2, seller_no);
				pstmt.executeUpdate();
			} else if (state == 5) { //판매자가 판매취소
				sql = "update member set sell_cancel=? where seller_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, sellplus);
				pstmt.setInt(2, seller_no);
				pstmt.executeUpdate();
				//스테이트 4와 5가 나중에도 들어가는 값만 다르고 기능 차이가 없으면 통합하자...
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt);
		}
	}//

	public void checkUpGrade(int seller_no) { // 등급 체크해보고 기준 충족하면 업그레이드
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = Mysql.getConnection();
			
			pstmt = con.prepareStatement("select sell_complete from member where seller_no=?");
			pstmt.setInt(1, seller_no);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				if(rs.getInt("sell_complete")==1){
					pstmt = con.prepareStatement("update member set grade=1 where seller_no=?");
					pstmt.setInt(1, seller_no);
					pstmt.executeUpdate();
				}else if(rs.getInt("sell_complete")==5){
					pstmt = con.prepareStatement("update member set grade=2 where seller_no=?");
					pstmt.setInt(1, seller_no);
					pstmt.executeUpdate();
				}else if(rs.getInt("sell_complete")==20){
					pstmt = con.prepareStatement("update member set grade=3 where seller_no=?");
					pstmt.setInt(1, seller_no);
					pstmt.executeUpdate();
				}else if(rs.getInt("sell_complete")==50){
					pstmt = con.prepareStatement("update member set grade=4 where seller_no=?");
					pstmt.setInt(1, seller_no);
					pstmt.executeUpdate();
				}else if(rs.getInt("sell_complete")==100){
					pstmt = con.prepareStatement("update member set grade=5 where seller_no=?");
					pstmt.setInt(1, seller_no);
					pstmt.executeUpdate();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		} // finally
	}
	
	
	public String checkCreditRate(int seller_no) { // 구매신용도
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String creditrate = "";
		
		try {
			con = Mysql.getConnection();
			
			pstmt = con.prepareStatement("select * from member where seller_no=?");
			pstmt.setInt(1, seller_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
			int complete = rs.getInt("buy_complete");			
			int cancel = rs.getInt("buy_cancel");			
			double rate = (double)complete/((double)(complete+cancel));
			DecimalFormat df = new DecimalFormat("0.0%");
			creditrate = df.format(rate);
			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		} // finally
		return creditrate;
	}

	
	
	public void setDeduction(int mymoney, int tender_price, int seller_no) { //차감대기금액
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int total = mymoney-tender_price;
		
		try {
			con = Mysql.getConnection();
			
			pstmt = con.prepareStatement("update member set money=?, deduction_money=? where seller_no=?");
			pstmt.setInt(1, total);
			pstmt.setInt(2, tender_price);
			pstmt.setInt(3, seller_no);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt);
		} // finally
		
	}

	
	
	public void setRefund(int buyer_no, int tender_price) { //차감대기금액 환불
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = Mysql.getConnection();
			
			pstmt = con.prepareStatement("select * from member where seller_no=?");
			pstmt.setInt(1, buyer_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				int money = rs.getInt("money");
				int demoney = rs.getInt("deduction_money");
				pstmt = con.prepareStatement("update member set money=?, deduction_money=? where seller_no=?");
				pstmt.setInt(1, money+tender_price);
				pstmt.setInt(2, demoney-tender_price);
				pstmt.setInt(3, buyer_no);
				pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt);
		} // finally
				
	}
	
	
	
	
	public void sendMoney(int seller_no, int buyer_no, int tender_price) { // 구매확정시 판매자에게 송금
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = Mysql.getConnection();
			
			pstmt = con.prepareStatement("select * from member where seller_no=?");
			pstmt.setInt(1, buyer_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
//				int money = rs.getInt("money");
				int demoney = rs.getInt("deduction_money");
				pstmt = con.prepareStatement("update member set deduction_money=? where seller_no=?");
				pstmt.setInt(1, demoney-tender_price);
				pstmt.setInt(2, buyer_no);
				pstmt.executeUpdate();
			}
			
			pstmt = con.prepareStatement("select * from member where seller_no=?");
			pstmt.setInt(1, seller_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				int money = rs.getInt("money");
				pstmt = con.prepareStatement("update member set money=? where seller_no=?");
				pstmt.setInt(1, money+tender_price);
				pstmt.setInt(2, seller_no);
				pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt);
		} // finally
				
	}

}//