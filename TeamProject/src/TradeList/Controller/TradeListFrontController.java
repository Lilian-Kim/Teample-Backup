package TradeList.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Function.Action;
import Function.ActionForward;

public class TradeListFrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestPro(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestPro(req, resp);
	}

	protected void requestPro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String RequestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		System.out.println("구매내역 프론트 : " + command);
		if (command.equals("/index.tra")) { // index 페이지로 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp");
		} else if (command.equals("/TradeCompleted.tra")) { // 판매내역 페이지 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=mypage.jsp");
		} else if (command.equals("/TradeCompleted2.tra")) { // 구매내역 페이지 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=mypage2.jsp");
		} else if (command.equals("/SellCompletedAction.tra")) { // 판매물품 페이지.(마이페이지-디폴트 페이지)
			try {
				action = new SellCompletedAction();
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/BuyCompletedAction.tra")) { // 구매물품 내역
			try {
				action = new BuyCompletedAction();
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 주소 이동
		if (forward != null) {
			if (forward.isRedirect()) { // true -> Response.sendRedirect() 방식
				resp.sendRedirect(forward.getPath());
			} else { // false -> forward()방식
				RequestDispatcher dis = req.getRequestDispatcher(forward.getPath());
				dis.forward(req, resp);
			}
		}
	}
}