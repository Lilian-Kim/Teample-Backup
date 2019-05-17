package Product.Controller;

import java.io.PrintWriter;

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

public class ProductTenderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(); // 현재 접속한 클라이언트의 세션값을 가져온다.
		String id = (String) session.getAttribute("id"); // 로그인 상태이기 때문에 id값을 가져옴
		Productbean temppbean = (Productbean) session.getAttribute("pbean"); // 바로전 세션값에 저장되어있던 상품정보를 들고온다
		ProductDAO pdao = new ProductDAO(); // 상품 정보를 가져오기 위한 dao객체 생성
		Productbean pbean = pdao.getProductDetail(temppbean.getProduct_no()); // 상품상세 정보를 가져온다
		TenderDAO tdao = new TenderDAO(); // 입찰 정보를 가져오기 위한 dao객체 생성
		MemberDAO mdao = new MemberDAO();
		Memberbean mbean = mdao.userInfo(id);
		if(id == null) { // 만약 로그인 상태가 아니라면 (비정상적인 접근) 
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인후 이용가능 합니다.);");
			out.println("location.href='./MemberLogin.me'");
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
		boolean tenderck = tdao.checkTender(pbean.getProduct_no(), mbean.getSeller_no()); // 현재 입찰하고자 하는 상품에 내가 입찰상태가 낙찰중이라면? 낙찰중 true 아니면 false
		int tenderMaxPrice = tdao.getTenderMaxPrice(pbean.getProduct_no()); // 해당상품중 가장높은 입찰가격을 가져온다
		session.setAttribute("mbean", mbean);
		session.setAttribute("pbean", pbean); // 새롭게 상품정보를 세션 영역에 저장
		session.setAttribute("tenderMaxPrice", tenderMaxPrice); // 해당상품중 가장높은 입찰가격을 세션 영역에 저장
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if (tenderck == true) {
			forward.setPath("./ProductTenderFailView.pro");
		} else {
			forward.setPath("./ProductTenderView.pro");
		}
		return forward;
	}
}