<%@page import="ProductBoard.TableModel.ProductBoardbean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!-- article ���� -->
<div class="article">
	<div class="mypagewrap">

		<!--mp1��  ������� ����-->

		<!-- ������� ���������� �ٲ� -->
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
					<td>�� ���̵�</td>
					<td><input type="text" class="uptbl1_id" name="id"
						value="<%=pbbean.getId()%>" readonly></td>
				</tr>
				<tr>
					<td>���� ����</td>
					<td><input type="text" class="uptbl1_sub" name="subject"
						value="<%=pbbean.getSubject()%>" readonly></td>
				</tr>
				<tr>
					<td>���� ����</td>
					<td><textarea rows="13" cols="40" name="content" readonly><%=pbbean.getContent()%></textarea></td>
				</tr>
			</table>

			<form action="./ProductBoardUpdateAction.pbo" method="post">
				<input type="hidden" name="num" value="<%=pbbean.getNum()%>">
				<input type="hidden" name="id" value="${pbean.id }">


				<table class="question_uptbl2">
					<tr>
						<td>�亯 ����</td>
						<td><textarea rows="20" cols="40" name="reply"></textarea></td>
					</tr>
				</table>

				<div class="question_upbtn">
					<input type="submit" value="�亯���" class="btn"> 
					<input type="reset" value="����" class="btn"> <input type="button"
						value="���" class="btn"
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
						<td>���̵�</td>
						<td><input type="text" class="question_upid" name="id"
							value="<%=id%>" readonly></td>
					</tr>
					<tr>
						<td>��й�ȣ</td>
						<td><input type="text" class="pwd" name="pw"></td>
					</tr>
					<tr>
						<td>����</td>
						<td><input type="text" name="subject"
							value="<%=pbbean.getSubject()%>"></td>
					</tr>
					<tr>
						<td>����</td>
						<td><textarea rows="13" cols="40" name="content"><%=pbbean.getContent()%></textarea></td>
					</tr>
				</table>

				<div class="question_upbtn">
					<input type="submit" value="�����ϱ�" class="btn"> <input
						type="reset" value="����" class="btn"> <input type="button"
						value="���" class="btn"
						onclick="location.href='./ProductBoardList.pbo'">
				</div>
			</form>

			<%-- <%
				}
			%> --%>

		</div>
		<!-- mp7 -->
		<!-- �ٲ�� �κ� ��-->
	</div>
	<!-- mypagewrap �� -->
</div>
<!-- article �� -->