package TradeList.Controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Function.Action;
import Function.ActionForward;
import Member.TableModel.MemberDAO;
import Member.TableModel.Memberbean;
import MemberBoard.TableModel.MemberBoardDAO;
import Product.TableModel.ProductDAO;
import Product.TableModel.Productbean;
import Product.TableModel.TenderDAO;
import Product.TableModel.Tenderbean;
import TradeList.TableModel.TradeListDAO;
import TradeList.TableModel.TradeListbean;

public class SellCompletedAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession(); // 현재 접속한 클라이언트의 세션값을 가져온다.
		String id = (String) session.getAttribute("id"); // 로그인 상태이기 때문에 id값을 가져옴

		int sellTab;
		if (req.getParameter("sellTab") == null) {
			sellTab = 0;
		} else {
			sellTab = Integer.parseInt(req.getParameter("sellTab"));
		}

		if (id == null) { // 만약 로그인 상태가 아니라면 (비정상적인 접근)
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('로그인후 이용가능 합니다.);");
			out.println("location.href='./MemberLogin.me'");
			out.println("</script>");
			out.close();
			return null; // 리턴 
		} else { // 로그인 상태라면
			MemberDAO mdao = new MemberDAO(); // 회원 정보를 가져오기 위한 dao객체 생성
			Memberbean mbean = mdao.userInfo(id); // 현재 로그인한 회원의 정보를 mbean에 저장
			TradeListDAO tldao = new TradeListDAO(); // 상품 정보를 가져오기 위한 dao객체 생성
			int buyer = 0;
			MemberBoardDAO mbdao = new MemberBoardDAO(); // 1:1문의 개수를 가져오기 위한 dao - 현수
			String mantomancount = Integer.toString(mbdao.getQnaCount(id)); // 1:1문의 개수 - 현수
			TenderDAO tdao = new TenderDAO(); // 상품 정보를 가져오기 위한 dao객체 생성 - 현수
			ProductDAO pdao = new ProductDAO(); // 상품 정보를 가져오기 위한 dao객체 생성
			List<Tenderbean> tlist = tdao.getTenderList(mbean.getSeller_no()); // 현재 나의 입찰리스트들 저장 - 현수
			List<Productbean> plist = pdao.getSellerList(mbean.getSeller_no()); // 판매자의 판매상품 리스트를 담는다.
			session.setAttribute("tlist", tlist); // 상품리스트 세션 영역에 저장 - 현수
			session.setAttribute("plist", plist); // 상품리스트 세션 영역에 저장
			List<TradeListbean> slist = tldao.getSellList(mbean.getSeller_no(), sellTab); // 내 판매상품 리스트를 담는다.
			for (TradeListbean tradeListbean : slist) {
				buyer = tradeListbean.getBuyer_no(); // 최종구매자의 정보(회원번호) 담기.
			}
			Memberbean buyerbean = null;
			String buyerId = "";
			String buyerPhone = "";
			String buyerEmail = "";
			String buyerName = "";
			if (buyer != 0) {
				buyerbean = mdao.userInfo(buyer);
				buyerId = buyerbean.getId();
				buyerName = buyerbean.getName();
				buyerPhone = buyerbean.getPhone();
				buyerEmail = buyerbean.getEmail();
			}
			session.setAttribute("mbean", mbean); // 회원정보 세션 영역에 저장
			session.setAttribute("slist", slist); // 상품리스트 세션 영역에 저장
			session.setAttribute("buyerId", buyerId);// 구매자 정보 세션에 저장
			session.setAttribute("buyerName", buyerName);
			session.setAttribute("buyerPhone", buyerPhone); // 연락처
			session.setAttribute("buyerEmail", buyerEmail); // 이메일
			session.setAttribute("sellTab", sellTab);// 탭변수 세션에 저장.
			session.setAttribute("mantomancount", mantomancount); // 1:1문의 개수 세션에 저장 - 현수
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./TradeCompleted.tra");
		return forward;
	}
}