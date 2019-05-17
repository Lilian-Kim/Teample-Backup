<%@page import="Member.TableModel.Memberbean"%>
<%@page import="Member.TableModel.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int seller_no = Integer.parseInt(request.getParameter("seller_no"));
	MemberDAO mdao = new MemberDAO();
	Memberbean mbean = new Memberbean();
	mbean = mdao.userInfo(seller_no);
%>

<style>
* {
	margin: 0;
	padding: 0;
	/* 	border: 1px solid red;   */
	text-decoration: none;
	border-collapse: collapse;
	outline: none;
}

body {
	box-sizing: border-box;
	color: #333;
	font-family: "맑은 고딕";
	width: 620px;
	font-size: 12px;
}

.gradepic {
	width: 137px;
	height: 154px;
}

.sellerinfo {
	margin: 0 auto;
}

.sellerinfo td {
	border: 1px solid gray;
}

.sellerinfo .sellinfo_td1 {
	width: 60px;
	padding-left: 10px;
}
</style>

<table class="sellerinfo">
	<tr>
		<td rowspan="3" class="gradepic">
			<%
				switch (mbean.getGrade()) {
				case 0:
			%><img src="../images/grade0big.png">
			<%
				;
					break;
				case 1:
			%><img src="../images/grade1big.png">
			<%
				;
					break;
				case 2:
			%><img src="../images/grade2big.png">
			<%
				;
					break;
				case 3:
			%><img src="../images/grade3big.png">
			<%
				;
					break;
				case 4:
			%><img src="../images/grade4big.png">
			<%
				;
					break;
				case 5:
			%><img src="../images/grade5big.png">
			<%
				;
					break;
				}
			%>
		</td>
		<td class="sellinfo_td1">판매자</td>
		<td><%=mbean.getName()%></td>
	</tr>
	<tr>
		<td class="sellinfo_td1">소재지</td>
		<td><%=mbean.getAddr()%> <%=mbean.getDetailaddr()%></td>
	</tr>
	<tr>
		<td class="sellinfo_td1">연락처</td>
		<td><%=mbean.getPhone()%></td>
	</tr>
</table>