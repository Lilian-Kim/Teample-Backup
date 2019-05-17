package Member.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Function.Action;
import Function.ActionForward;
import Member.TableModel.MemberDAO;
import Member.TableModel.Memberbean;

public class MemberChargeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		int cmoney = Integer.parseInt(request.getParameter("cmoney"));
		int mymoney = Integer.parseInt(request.getParameter("mymoney"));
		int total = cmoney + mymoney;
		MemberDAO mdao = new MemberDAO();
		boolean result = mdao.chargeMoney(id, total);
		
		if (result == true) {
			Memberbean mbean = new Memberbean();
			mbean = mdao.userInfo(id);
			session.setAttribute("mbean", mbean);
		}
				
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./MemberMyMoney.me");
		return forward;
	}
}