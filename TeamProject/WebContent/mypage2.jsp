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

<!-- 기간별 구매/판매 내역 체크 -->

<script type="text/javascript">
	function buyTabSend(tab) {

		$('#buyTab').val(tab);
		$('#buyTabForm').submit();
	}
</script>


<%
MemberDAO mdao = new MemberDAO();
String id = (String)session.getAttribute("id");
int mymoney = mdao.getMoney(id);
Memberbean name = (Memberbean)mdao.userInfo(id);
String myname = name.getName();
%>

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
					<li class=""><a href="./SellCompletedAction.tra" class="tit">판매내역</a></li>
					<li class="pur_list"><a href="./BuyCompletedAction.tra" class="tit">구매내역</a></li>
				</ul>
			 </div><!-- mp2_pslist 끝 -->
		
					<%
					    if (session.getAttribute("buyTab") != null || session.getAttribute("buyTab") != "") {
					        String buyTab = session.getAttribute("buyTab").toString();
					        String buy_0 = "";
					        String buy_1 = "";
					        String buy_3 = "";
					        String buy_6 = "";		        
					        switch (buyTab) {   
							case "0":
								buy_0 = "checked";
								break;
							case "1":
								buy_1 = "checked";
								break;
							case "3":
								buy_3 = "checked";
								break;
							case "6":
								buy_6 = "checked";
								break;
					       }   
					%>

					<!--마이페이지 판매내역 리스트 페이지 -->

					<div class="plist1">
						<div class="plist_tab">
						<input type="radio" name="tab" id="buy_0" onclick="buyTabSend(0);" <%=buy_0%>>
						<label for="buy_0" class="buy_0">전체</label> 
						<input type="radio" name="tab" id="buy_1" onclick="buyTabSend(1);" <%=buy_1%>> 
						<label for="buy_1" class="buy_1">1개월</label> 
						<input type="radio" name="tab" id="buy_3" onclick="buyTabSend(3);" <%=buy_3%>> 
						<label for="buy_3" class="buy_3">3개월</label> 
						<input type="radio" name="tab" id="buy_6" onclick="buyTabSend(6);" <%=buy_6%>>
						<label for="buy_6" class="buy_6">6개월</label>
					</div><!-- plist_tab 끝 -->	
						
						<%
						    }
						%>
						
							<!-- 기간별 탭 속성값 부여.-->
							<form action="./BuyCompletedAction.tra" name="buyTabForm"
								id="buyTabForm" method="post">
								<input type="hidden" name="buyTab" id="buyTab" value="0">
							</form>
							<!-- 기간별 탭 속성값 부여.-->

							<!-- //탭1-1  판매-전체 -->
							
							<div class="p_list_tb" id="buyTab_0">
								<table class="mypage_tbl">
									<tr>
										<td>구매완료일<br />(등록번호)
										</td>
										<td>상품명</td>
										<td>결제금액</td>
										<td>판매자</td>
									</tr>
									<c:choose>
										<c:when test="${empty blist}">
											<!-- 구매내역이 없을때. -->
											<tr>
												<td colspan="4">구매 내역이 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<!-- 구매내역이 있을때. -->
											<c:forEach var="blist" items="${blist}">
												<tr>
													<td>
														<fmt:formatDate value="${blist.e_time }" type="both" pattern="yyyy-MM-dd"/><br/><br/>
														상품No. ${blist.product_no }
													</td>
													<td>
													<span>
														<a href="./ProductDetail.pro?product_no=${blist.product_no }">
															<c:if test="${blist.product_mainimg eq null}">
															<img class="thumbnail" src="http://placehold.it/100x100">
															</c:if> 
															<c:if test="${blist.product_mainimg ne null}">
															<img class="thumbnail" src="./product_images_category/${blist.product_mainimg }">
															</c:if> 
														</a>
													</span>
														<p>${blist.product_name}</p></td>
													<td><fmt:formatNumber value="${blist.price_end}" type="number"/>원</td>
													<td>${sellerId}<a href="#popupButton1"><img
															src="images/but1.png" class="popupButton1"></a></td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
							<!-- p_list_tb 끝 -->

							<!--팝업 내용 시작-->
							<div id="popup1" class="Pstyle">
								<span class="b-close">X</span>
								<div class="content">
									<h4>판매자 정보 확인</h4>
									<table>
										<tr>
											<td>이름</td>
											<td>${sellerName}</td>
										</tr>
										<tr>
											<td>연락처</td>
											<td>${sellerPhone}</td>
										</tr>
										<tr>
											<td>이메일</td>
											<td>${sellerEmail}</td>
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