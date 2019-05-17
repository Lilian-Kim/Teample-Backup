package ProductBoard.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Function.Action;
import Function.ActionForward;
import MemberBoard.Controller.MemberBoardContentAction;
import MemberBoard.Controller.MemberBoardDeleteAction;
import MemberBoard.Controller.MemberBoardListAction;
import MemberBoard.Controller.MemberBoardUpdate;
import MemberBoard.Controller.MemberBoardUpdateAction;
import MemberBoard.Controller.MemberBoardWriteAction;

public class ProductBoardFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		System.out.println("command" + command);
		
		if (command.equals("/ProductBoardList.pbo")) {// 1
			System.out.println("1");
			action = new ProductBoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}  else if (command.equals("/ProductBoardWrite.pbo")) {// 2
			System.out.println("2");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=./productboard/pb_question_write.jsp");
		} else if (command.equals("/ProductBoardWriteAction.pbo")) {// 2
			System.out.println("3");
			action = new ProductBoardWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ProducctBoardContentAction.pbo")) {// 문의 내용페이지 진입
			action = new ProducctBoardContentAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ProductBoardUpdate.pbo")) {// 문의 수정페이지 진입
			action = new ProductBoardUpdate();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/ProductBoardUpdateAction.pbo")) {// 문의 수정 실행
			action = new ProductBoardUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ProductBoardDelete.pbo")) {// 문의 삭제페이지 진입
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=./productboard/pb_question_delete.jsp");
		} else if (command.equals("/ProductBoardDeleteAction.pbo")) {// 문의 삭제 실행
			action = new ProductBoardDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		
		
		
		
		
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
		
	}
	
	
	@Override
	protected void doGet(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
		doProcess(requset, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
}
