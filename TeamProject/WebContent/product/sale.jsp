<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- article 시작 -->

<div class="article">
	<div class="mypagewrap">
		<jsp:include page="../inc/article_mp1.jsp"/>
		<!--mp1끝  여기까지 공통-->

		<!-- 여기부터 페이지마다 바뀜 -->
		<div class="mp5">
			<div class="subcate_sale">
				<jsp:include page="../inc/subcate.jsp"/>
			</div>
			<!-- subcate_pur -->
			<div class="sale">
				<div class="sale1">
					<c:if test="${empty plist}">
						<!-- 판매중인 상품이 없을 때 -->
						<table class="sale_tb1">
							<caption>판매중인 상품</caption>
							<tr>
								<td>등록일<br />(등록번호)
								</td>
								<td>상품명</td>
								<td>결제금액</td>
								<td>판매자</td>
								<td>판매상태</td>
							</tr>
							<tr>
								<td colspan="5">판매중인 상품이 없습니다.<br /> 
								<input type="button" value="판매등록" onclick="location.href='./ProductReg.pro'">
								</td>
							</tr>
						</table>
					</c:if>

					<c:if test="${!empty plist}">
						<!-- 판매중인 상품이 있을 때 -->
						<div class="sale_btn">
						<input type="button" value="판매등록" onclick="location.href='./ProductReg.pro'">
						</div>
						<table class="sale_tb2">
							<caption>판매중인 상품</caption>
							<tr>
								<td>등록일<br />(등록번호)
								</td>
								<td>상품명</td>
								<td>결제금액</td>
								<td>판매자</td>
								<td>판매상태</td>
							</tr>
							<c:forEach var="list" items="${plist }">
							<c:set var="statee" value="${list.state }" />
							<c:choose>
							<c:when test="${statee < 4}">
							<tr>
							
								<td>
									<fmt:formatDate value="${list.s_time }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/><br/><br/>
									상품No. ${list.product_no }
								</td>
								<td>
									<span>
										<a href="./ProductDetail.pro?product_no=${list.product_no }">
											<c:if test="${list.product_mainimg eq null}">
											<img class="thumbnail" src="http://placehold.it/100x100">
											</c:if> 
											<c:if test="${list.product_mainimg ne null}">
											<img class="thumbnail" src="./product_images_category/${list.product_mainimg }">
											</c:if> 
										</a>
									</span>
									<p>
										<a href="./ProductDetail.pro?product_no=${list.product_no }">
										${list.product_name }
										</a>
									</p>
								</td>
								<td><fmt:formatNumber value="${list.price_action }" type="number"/>원</td>
								<td>${mbean.name }</td> <!-- 판매자 이름 -->
								 
						<c:set var="state" value="${list.state }" />
						<c:choose>
						<c:when test="${state eq 1}">
						<td>경매중<br/>
<%--  						<input type="button" value="경매취소" onclick="location.href='./ProductTenderStateAction.pro?seller_no=${list.seller_no}&buyer_no=${list.end_buyer_no }&state=4'"><br /> --%>
						</td>
						</c:when>
						<c:when test="${state eq 2}">
						<td>배송준비<br/>
						<input type="button" value="발송완료" onclick="location.href='./ProductTenderStateAction.pro?product_no=${list.product_no }&state=6'"><br />
						<input type="button" value="판매취소" onclick="location.href='./ProductTenderStateAction.pro?product_no=${list.product_no }&tender_price=${list.price_end}&buyer_no=${list.end_buyer_no }&seller_no=${list.seller_no}&state=5'"><br />
						</td>
						</c:when>
						<c:when test="${state eq 3}">
						<td>배송중<br/>
						<input type="button" value="구매확정대기"><br />
						</td>
						</c:when>
						<c:when test="${state eq 4}"><!-- 임시 -->
						<td>배송완료<br/>
						<input type="button" value="거래종료"><br />
						</td>
						</c:when>
						<c:otherwise></c:otherwise>
   						</c:choose>
							
							</tr>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>	
							</c:forEach>
						</table>
					</c:if>
				</div>
				<!-- sale1끝 -->
			</div>
			<!-- sale -->
		</div>
		<!-- mp5 -->
		<!-- 바뀌는 부분 끝-->
	</div>
	<!-- mypagewrap 끝 -->
</div>
<!-- article 끝 -->