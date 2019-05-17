<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>당신이 찾는 모든 스타일, 자투리</title>
<link rel="stylesheet" type="text/css" href="css/b.css" />

<script type="text/javascript">
	function resizeWindow(win) {
		var wid = win.document.body.offsetWidth + 16;
		var hei = win.document.body.offsetHeight + 67;
		win.resizeTo(wid, hei);
	}
</script>

<script type="text/javascript">
	function closepop() {
		opener.parent.location.href ='./ProductDetail.pro?product_no='+'${pbean.product_no }';
		self.close();
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
						<table cellpadding="0" cellspacing="0" class="bid_tblf">
							<tr>
								<th>상품명</th>
								<td>${pbean.product_name }</td>
							</tr>
							<tr>
								<th>경매마감일자</th>
								<td><fmt:formatDate value="${pbean.e_time }" type="both"
										pattern="yyyy-MM-dd a HH:mm:ss" /></td>
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
				<div class="fail_info">현재 입찰중인 상품입니다.</div>
				<div class="mt bid_p">
					<p>경매 낙찰 건을 주문 취소하시면 구매거부가 되어 경매 패널티가 1점 부여됩니다.</p>
					<p>최근 한 달 동안의 경매 패널티가 3점이 되면 한 달 동안 경매에 참여하시지 못합니다.</p>
				</div>
			</div>
			<!-- Bidder List //-->
		</div>
		<!-- CONTENTS //-->
	</div>
	<!-- 탑 15px, 좌우 5px영역 //-->
	<hr>
	<!-- 하단 버튼 -->
	<div class="finfo_bottombutton" id="bottombutton">
		<img src="images/btn_close.gif" alt="창닫기" onclick="closepop();" style="cursor: hand;">
	</div>
	<!-- 하단 버튼 //-->
</body>
</html>