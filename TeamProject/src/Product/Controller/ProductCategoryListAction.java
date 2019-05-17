package Product.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Function.Action;
import Function.ActionForward;
import Product.TableModel.CategoryDAO;
import Product.TableModel.Categorybean;
import Product.TableModel.ProductDAO;
import Product.TableModel.Productbean;
import Product.TableModel.TenderDAO;
import Product.TableModel.Tenderbean;

public class ProductCategoryListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();

		int maincate = Integer.parseInt(req.getParameter("maincate")); // 대분류
		int subcate; // 중분류
		int indexnum; // 소분류

		if (req.getParameter("category") == null) { // 소분류를 클릭한게 아니면 0
			indexnum = 0;
		} else {
			indexnum = Integer.parseInt(req.getParameter("category")); // 소분류를 클릭했으면 해당 값 받음
		}
		if (req.getParameter("subcate") == null) { // 중분류를 클릭한게 아니면 0
			subcate = 0;
		} else {
			subcate = Integer.parseInt(req.getParameter("subcate")); // 중분류를 클릭했으면 해당 값 받음
		}

		CategoryDAO cdao = new CategoryDAO();
		ProductDAO pdao = new ProductDAO();
		TenderDAO tdao = new TenderDAO(); // 상품 정보를 가져오기 위한 dao객체 생성

		List<Productbean> clist = pdao.getCategoryList(indexnum, maincate, subcate); // 카테고리별 상품리스트
		Categorybean cateaddr = cdao.getCategoryAddr(indexnum, maincate, subcate); // 카테고리 경로
		List<Integer> tendercount = new ArrayList<Integer>();
		for (int i = 0; i < clist.size(); i++) {
			Productbean pbean = clist.get(i);
			List<Tenderbean> tinfolist = tdao.getProductTenderList(pbean.getProduct_no()); // 현재 나의 입찰리스트들 저장
			int count = tinfolist.size();
			tendercount.add(count);
		}

		session.setAttribute("tendercount", tendercount);
		session.setAttribute("cateaddr", cateaddr);
		session.setAttribute("clist", clist);

		ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("./index.jsp?center=./product/category_list.jsp");
        return forward;
	}
}