package Member.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Function.Action;
import Function.ActionForward;
import Member.TableModel.MemberDAO;
import Member.TableModel.Memberbean;

public class MemberModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		// 아래 내용부 회원정보 수정 내용 입력
		Memberbean mb = new Memberbean();
		mb.setId(request.getParameter("id")); // 회원 id DTO에 저장
		mb.setPw(request.getParameter("pw")); // 회원 pass DTO에 저장
		mb.setName(request.getParameter("name")); // 회원 이름 DTO에 저장
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		StringBuilder s1 = new StringBuilder();
		StringBuilder phone = s1.append(phone1).append("-").append(phone2).append("-").append(phone3);
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		StringBuilder s2 = new StringBuilder();
		StringBuilder email = s2.append(email1).append("@").append(email2);
		mb.setZipcode(Integer.parseInt(request.getParameter("zipcode")));
		mb.setAddr(request.getParameter("addr")); // 회원 주소 DTO에 저장
		mb.setDetailaddr(request.getParameter("detailaddr"));
		mb.setEmail(email.toString()); // 회원 이메일 DTO에 저장
		mb.setPhone(phone.toString()); // 회원 전화번호 DTO에 저장
		boolean result = false;
		MemberDAO mdao = new MemberDAO();
		result = mdao.updateMember(mb);
		if (result == false) {
			return null;
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./MemberUpdateResult.me");
		return forward;
	}
}