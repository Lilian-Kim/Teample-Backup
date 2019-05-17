package Product.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Function.Action;
import Function.ActionForward;
import Member.TableModel.Memberbean;
import Product.TableModel.ProductDAO;
import Product.TableModel.Productbean;
import Product.TableModel.TenderDAO;
import Product.TableModel.Tenderbean;
import ProductBoard.TableModel.ProductBoardDAO;
import ProductBoard.TableModel.ProductBoardbean;

public class ProductDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(); // 현재 접속한 클라이언트의 세션값을 가져온다.
		String id = (String) session.getAttribute("id"); // 로그인 상태이기 때문에 id값을 가져옴
		int product_no = Integer.parseInt(request.getParameter("product_no"));
		
		ProductDAO pdao = new ProductDAO(); // 상품 정보를 가져오기 위한 dao객체 생성
		Productbean pbean = pdao.getProductDetail(product_no); // 판매자의 판매상품 리스트를 담는다.
		session.setAttribute("pbean", pbean); // 상품리스트 세션 영역에 저장

		TenderDAO tdao = new TenderDAO(); // 입찰 정보를 가져오기 위한 dao객체 생성
		List<Tenderbean> protenderlist = tdao.getProductTenderList(product_no); // 해당상품에 대한 입찰정보를 가져온다.
		session.setAttribute("protenderlist", protenderlist); // 입찰정보 리스트 세션 영역에 저장
		
		Memberbean mbean = (Memberbean) session.getAttribute("mbean");
		// ------------------------------ 상품 문의하기 게시판
		if (id != null) {
			ProductBoardDAO pbdao = new ProductBoardDAO();
			int count;
			if (pbean.getSeller_no() == mbean.getSeller_no()) {
				count = pbdao.getQnaSellerCount(mbean.getSeller_no());
			} else {
				count = pbdao.getQnaCount(id);
			}
			int pageSize = 5;
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null)
				pageNum = "1";
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = currentPage * pageSize;
			List<ProductBoardbean> pboardList = null;
			if (count != 0) {
				if (pbean.getSeller_no() == mbean.getSeller_no()) {
					pboardList = pbdao.getQnaSellerList(mbean.getSeller_no(), startRow, pageSize);
				} else {
					pboardList = pbdao.getQnaList(id, startRow, pageSize);
				}
			}
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 10;
			int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount)
				endPage = pageCount;
			
			session.setAttribute("count", count);
			session.setAttribute("pboardList", pboardList);
			session.setAttribute("pageNum", pageNum);
			session.setAttribute("pageCount", pageCount);
			session.setAttribute("pageBlock", pageBlock);
			session.setAttribute("startPage", startPage);
			session.setAttribute("endPage", endPage);
			
			// -------------------------------- 상품 문의하기 게시판
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./ProductDetailView.pro");
		return forward;
	}
}