package MemberBoard.TableModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Engine.Mysql;

public class MemberBoardDAO {

	public int getQnaCount(String id) { //총 문의 개수
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;
		try {
			con = Mysql.getConnection();
			if (id.equals("admin")) {
				sql = "select count(*) from member_board";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(*) from member_board where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			}
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return count;
	}

	public void writeQna(MemberBoardbean mbbean) { //문의 글 쓰기
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int num = 0;
		try {
			con = Mysql.getConnection();
			sql = "insert into member_board(id,pw,subject,content,date) values(?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mbbean.getId());
			pstmt.setString(2, mbbean.getPw());
			pstmt.setString(3, mbbean.getSubject());
			pstmt.setString(4, mbbean.getContent());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt);
		}
	}

	public List<MemberBoardbean> getQnaList(String id, int startRow, int pageSize) { //총 문의내역 가져오기
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<MemberBoardbean> boardList = new ArrayList<MemberBoardbean>();
		try {
			con = Mysql.getConnection();
			if (id.equals("admin")) {
				sql = "select * from member_board order by date desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow - 1);
				pstmt.setInt(2, pageSize);
			} else {
				sql = "select * from member_board where id like ? order by date desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, startRow - 1);
				pstmt.setInt(3, pageSize);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberBoardbean mbbean = new MemberBoardbean();
				mbbean.setNum(rs.getInt("num"));
				mbbean.setId(rs.getString("id"));
				mbbean.setPw(rs.getString("pw"));
				mbbean.setSubject(rs.getString("subject"));
				mbbean.setContent(rs.getString("content"));
				mbbean.setDate(rs.getDate("date"));
				mbbean.setQnastatus(rs.getInt("qnastatus"));
				boardList.add(mbbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return boardList;
	}
/*
	public void updateReadCount(int num) { //조회수 집계
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = Mysql.getConnection();
			sql = "update member_board set readcount=readcount+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt);
		}
	}
*/
	public MemberBoardbean getDetailViewQna(int num) { //문의 내용보기
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		MemberBoardbean mbbean = null;
		try {
			con = Mysql.getConnection();
			sql = "select * from member_board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mbbean = new MemberBoardbean();
				mbbean.setContent(rs.getString("content"));
				mbbean.setDate(rs.getDate("date"));
				mbbean.setId(rs.getString("id"));
				mbbean.setNum(rs.getInt("num"));
				mbbean.setPw(rs.getString("pw"));
				mbbean.setReadcount(rs.getInt("readcount"));
				mbbean.setSubject(rs.getString("subject"));
				mbbean.setQnastatus(rs.getInt("qnastatus"));
				mbbean.setReply(rs.getString("reply"));
				mbbean.setReadcount(rs.getInt("readcount"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return mbbean;
	}

	public int updateQna(MemberBoardbean mbbean) { //문의 수정
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int check = -1;
		try {
			con = Mysql.getConnection();
			if (mbbean.getId().equals("admin")) {
				sql = "update member_board set reply=?,qnastatus=1 where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mbbean.getReply());
				pstmt.setInt(2, mbbean.getNum());
				pstmt.executeUpdate();
				check = 2;
			} else {
				sql = "select pw from member_board where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, mbbean.getNum());
				rs = pstmt.executeQuery();
				if (rs.next()) {
					if (mbbean.getPw().equals(rs.getString("pw"))) {
						sql = "update member_board set subject=?,content=? where num=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, mbbean.getSubject());
						pstmt.setString(2, mbbean.getContent());
						pstmt.setInt(3, mbbean.getNum());
						pstmt.executeUpdate();
						check = 1;
					} else {
						check = 0;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return check;
	}

	public int deleteQna(int num, String pw) { //문의 삭제
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		int check = -1;
		try {
			con = Mysql.getConnection();
			sql = "select pw from member_board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (pw.equals(rs.getString("pw"))) {
					sql = "delete from member_board where num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					check = 1;
				} else {
					check = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Mysql.freeConnection(con, pstmt, rs);
		}
		return check;
	}
}// 클래스