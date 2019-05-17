<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>당신이 찾는 모든 스타일, 자투리</title>
<link rel="stylesheet" type="text/css" href="css/b.css" />
<script>
	function viewColse() {
		opener.parent.location.href ='./ProductDetail.pro?product_no='+'${pbean.product_no }';
		self.close()
	}
</script>
</head>
<body>
	<form method="post" action="./BidList.aspx?itemno=B015688552&amp;return_value=0" id="Form1">
		<!-- body -->
		<div id="body" class="withname">
			<hr>
			<!-- 탑 15px, 좌우 5px영역 -->
			<div class="pt_pop" id="maxzone" >
				<!-- CONTENTS -->
				<div id="contents">
					<!--ReturnValue==0-->
					<div id="panBidMsg">
						<div class="ac">
							<img alt="입찰되었습니다!" src="images/txt_bid.gif" >
						</div>

						<div class="bid_text1">
							이 후 경매진행 사항은 <a href="javascript:window.open('http://escrow.auction.co.kr/common/Auctioninprogress.aspx').focus();">
								<span class="org">'마이페이지 > 입찰중인 상품'</span></a>에서 확인하세요.
						</div>
					
							<div class="mid">
								<p>회원님의 입찰가격이 낙찰범위를 벗어날 경우 안내메시지를 받아보시겠습니까?</p>
								<div class="gray">
									다음 중 원하시는 메시지 <b>수신방법</b>을 선택해 주세요.
								</div>
								<div class="mid_img">
								<a href="javascript:openOutbidNotice('1', 'B015688552');">
								<img src="http://pics.auction.co.kr/popup/btn_bid_mail.gif" alt="메일"></a>
								<a href="javascript:openOutbidNotice('2', 'B015688552');">
								<img src="http://pics.auction.co.kr/popup/btn_bid_message.gif" alt="휴대폰 문자메시지"></a> 
								<a href="javascript:openOutbidNotice('3', 'B015688552');">
								<img src="http://pics.auction.co.kr/popup/btn_bid_mailmessage.gif" alt="메일+휴대폰 문자메시지"></a>
								</div>							
							</div>
						
						<!-- 버튼 -->
						<div class="ac mtxxs_btn">
							<img class="" alt="관심상품등록" src="images/btn_wishlist.gif"
								onclick="FavoriteItem.OpenSingleRegist(this,'B015688552','4410', 'http://sell3.auction.co.kr');"
								style="cursor: hand;">&nbsp; 
							<img class="" src="images/btn_bid_close.gif" alt="닫기"
								style="cursor: hand;" onclick="viewColse();">
						</div>
						<!-- 버튼 //-->
					</div>
					<!--panBidMessage-->

					<!-- 경매정보 -->
					<div class="bid_div">
						<h2>입찰 상품</h2>
						<div class="mtxxs">
							<table cellpadding="0" cellspacing="0" class="bid_tbl3">
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
					</div><!-- bid_di 끝 -->
		
					<div>
						<!-- <div class="bid_text2">
							구분 : <span class="org">● 낙찰자</span> <span class="blue">● 낙찰가능자</span>
						</div> -->
						<div class="scrollybase bidscroll mtxxs2" >
					
							<table class="bid_tbl4">
								<tr>
									<th>입찰자 ID</th>
									<th>입찰일자</th>
									<th>입찰가격</th>
									<th>수량</th>
									<th>누적수량</th>
								</tr>
								<!-- v3 -->
								<tr>
									<td class="bidid">
									<img src="http://pics.auction.co.kr/itempage/icn_in.gif" alt="" />
									<c:set var="id" value="${id } "/>
									<c:set var="asterisk" value="*"/>
									<c:forEach begin="1" end="${fn:length(id) / 2 }">
   									<c:set var="tenderid" value="${tenderid}${asterisk}"/>
									</c:forEach>
									${fn:substring(id, 0, (fn:length(id) / 2))}${tenderid }
									<c:set var="tenderid" value=""/>
									</td>
									<td><fmt:formatDate value="${tbean.tender_time }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td><fmt:formatNumber value="${tbean.tender_price }" type="number"/> 원</td>
									<td>1 <!-- 적은 수량 입찰 허용 --> 개
									</td>
									<td>1 개</td>
								</tr>
							</table>
						</div>
					</div>
					<!-- Bidder List //-->
					<!-- 페이징 -->
					<!-- <div>
						<div class="paging">
							<img src='http://pics.auction.co.kr/buy/pageblank.gif' width='3' height='10'>
						</div>
					</div> -->
					<!-- 페이징 //-->
					
				</div><!-- CONTENTS //-->
			</div>
			<!-- 탑 15px, 좌우 5px영역 //-->
		</div>
		<!-- body //-->
	</form>
	<hr>

	<!-- 하단 버튼 -->
	<div class="tview_bottombutton" id="bottombutton">
		<img src="images/btn_close.gif" alt="창닫기"	onclick="viewColse();" style="cursor: hand;">
	</div>
	<!-- 하단 버튼 //-->

</body>
</html>