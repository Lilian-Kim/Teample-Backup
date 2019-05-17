package ProductBoard.Controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Function.Action;
import Function.ActionForward;
import MemberBoard.TableModel.MemberBoardDAO;
import MemberBoard.TableModel.MemberBoardbean;
import ProductBoard.TableModel.ProductBoardDAO;
import ProductBoard.TableModel.ProductBoardbean;

public class ProductBoardListAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession httpsession = request.getSession(false);
		String id = (String) httpsession.getAttribute("id");
		
		ProductBoardDAO pbdao = new ProductBoardDAO();
		int count = pbdao.getQnaCount(id);
		int pageSize = 5;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null)
			pageNum = "1";
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		List<ProductBoardbean> pboardList = null;
		
		if (count != 0)
			pboardList = pbdao.getQnaList(id, startRow, pageSize);
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int pageBlock = 10;
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		
		
		request.setAttribute("count", count);
		request.setAttribute("pboardList", pboardList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./ProductDetailView.pro");
		return forward;
		
		
	}

}
