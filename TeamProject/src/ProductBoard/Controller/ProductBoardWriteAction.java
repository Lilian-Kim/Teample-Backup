package ProductBoard.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Function.Action;
import Function.ActionForward;
import ProductBoard.TableModel.ProductBoardDAO;
import ProductBoard.TableModel.ProductBoardbean;

public class ProductBoardWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		ProductBoardbean pbbean = new ProductBoardbean();
		pbbean.setProduct_no(Integer.parseInt(request.getParameter("product_no")));
		pbbean.setId(request.getParameter("id"));
		pbbean.setSeller_no(Integer.parseInt(request.getParameter("seller_no")));
		pbbean.setPw(request.getParameter("pw"));
		pbbean.setSubject(request.getParameter("subject"));
		pbbean.setContent(request.getParameter("content"));
		
		ProductBoardDAO pbdao = new ProductBoardDAO();
		pbdao.writeQna(pbbean);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./ProductDetail.pro");
		return forward;
		
		
	}

	
}
