package Product.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Function.Action;
import Function.ActionForward;
import Product.TableModel.ProductDAO;
import Product.TableModel.Productbean;

public class ProductSearchListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		String search = req.getParameter("searchInput");
		System.out.println("헤더 검색어 : " + search);
		
		ProductDAO pdao = new ProductDAO();
		List<Productbean> slist = pdao.getSearchList(search);
		session.setAttribute("slist", slist);

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./SearchCompleted.pro");
		return forward;
	}
}