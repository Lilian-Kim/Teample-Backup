<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>당신이 찾는 모든 스타일, 자투리</title>
<link rel="stylesheet" type="text/css" href="css/b.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
	$(function() {
	 	var tender_price = '${pbean.price_end +100 }';
/* 		$("#ctrlPrice").change(function() {
			if ($('#ctrlPrice').val() < tender_price) {
				alert("꼼수 부리지마라 안통한다.");
				$('#ctrlPrice').val(tender_price);
				return false;
			}
		}); */
	});
</script>
<script type="text/javascript">
	var theForm = document.forms['Form1'];
	function a() {
	    theForm.submit();
	}
</script>

<script type="text/javascript">

	function NumberBox() {
	}
	
	NumberBox.onKeyPress = function(sender, e) {
		var keyCode;

		if (window.event) {
			keyCode = e.keyCode;
		} else {
			keyCode = e.which; //firefox compatible
		}
		if (keyCode == 13 || keyCode == 27)
			return true; // esc, enter
		if (48 <= keyCode && keyCode <= 57)
			return true; // number
		alert("숫자만 입력하실 수 있습니다");
		sender.focus();
		sender.select();
		return false;
	}
</script>
</head>
<body>
	<form method="post" action="./ProductTenderComplete.pro" id="Form1">
		<input type="hidden" name="product_no" value="${pbean.product_no }">
		<!-- body -->
		<div id="body" class="withname">
			
			<hr>
			<!-- 탑 15px, 좌우 5px영역 -->
			<div id="maxzone" style="clear: both;">
				<!-- CONTENTS -->
				<div id="contents">
					<!-- 경매정보 -->
					<div>
						<h2 class="bid">입찰 상품</h2>
						<div class="mtxxs">
							<table cellpadding="0" cellspacing="0" class="bid_tbl1">
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
							</table><!-- table1 -->
						</div>
					</div>
					<!-- 경매정보 //-->
					<!-- 입찰하기 -->
					<div id="pnlBid">
						<h2 class="bid mt">입찰하기</h2>
						<div class="mtxxs">
							<table cellpadding="0" cellspacing="0" class="bid_tbl2">
								<tr>
									<th>현재가</th>
									<td>
									<span class="price">
									<fmt:formatNumber value="${pbean.price_end }" type="number"/>원
									</span>
									</td>
									<th>즉시구매가</th>
									<td>
									<span class="price2">
									<fmt:formatNumber value="${pbean.price_promptly }" type="number"/>원
									</span>
									</td>
								</tr>
								<tr>
									<th>입찰수량</th>
									<td colspan="3">
									<input id="ctrlQty" maxlength="2" size="10"	type="text" 
										name="ctrlQty" value="1" onkeypress="javascript: return NumberBox.onKeyPress(this, event)"
										style="text-align: Right; ime-mode: disabled;" /><b>개</b>
										<p class="fc mtxxs">
										(최대입찰수량 : 1개+총1개까지 입찰하실 수 있습니다.)
										</p>
									</td>
								</tr>
								<tr>
									<th>입찰금액</th>
									<td colspan="3">
									현재 
									<span class="price">
									<fmt:formatNumber value="${pbean.price_end + 100 }" type="number"/>원
									</span> 
									부터 입찰하실 수 있습니다.
									<input id="ctrlPrice" maxlength="10" size="10" class="txt ar" type="text"
										name="ctrlPrice" onkeypress="javascript: return NumberBox.onKeyPress(this, event)"
										style="text-align: Right; ime-mode: disabled;" value="${pbean.price_end + 100 }"/><b>원</b> 
										<p class="fc">
										( ","없이 100원 단위로 입력하세요.)
										</p>
									</td>
								</tr>
							</table><!-- table2 -->
						</div>
					</div>
					<!-- 입찰하기 //-->
					<div class="mtxs">
						<input type="image" name="buttonBid" id="buttonBid" alt="입찰하기" src="images/btn_bid.gif" onclick="eval(this.DisableImageButtonClick);" />
					</div>
					<div class="mt bid_p">
							<p>경매 낙찰 건을 주문 취소하시면 구매거부가 되어 경매 패널티가 1점 부여됩니다.</p>
							<p>최근 한 달 동안의 경매 패널티가 3점이 되면 한 달 동안 경매에 참여하시지 못합니다.</p>
					</div>
				</div>
				<!-- CONTENTS //-->
			</div>
			<!-- 탑 15px, 좌우 5px영역 //-->
		</div><!-- withname끝 -->
		<!-- body //-->
		<hr>
		<!-- 하단 버튼 -->
		<div class="bottombutton" id="bottombutton">
			<img src="images/btn_close.gif" alt="창닫기" onclick="self.close();" style="cursor: hand;">
		</div>
		<!-- 하단 버튼 //-->
	</form>
</body>
</html>
