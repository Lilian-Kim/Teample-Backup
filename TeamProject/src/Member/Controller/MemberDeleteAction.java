package Member.Controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Function.Action;
import Function.ActionForward;
import Member.TableModel.MemberDAO;

public class MemberDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(true);
		String id = (String)session.getAttribute("id");
		MemberDAO mdao = new MemberDAO();
		mdao.deleteMember(id);
		session.invalidate();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('탈퇴가 처리되었습니다.');");
		out.println("location.href='./index.me'");
		out.println("</script>");
		out.close();
		return null;
	}
}