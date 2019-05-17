<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- article 시작 -->

<div class="article">
	<div class="mypagewrap">
		<jsp:include page="./inc/article_mp1.jsp" />
		<!--mp1끝  여기까지 공통-->

		<!-- 여기부터 페이지마다 바뀜 -->
		<div class="mp6">
			<div class="subcate_wl">
				<jsp:include page="./inc/subcate.jsp" />
			</div>
			<!-- subcate_pur -->

			<div class="wishlist">
				<div class="wl1">
					<table>
						<caption>찜한상품</caption>
						<tr>
							<td>주문번호</td>
							<td>상품명</td>
							<td>남은 시간</td>
							<td>상품상태</td>
						</tr>
						<c:if test="${empty wlist}">
							<tr>
								<td colspan="4">찜한상품이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty wlist}">
							<c:forEach var="list" items="${wlist }">
								<tr>
									<td>${list.product_no }</td>
									<td>${list.product_name }</td>
									<td>${list.e_time }</td>
									<td>${list.state }</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
				<!-- wl1끝 -->
			</div>
			<!-- wishlist -->

		</div>
		<!-- mp6 -->
		<!-- 바뀌는 부분 끝-->
	</div>
	<!-- mypagewrap 끝 -->
</div>
<!-- article 끝 -->



