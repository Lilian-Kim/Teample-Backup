package Product.Controller;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
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

public class ProductTenderCompleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(); // 현재 접속한 클라이언트의 세션값을 가져온다.
		String id = (String) session.getAttribute("id"); // 로그인 상태이기 때문에 id값을 가져옴
		Memberbean mbean = (Memberbean) session.getAttribute("mbean"); // 로그인한 멤버의 정보가 여기 들어있음!
		Productbean temppbean = (Productbean) session.getAttribute("pbean"); // 판매상품의 정보가 여기있음! 판매자넘버를위해 사용
		TenderDAO tdao = new TenderDAO(); // 상품 정보를 가져오기 위한 dao객체 생성
		ProductDAO pdao = new ProductDAO();
		Tenderbean tbean = new Tenderbean();
		Productbean pbean = pdao.getProductDetail(temppbean.getProduct_no());
		
		int product_no = Integer.parseInt(request.getParameter("product_no"));
		int tender_price = Integer.parseInt(request.getParameter("ctrlPrice")); // 입찰하는 가격
		int count = Integer.parseInt(request.getParameter("ctrlQty"));
		if (id == null) { // 만약 로그인 상태가 아니라면 (비정상적인 접근)
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인후 이용가능 합니다.');");
			out.println("location.href='./MemberLogin.me'");
			out.println("</script>");
			out.close();
			return null; // 리턴
		} else { // 로그인 상태라면
			if(pbean.getE_time().getTime() < System.currentTimeMillis()) { // 낙찰이 종료됏다면...
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('아쉽지만 시간이 종료됐슈......');");
				out.println("opener.location.reload();");
				out.println("window.close();");
				out.println("</script>");
				out.close();
				return null; // 리턴
			}
			if(tender_price < pbean.getPrice_end() + 100) { // 입찰가가 현재입찰가의+100 보다 작을때 (비정상적 접근)
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('현재 입찰가보다 낮은 입찰금액 입니다.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				return null; // 리턴
			}
			if(tender_price > mbean.getMoney()) { // 입찰가가 현재 보유한 머니보다 클때
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('보유머니가 부족합니다 머니를 충전한후 다시 시도 부탁드립니다.');");
				out.println("opener.parent.location.href='./MemberMyMoney.me'");
				out.println("window.close();");
				out.println("</script>");
				out.close();
				return null; // 리턴
			}
			if(mbean.getSeller_no() == pbean.getSeller_no()) { // 낙찰을 시도하는사람이 판매자 자신이라면?
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('얌마!! 넌 판매자잔아!!!!!!죽을래');");
				out.println("opener.location.reload();");
				out.println("window.close();");
				out.println("</script>");
				out.close();
				return null; // 리턴
			}
			LocalDateTime t_time = LocalDateTime.now();
			boolean ck = tdao.checkTender(pbean.getProduct_no(), mbean.getSeller_no()); // 현재 입찰하고자 하는 상품에 내가 입찰상태가 낙찰중이라면?
			if(ck) { // 
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('낙찰중 입니다.');");
				out.println("opener.location.reload();");
				out.println("window.close();");
				out.println("</script>");
				out.close();
				return null; // 리턴
			}
			tbean.setProduct_no(product_no);
			tbean.setProduct_name(pbean.getProduct_name());
			tbean.setProduct_mainimg(pbean.getProduct_mainimg());
			tbean.setSeller_no(pbean.getSeller_no());
			tbean.setBuyer_no(mbean.getSeller_no());
			tbean.setBuyer_id(mbean.getId());
			tbean.setTender_time(Timestamp.valueOf(t_time));
			tbean.setEnd_time(pbean.getE_time());
			tbean.setTender_price(tender_price);
			tbean.setCount(count);
			tbean.setState(1);
						
			tdao.insertTender(tbean); // 판매자의 판매상품 리스트를 담는다.
			tdao.updateTenderState(pbean.getProduct_no(), tender_price); // 입찰하는 상품의 나머지 상태를 0 으로 (낙찰불가) 상태로 변경
			pdao.updatePrice_end(pbean.getProduct_no(), tender_price); // 상품정보의 입찰가격부분을 갱신시켜준다
			
			MemberDAO mdao = new MemberDAO(); // 현수
			mdao.setDeduction(mbean.getMoney(), tender_price, mbean.getSeller_no()); // 차감대기금액으로 넘김 - 현수
			List<Tenderbean> tenderlist = tdao.getProductTenderList(product_no); // 현수
			if(tenderlist.size()>1){
				mdao.setRefund(tenderlist.get(1).getBuyer_no(), tenderlist.get(1).getTender_price()); // 차감대기금액 환불 - 현수
			}
			
			session.setAttribute("tbean", tbean);
			session.setAttribute("pbean", pbean);
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./ProductTenderCompleteView.pro");
		return forward;
	}
}
