package MemberBoard.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Function.Action;
import Function.ActionForward;

public class MemberBoardFrontController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		if (command.equals("/MemberBoardList.mbo")) {// 문의 내역전체 뿌리기
			action = new MemberBoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberBoardWrite.mbo")) {// 문의 글쓰기페이지 진입
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=./memberboard/question_write.jsp");
		} else if (command.equals("/MemberBoardWriteAction.mbo")) {// 문의 글쓰기 실행
			action = new MemberBoardWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberBoardContentAction.mbo")) {// 문의 내용페이지 진입
			action = new MemberBoardContentAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberBoardUpdate.mbo")) {// 문의 수정페이지 진입
			action = new MemberBoardUpdate();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberBoardUpdateAction.mbo")) {// 문의 수정 실행
			action = new MemberBoardUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberBoardDeleteAction.mbo")) {// 문의 삭제 실행
			action = new MemberBoardDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberBoardDelete.mbo")) {// 문의 삭제페이지 진입
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=./memberboard/question_delete.jsp");
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
