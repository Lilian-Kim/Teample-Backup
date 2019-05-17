package MemberBoard.Controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Function.Action;
import Function.ActionForward;
import MemberBoard.TableModel.MemberBoardDAO;

public class MemberBoardDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		String pw = request.getParameter("pw");
		MemberBoardDAO mbdao = new MemberBoardDAO();
		int check = mbdao.deleteQna(num, pw);

		if(check==0){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}else if(check==-1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('에러');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('글이 삭제되었습니다');");
		out.println("location.href='./MemberBoardList.mbo?pageNum="+pageNum+"';");
		out.println("</script>");
		out.close();
		return null;
	}
}