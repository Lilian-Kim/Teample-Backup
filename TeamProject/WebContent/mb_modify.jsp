<%@page import="java.util.StringTokenizer"%>
<%@page import="Member.TableModel.Memberbean"%>
<%@page import="Member.TableModel.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDAO mdao = new MemberDAO();
	String id = (String) session.getAttribute("id");
	String phone = null; // 010-47444-444
	String phone1 = null;
	String phone2 = null;
	String phone3 = null;
	String email = null;
	String email1 = null;
	String email2 = null;
	if (id != null) {
		Memberbean mbean = mdao.userInfo(id);
		phone = mbean.getPhone();
		StringTokenizer st = new StringTokenizer(phone, "-");
		phone1 = st.nextToken();
		phone2 = st.nextToken();
		phone3 = st.nextToken();
		email = mbean.getEmail();
		StringTokenizer st1 = new StringTokenizer(email, "@");
		email1 = st1.nextToken();
		email2 = st1.nextToken();
	}
%>
<!-- article 시작 -->
<div class="article">
	<div class="mypagewrap">
		<jsp:include page="./inc/article_mp1.jsp" />
		<!--mp1끝  여기까지 공통-->

		<!-- 여기부터 페이지마다 바뀜 -->
		<div class="mp8">
			<div class="subcate_info">
				<jsp:include page="./inc/subcate.jsp" />
			</div>
			<!-- subcate_info -->

			<div class="mem_modi">
				<h2>회원 정보</h2>
				<form action="MemberModifyPro.me" method="post">
					<input type="hidden" name="id" value="${id }">
					<div class="modify1">
						<table class="modify_tb">
							<tr>
								<td>아이디 <img src="images/ico_required.gif"></td>
								<td>${id }</td>
							</tr>
							<tr>
								<td>새 비밀번호<img src="images/ico_required.gif"></td>
								<td><input type="password" class="modi_text" name="pw"
									id="pw"></td>
							</tr>
							<tr>
								<td>새 비밀번호 확인 <img src="images/ico_required.gif"></td>
								<td><input type="password" class="modi_text" name="pw2"
									id="pw2"></td>
							</tr>
							<tr>
								<td>이름 <img src="images/ico_required.gif"></td>
								<td><input type="text" class="modi_text" name="name"
									id="name" value="${mbean.name }"></td>
							</tr>
							<tr>
								<td>휴대전화 <img src="images/ico_required.gif"></td>
								<td><select name="phone1">
										<option value="010"
											<%if (phone1.equals("010")) {
				out.print("selected");
			}%>>010</option>
										<option value="011"
											<%if (phone1.equals("011")) {
				out.print("selected");
			}%>>011</option>
										<option value="016"
											<%if (phone1.equals("016")) {
				out.print("selected");
			}%>>016</option>
										<option value="017"
											<%if (phone1.equals("017")) {
				out.print("selected");
			}%>>017</option>
										<option value="018"
											<%if (phone1.equals("018")) {
				out.print("selected");
			}%>>018</option>
										<option value="019"
											<%if (phone1.equals("019")) {
				out.print("selected");
			}%>>019</option>
								</select> - <input type="text" class="modi_text2" name="phone2"
									value="<%=phone2%>"> - <input type="text"
									class="modi_text2" name="phone3" value="<%=phone3%>"></td>
							</tr>
							<tr>
								<td>이메일 <img src="images/ico_required.gif"></td>
								<td><input type="text" class="modi_text" name="email1"
									value="<%=email1%>"> @ <input type="text"
									class="modi_text" name="email2" value="<%=email2%>"> <select
									name="email3">
										<option value="1">naver.com</option>
										<option value="2">daum.net</option>
										<option value="3">gmail.com</option>
										<option value="4">nate.com</option>
										<option value="5">hotmail.com</option>
										<option value="0">직접입력</option>
								</select></td>
							</tr>
							<tr>
								<td>이메일 수신여부 <img src="images/ico_required.gif"></td>
								<td><input type="radio" name="infomail" checked="checked"
									value="1">&nbsp;<label>수신함</label> &nbsp;<input
									type="radio" name="infomail" value="0">&nbsp;<label>수신안함</label>
									<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</td>
							</tr>

							<tr>
								<td>우편번호 <img src="images/ico_required.gif"></td>
								<td><input type="text" class="modi_text2" name="zipcode"
									id="zipcode" placeholder="우편번호" value="${mbean.zipcode }">
									<input type="button" class="btn3"
									onclick="sample6_execDaumPostcode()" value="우편번호검색"></td>
							</tr>
							<tr>
								<td>주소 <img src="images/ico_required.gif"></td>
								<td><input type="text" class="modi_text3" name="addr"
									id="addr" placeholder="주소" value="${mbean.addr }"><br />
									<input type="text" class="modi_text3" name="detailaddr"
									id="detailaddr" placeholder="상세주소" value="${mbean.detailaddr }"></td>
							</tr>

						</table>
					</div>
					<!-- modify1끝 -->
					<div class="modify_btn">
						<input type="submit" value="수정"> <input type="button"
							value="회원탈퇴" onclick="location.href='MemberDelete.me'">
					</div>
				</form>
			</div>
			<!-- mem_modi -->

		</div>
		<!-- mp8 -->
		<!-- 바뀌는 부분 끝-->
	</div>
	<!-- mypagewrap 끝 -->
</div>
<!-- article 끝 -->