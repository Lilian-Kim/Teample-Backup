<%@page import="ProductBoard.TableModel.ProductBoardbean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>

<div class="article">
	<div class="mypagewrap">

		<!--mp1끝  여기까지 공통-->

		<!-- 여기부터 페이지마다 바뀜 -->
		<%
			String id = (String) session.getAttribute("id");
			if (id == null)
				response.sendRedirect("./MemberLogin.me");
			ProductBoardbean pbbean = (ProductBoardbean) request.getAttribute("pbbean");
			String pageNum = (String) request.getAttribute("pageNum");
		%>
		<div class="mp7">
			<div class="subcate_que"></div>
			<!-- subcate_que -->

			<table class="qnaread">
				<tr>
					<td>제목</td>
					<td colspan="3"><%=pbbean.getSubject()%></td>
				</tr>
				<%-- <tr>
<td>임시1</td>
<td><%=pbbean.getNum() %></td>
<td>임시2</td><td><%=pbbean.getReadcount() %></td>
</tr> --%>
				<tr>
					<td>작성자</td>
					<td><%=pbbean.getId()%></td>
					<td>작성일</td>
					<td><%=pbbean.getDate()%></td>
				</tr>
				<tr>
					<td class="qnareadtd1">내용</td>
					<td colspan="3"><%=pbbean.getContent()%></td>
				</tr>
				<%
					if (pbbean.getQnastatus() == 1) {
				%><tr style="border: 1px solid gray;">
					<td class="qnareadtd1">답변내용&nbsp;&nbsp;&nbsp;</td>
					<td colspan="3"><%=pbbean.getReply()%></td>
				</tr>
				<%
					}
				%>
			</table>

			<div class="qnaread_btn">
				<%-- <%if(id!=null){if(id.equals(%><%=pbbean.getSeller_no()%><%)){%>
 --%>
				<input type="button" value="답변하기" class="btn replybtn"
					onclick="location.href='./ProductBoardUpdate.pbo?num=<%=pbbean.getNum()%>'">


				<%-- <%}else{%>
 --%>
				<input type="button" value="글수정" class="btn updatebtn"
					onclick="location.href='./ProductBoardUpdate.pbo?num=<%=pbbean.getNum()%>'">
				<input type="button" value="글삭제" class="btn deletebtn"
					onclick="location.href='./ProductBoardDelete.pbo?num=<%=pbbean.getNum()%>'">


				<%-- <%}
}%> --%>

				<input type="button" value="목록보기" class="btn exitbtn"
					onclick="location.href='./ProductBoardList.pbo'">

			</div>
			<!--"qnaread_btn" 끝-->

		</div>
		<!-- mp7 -->
		<!-- 바뀌는 부분 끝-->
	</div>
	<!-- mypagewrap 끝 -->
</div>
<!-- article 끝 -->