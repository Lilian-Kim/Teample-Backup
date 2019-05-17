package Product.Controller;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Function.Action;
import Function.ActionForward;
import Product.TableModel.WishlistDAO;
import Product.TableModel.Wishlistbean;

public class ProductWishlistAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession(); // 현재 접속한 클라이언트의 세션값을 가져온다.
		String id = (String) session.getAttribute("id"); // 로그인 상태이기 때문에 id값을 가져옴
		int product_no = Integer.parseInt(req.getParameter("product_no"));
		Wishlistbean wbean = new Wishlistbean();
		WishlistDAO wdao = new WishlistDAO();
		boolean check = wdao.getwishcheck(id, product_no);
		if (id == null) { // 만약 로그인 상태가 아니라면 (비정상적인 접근)
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('로그인후 이용가능 합니다.');");
			out.println("location.href='./MemberLogin.me'");
			out.println("</script>");
			out.close();
			return null; // 리턴
		}
		if (check == false) {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("location.href='./ProductDetailView.pro'");
			out.println("alert('이미 찜한 상품입니다.')");
			out.println("</script>");
			out.close();
			return null; // 리턴
		} else {
			wbean.setId(id);
			wbean.setProduct_no(product_no);
			wbean.setProduct_name(req.getParameter("product_name"));
			wbean.setE_time(Timestamp.valueOf(req.getParameter("e_time")));
			wbean.setState(Integer.parseInt(req.getParameter("state")));
			wdao.insertWhislist(wbean);
			List<Wishlistbean> wlist = wdao.getWishlist(id);
			session.setAttribute("wlist", wlist);
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./ProductWishlistView.pro");
		return forward;
	}
}
