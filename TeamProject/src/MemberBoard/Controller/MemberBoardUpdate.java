package MemberBoard.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Function.Action;
import Function.ActionForward;
import MemberBoard.TableModel.MemberBoardDAO;
import MemberBoard.TableModel.MemberBoardbean;

public class MemberBoardUpdate implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		request.setAttribute("pageNum", pageNum);

		MemberBoardDAO mbdao = new MemberBoardDAO();
		MemberBoardbean mbbean = mbdao.getDetailViewQna(num);
		request.setAttribute("mbbean", mbbean);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./index.jsp?center=./memberboard/question_update.jsp");
		return forward;
	}
}