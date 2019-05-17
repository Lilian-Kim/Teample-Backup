package Member.Controller;

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

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 회원가입 폼(join.jsp)에서 입력한 내용을 한글처리
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberDAO mdao = new MemberDAO();
		ProductDAO pdao = new ProductDAO(); // 상품 정보를 가져오기 위한 dao객체 생성
		int result = mdao.userPassCheck(id, pw); // 0: 일치, 1:불일치, 2:해당 id가 존재하지 않음
		if (result == 1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호 불일치');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
			return null;
		} else if (result == 2) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('해당 아이디 존재하지 않음');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
			return null;
		}
		Memberbean mbean = mdao.userInfo(id);
		List<Productbean> plist = pdao.getSellerList(mbean.getSeller_no()); // 판매자의 판매상품 리스트를 담는다.
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		session.setAttribute("mbean", mbean);
		session.setAttribute("plist", plist); // 상품리스트 세션 영역에 저장
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./index.me");
		return forward;
	}
}