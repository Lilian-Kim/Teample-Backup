package MemberBoard.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Function.Action;
import Function.ActionForward;
import MemberBoard.TableModel.MemberBoardDAO;
import MemberBoard.TableModel.MemberBoardbean;

public class MemberBoardWriteAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");

		MemberBoardbean mbbean = new MemberBoardbean();
		mbbean.setId(request.getParameter("id"));
		mbbean.setPw(request.getParameter("pw"));
		mbbean.setSubject(request.getParameter("subject"));
		mbbean.setContent(request.getParameter("content"));
		
		MemberBoardDAO mbdao = new MemberBoardDAO();
		mbdao.writeQna(mbbean);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./MemberBoardList.mbo");
		return forward;
	}
}