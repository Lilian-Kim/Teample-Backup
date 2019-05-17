package ProductBoard.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Function.Action;
import Function.ActionForward;
import MemberBoard.TableModel.MemberBoardDAO;
import MemberBoard.TableModel.MemberBoardbean;
import Product.TableModel.ProductDAO;
import Product.TableModel.Productbean;
import ProductBoard.TableModel.ProductBoardDAO;
import ProductBoard.TableModel.ProductBoardbean;

public class ProducctBoardContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		request.setAttribute("pageNum", pageNum);
		
		ProductBoardDAO pbdao = new ProductBoardDAO();
        //mbdao.updateReadCount(num);
		ProductBoardbean pbbean = pbdao.getDetailViewQna(num);
		request.setAttribute("pbbean", pbbean);
		
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./index.jsp?center=./productboard/pb_question_content.jsp");
		return forward;
		
	}
	
	
	
}
