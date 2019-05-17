<%@page import="ProductBoard.TableModel.ProductBoardbean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!-- article 시작 -->
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
			
		<%-- 	<%
				if (id.equals(<%=pbean.getId()%>)) {
			%> 
			
			<table class="question_uptbl1">
				<tr>
					<td>고객 아이디</td>
					<td><input type="text" class="uptbl1_id" name="id"
						value="<%=pbbean.getId()%>" readonly></td>
				</tr>
				<tr>
					<td>문의 제목</td>
					<td><input type="text" class="uptbl1_sub" name="subject"
						value="<%=pbbean.getSubject()%>" readonly></td>
				</tr>
				<tr>
					<td>문의 내용</td>
					<td><textarea rows="13" cols="40" name="content" readonly><%=pbbean.getContent()%></textarea></td>
				</tr>
			</table>

			<form action="./ProductBoardUpdateAction.pbo" method="post">
				<input type="hidden" name="num" value="<%=pbbean.getNum()%>">
				<input type="hidden" name="id" value="${pbean.id }">


				<table class="question_uptbl2">
					<tr>
						<td>답변 내용</td>
						<td><textarea rows="20" cols="40" name="reply"></textarea></td>
					</tr>
				</table>

				<div class="question_upbtn">
					<input type="submit" value="답변등록" class="btn"> 
					<input type="reset" value="리셋" class="btn"> <input type="button"
						value="목록" class="btn"
						onclick="location.href='./ProductBoardList.pbo'">
				</div>
			</form>

			<%
				} else {
			%>  --%>




			<form action="./ProductBoardUpdateAction.pbo" method="post">
				<input type="hidden" name="num" value="<%=pbbean.getNum()%>">

				<table class="question_uptbl3">
					<tr>
						<td>아이디</td>
						<td><input type="text" class="question_upid" name="id"
							value="<%=id%>" readonly></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="text" class="pwd" name="pw"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="subject"
							value="<%=pbbean.getSubject()%>"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="13" cols="40" name="content"><%=pbbean.getContent()%></textarea></td>
					</tr>
				</table>

				<div class="question_upbtn">
					<input type="submit" value="수정하기" class="btn"> <input
						type="reset" value="리셋" class="btn"> <input type="button"
						value="목록" class="btn"
						onclick="location.href='./ProductBoardList.pbo'">
				</div>
			</form>

			<%-- <%
				}
			%> --%>

		</div>
		<!-- mp7 -->
		<!-- 바뀌는 부분 끝-->
	</div>
	<!-- mypagewrap 끝 -->
</div>
<!-- article 끝 -->