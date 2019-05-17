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

public class ProductSellListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession(); // 현재 접속한 클라이언트의 세션값을 가져온다.
		String id = (String) session.getAttribute("id"); // 로그인 상태이기 때문에 id값을 가져옴
		if(id == null) { // 만약 로그인 상태가 아니라면 (비정상적인 접근) 
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
			ProductDAO pdao = new ProductDAO(); // 상품 정보를 가져오기 위한 dao객체 생성
			List<Productbean> plist = pdao.getSellerList(mbean.getSeller_no()); // 판매자의 판매상품 리스트를 담는다.
			session.setAttribute("mbean", mbean); // 회원정보 세션 영역에 저장
			session.setAttribute("plist", plist); // 상품리스트 세션 영역에 저장
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./ProductSellList.pro");
		return forward;
	}
}