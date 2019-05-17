package ProductBoard.Controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Function.Action;
import Function.ActionForward;
import ProductBoard.TableModel.ProductBoardDAO;

public class ProductBoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pw = request.getParameter("pw");
		
		System.out.println(num);
		System.out.println(pw);
		ProductBoardDAO pbdao = new ProductBoardDAO();
		pbdao.deleteQna(num, pw);

		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./index.jsp?center=./product/product.jsp");
		return forward;
	}

	
}
