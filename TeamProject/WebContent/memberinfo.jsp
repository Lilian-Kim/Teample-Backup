<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

			<div class="mem_info">
				<h2>비밀번호 확인</h2>
				<form action="./MemberPassCheck.me" method="post">
					<input type="hidden" name="id" value="${id }">
					<div class="info1">
						<table>
							<tr>
								<td>아이디</td>
								<td><span>${id }</span></td>
								<!-- 세션 아이디값 자동으로 불러오기 -->
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type="password" name="pw" autofocus="autofocus"></td>
							</tr>
						</table>
					</div>
					<!-- info1끝 -->
					<div class="mem_btn">
						<input type="submit" value="확인">
					</div>
				</form>
			</div>
			<!-- mem_info -->

		</div>
		<!-- mp8 -->
		<!-- 바뀌는 부분 끝-->
	</div>
	<!-- mypagewrap 끝 -->
</div>
<!-- article 끝 -->

