<%@page import="TradeList.Controller.SellCompletedAction"%>
<%@page import="Member.TableModel.Memberbean"%>
<%@page import="Member.TableModel.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.7.js"
	type="text/javascript"></script>
<script src="js/jquery.bpopup.min.js"></script>

<!-- 팝업 시작 -->
<script type="text/javascript">
	$(document).ready(function() {
		$(".popupButton1").click(function() {
			goPopUp1();
		});
	})

	var goPopUp1 = function() {
		$('#popup1').bPopup();
	}
</script>
<!-- 팝업 끝-->

<!-- 기간별 판매 내역 체크 -->
<script>
function sellTabSend(tab) {
		$('#sellTab').val(tab);
		$('#sellTabForm').submit();
}
</script>
<!-- 기간별 판매 내역 체크 끝-->

<!-- article 시작 -->

<div class="article">
	<div class="mypagewrap">
		<jsp:include page="./inc/article_mp1.jsp"/>
		<!--mp1끝 여기까지 공통 -->

		<div class="mp2">
		<div class="subcate_mp">
		<jsp:include page="./inc/subcate.jsp"/>
		</div>
			<!-- mp2_subcate -->

			<div class="mp2_list_wrap"><!-- mp2_list_wrap 시작 -->
			 <div class="mp2_pslist">
				<ul class="pslist_ul">
					<li class="sal_list"><a href="./SellCompletedAction.tra" class="tit">판매내역</a></li>
					<li><a href="./BuyCompletedAction.tra" class="tit">구매내역</a></li>
				</ul>
			 </div><!-- mp2_pslist 끝 -->
			 	<%
					    if (session.getAttribute("sellTab") != null || session.getAttribute("sellTab") != "") {
					        String sellTab = session.getAttribute("sellTab").toString();
					        String sell_0 = "";
					        String sell_1 = "";
					        String sell_3 = "";
					        String sell_6 = "";
					        switch (sellTab) {
							case "0":
								sell_0 = "checked";
								break;
							case "1":
								sell_1 = "checked";
								break;
							case "3":
								sell_3 = "checked";
								break;
							case "6":
								sell_6 = "checked";
								break;
					       }   		        
				%>
					<!--마이페이지 판매내역 리스트 페이지 -->	
				<div class="slist1">
					<div class="slist_tab">
						<input type="radio" name="tab" id="sell_0" onclick="sellTabSend(0);" <%=sell_0 %>>
						<label for="sell_0" class="sell_0">전체</label> 
						<input type="radio" name="tab" id="sell_1" onclick="sellTabSend(1);" <%=sell_1 %>> 
						<label for="sell_1" class="sell_1">1개월</label> 
						<input type="radio" name="tab" id="sell_3" onclick="sellTabSend(3);" <%=sell_3 %>> 
						<label for="sell_3" class="sell_3">3개월</label> 
						<input type="radio" name="tab" id="sell_6" onclick="sellTabSend(6);" <%=sell_6 %>> 
						<label for="sell_6" class="sell_6">6개월</label>
						
					</div><!-- slist_tab 끝 -->
					<%
					 }
					%> 
							<!-- 기간별 탭 속성값 부여.-->
							<form action="./SellCompletedAction.tra" name="sellTabForm"
								id="sellTabForm" method="post">
								<input type="hidden" name="sellTab" id="sellTab" value="0">
							</form>
							<!-- 기간별 탭 속성값 부여.-->

							<!-- //탭1-1  판매-전체 -->
							<div class="s_list_tb" id="sellTab_0">
								<table class="mypage_tbl">
									<tr>
										<td>판매완료일<br />(등록번호)
										</td>
										<td>상품명</td>
										<td>결제금액</td>
										<td>구매자</td>
									</tr>
									<c:choose>
										<c:when test="${empty slist}">
											<!-- 판매내역이 없을때. -->
											<tr>
												<td colspan="4">판매 내역이 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<!-- 판매내역이 있을때. -->
											<c:forEach var="slist" items="${slist}">
												<tr>
													<td>
														<fmt:formatDate value="${slist.e_time }" type="both" pattern="yyyy-MM-dd"/><br/><br/>
														상품No. ${slist.product_no }
													</td>
													<td>
													<span>
														<a href="./ProductDetail.pro?product_no=${slist.product_no }">
															<c:if test="${slist.product_mainimg eq null}">
															<img class="thumbnail" src="http://placehold.it/100x100">
															</c:if> 
															<c:if test="${slist.product_mainimg ne null}">
															<img class="thumbnail" src="./product_images_category/${slist.product_mainimg }">
															</c:if> 
														</a>
													</span>
													<p>${slist.product_name}</p></td>
													<td><fmt:formatNumber value="${slist.price_end}" type="number"/>원</td>
													<td>${buyerId}<a href="#popupButton1"><img
															src="images/but1.png" class="popupButton1"></a></td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</table>
							</div><!-- s_list_tb 끝 -->
				

							<!--팝업 내용 시작-->
							<div id="popup1" class="Pstyle">
								<span class="b-close">X</span>
								<div class="content">
									<h4>구매자 정보 확인</h4>
									<table>
										<tr>
											<td>이름</td>
											<td>${buyerName}</td>
										</tr>
										<tr>
											<td>연락처</td>
											<td>${buyerPhone}</td>
										</tr>
										<tr>
											<td>이메일</td>
											<td>${buyerEmail}</td>
										</tr>
									</table>
								</div>
							</div>
							<!-- 팝업 내용 끝 -->

						</div><!-- -input&list탭 -->
					
					</div><!-- mp2_list_wrap -->
			</div>
			<!-- mp2 끝 -->

		</div>
		<!-- mypagewrap 끝 -->
	</div>
	<!-- article 끝 -->