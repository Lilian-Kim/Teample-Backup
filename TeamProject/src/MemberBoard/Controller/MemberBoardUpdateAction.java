package MemberBoard.Controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Function.Action;
import Function.ActionForward;
import MemberBoard.TableModel.MemberBoardDAO;
import MemberBoard.TableModel.MemberBoardbean;

public class MemberBoardUpdateAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		String pageNum = request.getParameter("pageNum");

		MemberBoardbean mbbean = new MemberBoardbean();
		mbbean.setContent(request.getParameter("content"));
		mbbean.setReply(request.getParameter("reply"));
		mbbean.setId(request.getParameter("id"));
		mbbean.setPw(request.getParameter("pw"));
		mbbean.setSubject(request.getParameter("subject"));
		mbbean.setNum(Integer.parseInt(request.getParameter("num")));

		MemberBoardDAO mbdao = new MemberBoardDAO();
		int check = mbdao.updateQna(mbbean);

		if (check == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		} else if (check == -1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('에러');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		} else if (check == 2) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('답변완료');");
			out.println("location.href='./MemberBoardList.mbo?pageNum=" + pageNum + "';");
			out.println("</script>");
			out.close();
			return null;
		}

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('글이 수정되었습니다');");
		out.println("location.href='./MemberBoardList.mbo?pageNum=" + pageNum + "';");
		out.println("</script>");
		out.close();
		return null;
	}
}