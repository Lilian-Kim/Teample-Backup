<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>당신이 찾는 모든 스타일, 자투리</title>
<link rel="stylesheet" type="text/css" href="css/b.css"/>

<script type="text/javascript">
function resizeWindow(win)    {
	var wid = win.document.body.offsetWidth + 16;
	var hei = win.document.body.offsetHeight + 67;       
	win.resizeTo(wid,hei);
	}
</script>

</head>
<body onload='resizeWindow(this)'>
	<!-- body -->
	<div id="body" class="withname">
	<hr>
		<div id="maxzone" style="clear: both; width: 520px;">
			<!-- CONTENTS -->
			<div id="contents">
				<!-- 경매정보 -->
				<div>
					<h2 class="bid">입찰 상품</h2>
					<div class="mtxxs">
						<table cellpadding="0" cellspacing="0" class="bid_tbl5">
							<tr>
								<th>상품명</th>
								<td>${pbean.product_name }</td>
							</tr>
							<tr>
								<th>경매마감일자</th>
								<td><fmt:formatDate value="${pbean.e_time }" type="both" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
							</tr>
							<tr>
								<th>최대 구매가능 수량</th>
								<td>1개</td>
							</tr>
							<tr>
								<th>판매지역</th>
								<td>전국</td>
							</tr>
						</table>
					</div>
				</div>
				<div>
					<!-- <div class="ar bid_text mts">
						구분 : <strong class="org">● 낙찰자</strong> <strong class="blue">●	낙찰가능자</strong>
					</div> -->
					<div class="mtxxs3">
						<table cellpadding="0" cellspacing="0" class="bid_tbl6">
							<tr>
								<th>입찰자 ID</th>
								<th>입찰일자</th>
								<th>입찰가격</th>
								<th>수량</th>
								<th>누적수량</th>
							</tr>
							<!-- v3 -->
							<c:if test="${empty tinfolist}"> <!-- 판매중인 상품이 없을경우  -->
								<td colspan="5">입찰자가 없습니다.</td>
							</c:if>
							<%-- <c:if test="${!empty tinfolist}"> <!-- 판매중인 상품이 없을경우  -->
								<td>입찰자가 없습니다.</td>
							</c:if> --%>
							<c:forEach var="tinfolist" items="${tinfolist }">
							<tr>
								<td class="bidid">
								<img src="http://pics.auction.co.kr/itempage/icn_in.gif" alt="" />
								<c:set var="id" value="${tinfolist.buyer_id } "/>
								<c:set var="asterisk" value="*"/>
								<c:forEach begin="1" end="${fn:length(id) / 2 }">
   								<c:set var="tenderid" value="${tenderid}${asterisk}" />
								</c:forEach>
								${fn:substring(id, 0, (fn:length(id) / 2))}${tenderid }
								<c:set var="tenderid" value="" />
								</td>
								<td><fmt:formatDate value="${tinfolist.tender_time }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><fmt:formatNumber value="${tinfolist.tender_price }" type="number"/>원</td>
								<td>${tinfolist.count } <!-- 적은 수량 입찰 허용 --> 개
								</td>
								<td>1 개</td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<!-- Bidder List //-->
			</div>
			<!-- CONTENTS //-->
		</div>
		<!-- 탑 15px, 좌우 5px영역 //-->
	</div>
	<hr>
	<!-- 하단 버튼 -->
	<div class="tinfo_bottombutton" id="bottombutton">
		<img src="images/btn_close.gif" alt="창닫기"	onclick="self.close();" style="cursor: hand;">
	</div>
	<!-- 하단 버튼 //-->
</body>
</html>