package Member.Controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Engine.ObjectIdFactory;
import Function.Action;
import Function.ActionForward;
import Member.TableModel.MemberDAO;
import Member.TableModel.Memberbean;

public class MemberJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 회원가입 폼(join.jsp)에서 입력한 내용을 한글처리
		request.setCharacterEncoding("UTF-8");
		Memberbean mb = new Memberbean();
		int objid = ObjectIdFactory.getInstance().nextId(); // 오브젝트 id 가져오기
		mb.setSeller_no(objid);
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
//		mb.setInfomail(Integer.parseInt(request.getParameter("infomail")));
		mb.setAddr(request.getParameter("addr1")); // 회원 주소 DTO에 저장
		mb.setDetailaddr(request.getParameter("addr2"));
		mb.setEmail(email.toString()); // 회원 이메일 DTO에 저장
		mb.setPhone(phone.toString()); // 회원 전화번호 DTO에 저장
		mb.setRegdate(new Timestamp(System.currentTimeMillis()));
		boolean result = false;
		MemberDAO mdao = new MemberDAO();
		result = mdao.insertMember(mb);
		if (result == false) {
			return null;
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./MemberLogin.me");
		return forward;
	}
}