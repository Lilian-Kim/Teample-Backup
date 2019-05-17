package Product.Controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Function.Action;
import Function.ActionForward;
import Member.TableModel.MemberDAO;
import Member.TableModel.Memberbean;
import Product.TableModel.ProductDAO;
import Product.TableModel.Productbean;
import Product.TableModel.TenderDAO;
import Product.TableModel.Tenderbean;

public class ProductTenderStateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("프로덕트텐더스테이트액션 진입");
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(); // 현재 접속한 클라이언트의 세션값을 가져온다.
		String id = (String) session.getAttribute("id"); // 로그인 상태이기 때문에 id값을 가져옴
		
		int state = Integer.parseInt(request.getParameter("state"));
		int stateb = 0;
		int product_no;
		int tender_price;
		int seller_no;
		int buyer_no;
		int sellplus = 0;
		int buyplus = 0;
//		int result = 0;
		
		if(request.getParameter("tender_price")==null){
			tender_price = 0;
		}else{
			tender_price = Integer.parseInt(request.getParameter("tender_price"));
		}
		
		if(request.getParameter("product_no")==null){
			product_no = 0;
		}else{
			product_no = Integer.parseInt(request.getParameter("product_no"));
		}
		
		if(request.getParameter("seller_no")==null){
			seller_no = 0;
		}else{
			seller_no = Integer.parseInt(request.getParameter("seller_no"));
		}
		
		if(request.getParameter("buyer_no")==null){
			buyer_no = 0;
		}else{
			buyer_no = Integer.parseInt(request.getParameter("buyer_no"));
		}
		
		MemberDAO mdao = new MemberDAO();
		Memberbean mbean = new Memberbean();
		ProductDAO pdao = new ProductDAO();
		Productbean pbean = new Productbean();
		TenderDAO tdao = new TenderDAO();
		Tenderbean tbean = new Tenderbean();
		
		if(state==1){ //입찰자가 입찰 취소
			
			mbean = mdao.userInfo(buyer_no);
			buyplus = (mbean.getBuy_cancel()+1); //상벌점 설정
			mdao.setTradeCount(seller_no, sellplus, buyer_no, buyplus, state); //상벌점 갱신
			
			int secondprice = tdao.cancelTender(product_no, tender_price); // 내 입찰 취소하고 차상위 입찰자에게 낙찰권 넘겨줌
			pdao.updatePrice_end(product_no, secondprice); // 입찰가 재갱신

			mdao.setRefund(buyer_no, tender_price); // 내 차감대기금액 환불
//			mdao.setDeduction(mbean.getMoney(), tender_price, mbean.getSeller_no()); // 차상위 입찰자
			
		}else if(state==2){ //입찰자가 구매 취소
			
			mbean = mdao.userInfo(buyer_no);
			buyplus = (mbean.getBuy_cancel()+2);
			mdao.setTradeCount(seller_no, sellplus, buyer_no, buyplus, state);
			
			tdao.tradecancel(product_no, buyer_no); //거래취소
			mdao.setRefund(buyer_no, tender_price);
			
		}else if(state==3){ //입찰자가 구매확정 누름
			
			mbean = mdao.userInfo(seller_no);
			sellplus = (mbean.getSell_complete()+1);
			mbean = mdao.userInfo(buyer_no);
			buyplus = (mbean.getBuy_complete()+1);
			mdao.setTradeCount(seller_no, sellplus, buyer_no, buyplus, state);
			
			stateb = 4;
			tdao.setStateCount(product_no, stateb);
			
			mdao.sendMoney(seller_no, buyer_no, tender_price);
			
			mdao.checkUpGrade(seller_no);
			
		}else if(state==4){ //판매자가 경매 도중 취소
			
			mbean = mdao.userInfo(seller_no);
			sellplus = (mbean.getSell_cancel()+1);
			mdao.setTradeCount(seller_no, sellplus, buyer_no, buyplus, state);
			
		}else if(state==5){ //판매자가 판매 취소
			
			mbean = mdao.userInfo(seller_no);
			sellplus = (mbean.getSell_cancel()+2);
			mdao.setTradeCount(seller_no, sellplus, buyer_no, buyplus, state);
			
			tdao.tradecancel(product_no, buyer_no);
			mdao.setRefund(buyer_no, tender_price);
			
		}else if(state==6){ //판매자가 발송완료 누름
			stateb = 3;
			tdao.setStateCount(product_no, stateb);			
		}
		

		

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if(state<=3){ //일단은 마이페이지 연결해놨음
		forward.setPath("./SellCompletedAction.tra");
		}else if(state>=4){ //일단은 마이페이지 연결해놨음
		forward.setPath("./SellCompletedAction.tra");
		}
		return forward;
	}
}