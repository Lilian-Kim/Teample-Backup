package ProductBoard.Controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Function.Action;
import Function.ActionForward;
import ProductBoard.TableModel.ProductBoardDAO;
import ProductBoard.TableModel.ProductBoardbean;

public class ProductBoardUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		ProductBoardbean pbbean = new ProductBoardbean();
		pbbean.setNum(Integer.parseInt(request.getParameter("num")));
		pbbean.setId(request.getParameter("id"));
		pbbean.setPw(request.getParameter("pw"));
		pbbean.setSubject(request.getParameter("subject"));
		pbbean.setContent(request.getParameter("content"));
		pbbean.setReply(request.getParameter("reply"));
		
		ProductBoardDAO pbdao = new ProductBoardDAO();
			pbdao.updateQna(pbbean);

		

			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=./product/product.jsp");
			return forward;
	}

	
}
