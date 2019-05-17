<%@page import="ProductBoard.TableModel.ProductBoardbean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="css/a.css" />
<link rel="stylesheet" type="text/css" href="css/magnify.css" />
<jsp:useBean id="toDay" class="java.util.Date" />
<script>
	$(function() {
		setTimeout(startTime, 500);
	});
	
	function startTime() {
        var now = new Date();
        var end = new Date('${pbean.e_time }');
        var gap = Math.round((end - now.getTime()) / 1000);
        var D = Math.floor(gap / 86400);
        var H = Math.floor((gap - D * 86400) / 3600 % 3600);
        var M = Math.floor((gap - H * 3600) / 60 % 60);
        var S = Math.floor((gap - M * 60) % 60);
        if (now > end) {
        	return;
        }
        if(D <= 0) {
        	document.getElementById('clock').innerHTML = H + '시간 ' + M + '분 ' + S + '초';
        } else if(D <= 0 && H <= 0) {
        	document.getElementById('clock').innerHTML = M + '분 ' + S + '초';
        } else if(D <= 0 && H <= 0 && M <= 0) {
        	document.getElementById('clock').innerHTML = S + '초';
        } else {
            document.getElementById('clock').innerHTML = D + '일 ' + H + '시간 ' + M + '분 ' + S + '초';
        }
        setTimeout(startTime, 500);
	}
</script>

<script>
	function tenderPopup() {
		if('${id}' == "") {
			alert("로그인후 이용가능합니다.");
			location.href='./MemberLogin.me'
			return false;
		} else {
			if('${mbean.seller_no}' == '${pbean.seller_no}') {
				alert("판매자는 입찰할수 없습니다.");
				return false;
			}
		}
		window.open("./ProductTender.pro", "입찰하기", "width=560, height=600");
	}
</script>

<script>
	function tenderinfoPopup(product_no) {
		if('${id}' == "") {
			alert("로그인후 이용가능합니다.");
			location.href='./MemberLogin.me'
			return false;
		}
		window.open("./ProductTenderInfo.pro?product_no=" + product_no, "경매기록", "width=600, height=600");
	}
</script>

<!-- 확대보기 스크립트 -->
<script src="js/jquery.magnify.js"></script>
<script>
	function zoom() {
		$('.magnify-image').magnify();
		// 우선 온오프 효과는 사용하지 않음
/* 		var ischeck = document.getElementById('zoomvalue').value;
		if(ischeck % 2 == 0) {
			$('.magnify-image').magnify();
		} else {
			location.reload();
		}
		ischeck++;
		document.getElementById('zoomvalue').value = ischeck; */
	}
</script>

<script type="text/javascript">
	function winopen() {
		var search = '${pbean.search_keyword}';
		window.open("product/search_p.jsp?str="+search, "검색목록", "width=620, heigh=800");
	}
</script>


<!-- article 시작 -->
<div class="article">
	<div class="productwrap">
		<div class="product1">
			<div>
				<ul>
					<li><a href="#">홈</a></li>
					<li>></li>
					<li><a href="#">카테고리</a></li>
				</ul>
			</div>
		</div>
		<!-- product1끝 -->

		<div class="product2">
			<div class="img_02">
				<div class="img1" >
					<img src="./product_images_detail/${pbean.product_mainimg }" class="magnify-image" data-magnify-src="./product_images/${pbean.product_mainimg }">
				</div>
				<div></div>
				<!-- img1 -->
				<!-- <div class="img_sl">
					<img src="http://place-hold.it/430x70">
				</div> -->
				
				<div class="img_nxt">
					<span><img src="images/btn_product_prev.gif"></span> 
					<span><img src="images/btn_product_zoom.gif" onclick="zoom();"></span>
					<input type="hidden" id="zoomvalue" value="2">
					<span><img src="images/btn_product_next.gif"></span>
				</div>
			</div>
			<!-- img_02끝 -->

			<div class="tb_02">
				<h4>${pbean.product_name }</h4>
				<%-- <h4>검색 키워드 : ${pbean.search_keyword}</h4> --%>
				<p>상품번호 : ${pbean.product_no }</p>
				<table class="pd_tb">
					<tr>
						<td>현재가</td>
						<td>
						<span><fmt:formatNumber value="${pbean.price_end }" type="number"/>원
						</span> &nbsp; (시작가
						<span><fmt:formatNumber value="${pbean.price_action }" type="number"/>원
						</span>)</td>
					</tr>
					<tr>
						<td>즉시 구매가</td>
						<td class="pr_pit"><span><fmt:formatNumber value="${pbean.price_promptly }" type="number"/></span>원</td>
					</tr>
					<tr>
						<td>입찰 수</td>
						<td>${fn:length(protenderlist)}회 (총 판매수량 : 1개) &nbsp;&nbsp;&nbsp;&nbsp;<a class="t_list_link" onclick="tenderinfoPopup('${pbean.product_no }');">경매기록</a></td>
					</tr>
					<tr>
						<td>남은시간</td>
						<td>
						<div id="clock"></div>
						<c:if test="${toDay < pbean.e_time }">
						(종료 : <fmt:formatDate value="${pbean.e_time }" type="both" pattern="yyyy-MM-dd a HH:mm:ss"/>)
						</c:if>
						<c:if test="${toDay > pbean.e_time }">
						입찰 시간이 종료된 상품입니다.
						</c:if>
						</td>
					</tr>
					<!-- <tr>
						<td>내용5</td>
						<td>내용5내용5</td>
					</tr>
					<tr>
						<td>내용6</td>
						<td>내용6내용6</td>
					</tr>
					<tr>
						<td colspan="2">내용7</td>
					</tr>
					<tr>
						<td colspan="2">내용8</td>
					</tr> -->

				</table>
				<div class="pd_btn">
					<c:if test="${toDay < pbean.e_time }">
					<input type="button" value="입찰하기" onclick="tenderPopup();"> 
					</c:if>
					<c:if test="${toDay > pbean.e_time }">
					<input type="button" value="입찰종료"> 
					</c:if>
					<input type="button" value="구매하기"> 
					<form  name="wishlist" method="post" action="./ProductWishlistAction.pro">			           
						<input type="hidden"  name="product_no" value="${pbean.product_no }">
						<input type="hidden"  name="product_name" value="${pbean.product_name }">   
						<input type="hidden"  name="e_time" value="${pbean.e_time }">   
						<input type="hidden"  name="state" value="${pbean.state }">							           
						<input type="submit" value="관심상품등록">
					</form>
					<input type="button" value="상품검색" onclick="winopen();" />
				</div>
			</div>
			<!-- tb_02끝 -->
		</div>
		<!-- product2끝 -->
		
		<div class="product3">
			<div class="li_03">
				<ul>
					<li>상품상세정보</li>
					<li>상품구매안내</li>
					<li>상품사용후기</li>
					<li>상품Q&A</li>
					<li>관련상품</li>
				</ul>
			</div>
			<div class="txt_03">
				<h2>Detail Information</h2>
				<p>상품의 상세정보를 안내드립니다.</p>
			</div>
			${pbean.product_contend }
		</div>
		<!-- product3끝 -->
		
		<div class="product4">
			<div class="li_04">
				<ul>
					<li>상품상세정보</li>
					<li>상품구매안내</li>
					<li>상품사용후기</li>
					<li>상품Q&A</li>
					<li>관련상품</li>
				</ul>
			</div>
			<div class="txt_04">
				<h2>GUIDE</h2>
				<p>상품구매시 참고하서야 할 사항들을 안내드립니다.</p>
			</div>
			<div class="tb_04">
				<table>
					<tr>
						<td>안내사항1</td>
						<td>안내사항 내용들</br> 안내사항 내용들</br> 안내사항 내용들</br> 안내사항 내용들</br> 안내사항 내용들</br> 안내사항 내용들</br>
						</td>
					</tr>
					<tr>
						<td>안내사항2
						</td>
						<td>안내사항 내용들</br> 안내사항 내용들</br> 안내사항 내용들</br> 안내사항 내용들</br> 안내사항 내용들</br> 안내사항 내용들</br>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- product4끝 -->
		
		<div class="product5">
			<div class="li_05">
				<ul>
					<li>상품상세정보</li>
					<li>상품구매안내</li>
					<li>상품사용후기</li>
					<li>상품Q&A</li>
					<li>관련상품</li>
				</ul>
			</div>
			<div class="txt_05">
				<h2>PRODUCT Q&A</h2>
				<p>상품에 대해 궁금한 점을 해결해 드립니다.</p>
			</div>
			
			<!-- 판매자 게시판  시작-->
			
			<c:if test="${id ne null }">
				<div class="p_05">
					<c:if test="${empty pboardList}">
						<!-- 판매중인 상품이 없을경우  -->
						<p>게시물이 없습니다.</p>
					</c:if>
					<c:if test="${!empty pboardList}">
						<!-- 판매중인 상품이 없을경우  -->
						<table border="0">
							<tr>
								<td>작성일</td>
								<td>제목</td>
								<td>작성자</td>
								<td>내용</td>
							</tr>
							<c:forEach var="pblist" items="${pboardList }">
								<c:if test="${(pblist.product_no==pbean.product_no)&&(pbean.seller_no==mbean.seller_no)}">
									<tr>
										<td><a href="./ProducctBoardContentAction.pbo?num=${pblist.num }">${pblist.date }</a></td>
										<td><a href="./ProducctBoardContentAction.pbo?num=${pblist.num }">${pblist.subject }</a></td>
										<td><a href="./ProducctBoardContentAction.pbo?num=${pblist.num }">${pblist.id }</a></td>
										<td><a href="./ProducctBoardContentAction.pbo?num=${pblist.num }">${pblist.content }</a></td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</c:if>
				</div>
				<!-- 판매자 게시판  끝-->
			<div class="img_05">
				<div class="btimg1">
					<a href="./ProductBoardWrite.pbo">
						<img src="images/btn_board_write2.gif">
					</a>
				</div>
				<div class="btimg2">
					<img src="images/btn_board_more.gif">
				</div>
			</div>
			</c:if>
			<c:if test="${id eq null }">
				<div class="p_05">
					<p>로그인후 이용가능합니다.</p>
				</div> 
			</c:if>
		</div>
		<!-- product5끝 -->
	</div>
	<!-- productwrap 끝 -->
</div>
<!-- article 끝 -->