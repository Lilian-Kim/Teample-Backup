package Member.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Function.Action;
import Function.ActionForward;

public class MemberFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void requestPro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String RequestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		System.out.println("멤버 프론트 : " + command);
		if (command.equals("/index.me")) { // index 페이지로 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp");
		} else if (command.equals("/MemberJoin.me")) { // 회원가입 페이지로 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=member/join.jsp");
		} else if (command.equals("/MemberJoinAction.me")) { // 회원가입 내용 처리
			try {
				action = new MemberJoinAction();
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberLogin.me")) { // 로그인 페이지로 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=member/login.jsp");
		} else if (command.equals("/MemberLoginAction.me")) { // 로그인 처리
			try {
				action = new MemberLoginAction();
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberLogout.me")) { // 로그아웃 처리
			action = new MemberLogoutAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberMyMoney.me")) { // 로그인 페이지로 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=member/money.jsp");
		} else if (command.equals("/MemberCharge.me")) { // 로그아웃 처리
			action = new MemberChargeAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberInfo.me")) { // 개인정보 페이지로 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=memberinfo.jsp");
		} else if (command.equals("/MemberPassCheck.me")) { // 개인정보 페이지 패스워드 확인처리
			action = new MemberPassCheckAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberModify.me")) { // 개인정보 수정페이지로 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=mb_modify.jsp");
		} else if (command.equals("/MemberModifyPro.me")) { // 개인정보 수정처리
			action = new MemberModifyAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberUpdateResult.me")) { // 개인정보 수정페이지로 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=updateresult.jsp");
		}else if(command.equals("/MemberDelete.me")){//회원탈퇴 처리
			action = new MemberDeleteAction();
			try {
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