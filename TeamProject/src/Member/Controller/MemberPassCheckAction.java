package Member.Controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Function.Action;
import Function.ActionForward;
import Member.TableModel.MemberDAO;

public class MemberPassCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		// 아래 내용부 패스워드 확인
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println(id);
		System.out.println(pw);
		MemberDAO mdao = new MemberDAO();
		int result = mdao.userPassCheck(id, pw); // 0: 일치, 1:불일치, 2:해당 id가 존재하지 않음
		if (result == 1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호 불일치');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
			return null;
		} else if (result == 2) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('해당 아이디 존재하지 않음');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
			return null;
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./MemberModify.me");
		return forward;
	}
	
	
}
