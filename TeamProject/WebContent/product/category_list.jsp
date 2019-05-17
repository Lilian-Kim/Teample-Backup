
<%@page import="java.util.List"%>
<%@page import="Product.TableModel.Categorybean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="css/a.css" />
<jsp:useBean id="toDay" class="java.util.Date" />
<script type="text/javascript">
$(document).ready(function() {
    var xOffset = 10;
    var yOffset = 30;
    $(document).on("mouseover",".thumbnail",function(e){ //마우스 오버시
        $("body").append("<p id='preview'><img src='"+ $(this).attr("src") +"' width='200px' /></p>"); //보여줄 이미지를 선언                       
        $("#preview")
            .css("top",(e.pageY - xOffset) + "px")
            .css("left",(e.pageX + yOffset) + "px")
            .fadeIn("slow"); //미리보기 화면 설정 셋팅
    });
    $(document).on("mousemove",".thumbnail",function(e){ //마우스 이동시
        $("#preview")
            .css("top",(e.pageY - xOffset) + "px")
            .css("left",(e.pageX + yOffset) + "px");
    });
    $(document).on("mouseout",".thumbnail",function(){ //마우스 아웃시
        $("#preview").remove();
    });
      
});
</script>
<style>
/* 미리보기 스타일 셋팅 */
#preview {
	z-index: 9999;
	position: absolute;
	border: 0px solid #ccc;
	background: #333;
	padding: 1px;
	display: none;
	color: #fff;
}
</style>
<!-- article 시작 -->

<div class="article">
<div class="mypagewrap">
<!--mp1끝  여기까지 공통-->

		<!-- 여기부터 페이지마다 바뀜 -->
		<div class="mp5">
<!-- <div class="subcate_sale"></div> -->
			
			<!-- subcate_pur -->
			<div class="sale">
				<div class="sale1">
					<c:if test="${empty clist}">
						<!-- 판매중인 상품이 없을 때 -->
						<table class="sale_tb1">
							<caption>
							<c:if test="${cateaddr.sub2memo != null}"><a href="./ProductCategoryList.pro?maincate=${cateaddr.maincate }">${cateaddr.mainmemo }</a> <img src="./images/rightarrow.png" style="width:18px; height:18px;"> <a href="./ProductCategoryList.pro?maincate=${cateaddr.maincate }&subcate=${cateaddr.subcate }">${cateaddr.submemo }</a> <img src="./images/rightarrow.png" style="width:18px; height:18px;"> <a href="./ProductCategoryList.pro?maincate=${cateaddr.maincate }&subcate=${cateaddr.subcate }&category=${cateaddr.indexnum }">${cateaddr.sub2memo }</a></c:if>
							<c:if test="${cateaddr.sub2memo == null && cateaddr.submemo != null}"><a href="./ProductCategoryList.pro?maincate=${cateaddr.maincate }">${cateaddr.mainmemo }</a> <img src="./images/rightarrow.png" style="width:18px; height:18px;"> <a href="./ProductCategoryList.pro?maincate=${cateaddr.maincate }&subcate=${cateaddr.subcate }">${cateaddr.submemo }</a></c:if>
							<c:if test="${cateaddr.submemo == null}"><a href="./ProductCategoryList.pro?maincate=${cateaddr.maincate }">${cateaddr.mainmemo }</a></c:if>
							</caption>
							<tr>
								<td>등록일<br />(등록번호)
								</td>
								<td>상품명</td>
								<td>입찰상태</td>
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

					<c:if test="${!empty clist}">
						<!-- 판매중인 상품이 있을 때 -->
<!-- 						<div class="sale_btn">
						<input type="button" value="판매등록" onclick="location.href='./ProductReg.pro'">
						</div> -->
						<table class="sale_tb3">
							
							<caption>
							<c:if test="${cateaddr.sub2memo != null}"><a href="./ProductCategoryList.pro?maincate=${cateaddr.maincate }">${cateaddr.mainmemo }</a> <img src="./images/rightarrow.png" style="width:18px; height:18px;"> <a href="./ProductCategoryList.pro?maincate=${cateaddr.maincate }&subcate=${cateaddr.subcate }">${cateaddr.submemo }</a> <img src="./images/rightarrow.png" style="width:18px; height:18px;"> <a href="./ProductCategoryList.pro?maincate=${cateaddr.maincate }&subcate=${cateaddr.subcate }&category=${cateaddr.indexnum }">${cateaddr.sub2memo }</a></c:if>
							<c:if test="${cateaddr.sub2memo == null && cateaddr.submemo != null}"><a href="./ProductCategoryList.pro?maincate=${cateaddr.maincate }">${cateaddr.mainmemo }</a> <img src="./images/rightarrow.png" style="width:18px; height:18px;"> <a href="./ProductCategoryList.pro?maincate=${cateaddr.maincate }&subcate=${cateaddr.subcate }">${cateaddr.submemo }</a></c:if>
							<c:if test="${cateaddr.submemo == null}"><a href="./ProductCategoryList.pro?maincate=${cateaddr.maincate }">${cateaddr.mainmemo }</a></c:if>
							</caption>
							
							<tr>
								<td>등록일<br />(등록번호)
								</td>
								<td>상품명</td>
								<td>입찰상태</td>
								<td>판매자</td>
							</tr>
							
							<c:forEach var="list" items="${clist }" varStatus="status">
							<c:set var="tlist" value="${tendercount }"></c:set>
							<tr>
								<td><fmt:formatDate value="${list.s_time }" type="both" pattern="YYYY'년' M'월' d'일'"/><br/>
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
									<a></a>
								</td>
								<td>현재가 <fmt:formatNumber value="${list.price_end }" type="number"/> 원 <br>
								(즉시구매가 <fmt:formatNumber value="${list.price_promptly }" type="number"/> 원)<br><br>
								입찰수 ${tlist[status.index] } 회<br>
								<img src="images/product_icon1.png"> <font color="red"><fmt:formatDate value="${list.e_time }" type="both" pattern="MM/dd HH:mm"/></font> 마감
								<%-- (<fmt:formatDate value="${list.e_time }" type="both" pattern="M'월'd'일' H'시'mm'분'"/> 마감) --%>
								</td>
								<td onclick="window.open('./product/category_list_sellerinfo.jsp?seller_no='+${list.seller_no }, '판매자 정보', 'width=621,height=200');" >
								<c:if test="${list.grade == 0}"><img style="width:50px; height:50px;" src="./images/grade0.png"></c:if>
								<c:if test="${list.grade == 1}"><img style="width:50px; height:50px;" src="./images/grade1.png"></c:if>
								<c:if test="${list.grade == 2}"><img style="width:50px; height:50px;" src="./images/grade2.png"></c:if>
								<c:if test="${list.grade == 3}"><img style="width:50px; height:50px;" src="./images/grade3.png"></c:if>
								<c:if test="${list.grade == 4}"><img style="width:50px; height:50px;" src="./images/grade4.png"></c:if>
								<c:if test="${list.grade == 5}"><img style="width:50px; height:50px;" src="./images/grade5.png"></c:if>
								<br><a style="font-size: 15px; color:gray;">${list.name }</a></td>
							</tr>
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