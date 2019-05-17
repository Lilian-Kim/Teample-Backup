<%@page import="Engine.ThreadEndTimeCheck"%>
<%@ page import="java.util.List"%>
<%@ page import="Product.TableModel.Productbean"%>
<%@ page import="Product.TableModel.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	List<Productbean> plist = ThreadEndTimeCheck.getProductList();
%>
<style>
.article_banner {
	text-align: center;
}
</style>
<script src="js/jssor.slider-22.1.9.mini.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var jssor_1_options = {
			$AutoPlay : true,
			$AutoPlaySteps : 1,
			$SlideDuration : 1500,
			$SlideWidth : 398,
			$SlideHeight : 500,
			$SlideSpacing : 3,
			$Cols : 4,
			$ArrowNavigatorOptions : {
				$Class : $JssorArrowNavigator$,
				$Steps : 1
			},
			$BulletNavigatorOptions : {
				$Class : $JssorBulletNavigator$,
				$SpacingX : 1,
				$SpacingY : 1
			}
		};

		var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

		/*responsive code begin*/
		/*you can remove responsive code if you don't want the slider scales while window resizing*/
		function ScaleSlider() {
			var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
			if (refSize) {
				refSize = Math.min(refSize, 1200);
				jssor_1_slider.$ScaleWidth(refSize);
			} else {
				window.setTimeout(ScaleSlider, 1000);
			}
		}
		ScaleSlider();
		$(window).bind("load", ScaleSlider);
		$(window).bind("resize", ScaleSlider);
		$(window).bind("orientationchange", ScaleSlider);
		/*responsive code end*/
	});
</script>

<div class="article">
	<div class="jssor_1" id="jssor_1">
		<div class="main_goods" data-u="slides">
			<c:set var="commissionlist" value="<%=plist%>" />
			<c:forEach var="clist" items="${commissionlist }">
				<c:if test="${clist.commission >= 5}">
					<!-- 수수료가 5% 일때 -->
					<%-- 			    <a href="./ProductDetail.pro?product_no=${clist.product_no }">  --%>
					<div class="imgsl_wr">
						<c:if test="${clist.product_mainimg eq null}">
							<a href="./ProductDetail.pro?product_no=${clist.product_no }">
								<div>
									<img data-u="image" src="http://placehold.it/400x400" />
								</div> <!--                		<p>ffffff</p> -->
							</a>
						</c:if>
						<c:if test="${clist.product_mainimg ne null}">
							<a href="./ProductDetail.pro?product_no=${clist.product_no }">
								<div>
									<img data-u="image"
										src="./product_images_slide/${clist.product_mainimg }" />
								</div>
							</a>
							<p class="imgsl_wr_p">
								<a href="./ProductDetail.pro?product_no=${clist.product_no }">
									<span class="wr_p_name">${clist.product_name }</span> <br>
									현재가 <span class="wr_p_price"><fmt:formatNumber
											value="${clist.price_end }" type="number" />원</span>
								</a>
							</p>
						</c:if>
					</div>
					<!--imgsl_wr-->
					<!--        		</a>  -->
				</c:if>
			</c:forEach>
		</div>
		<!-- 메인굿즈 끝 -->

		<!-- Bullet Navigator -->
		<!--  <div data-u="navigator" class="jssorb03" >
            bullet navigator item prototype
            <div  data-u="prototype" >
                <div data-u="numbertemplate"></div>
            </div>
        </div> -->
		<!-- Arrow Navigator -->
		<span data-u="arrowleft" class="jssora03l" data-autocenter="2"></span>
		<span data-u="arrowright" class="jssora03r" data-autocenter="2"></span>
	</div>
	<!-- #endregion Jssor Slider End -->

	<!-- 허리 배너 -->
	<div class="article_banner">
		<a href="#"><img class="ab_1" alt="카테고리 배너"
			src="images/banner2.png"></a> <a href="#"><img alt="카테고리 배너"
			src="images/banner.png"></a>
	</div>
	<!-- 허리 배너 -->
	<div class="sub_goods1">
		<div class="goods_tab">
			<input type="radio" name="tab" id="aa" checked="checked"> <input
				type="radio" name="tab" id="bb"> <input type="radio"
				name="tab" id="cc">
			<section>
				<label for="aa">Recommend Product</label> <label for="bb">New
					Product</label> <label for="cc">MD's pick</label>
			</section>
			<div class="goods_list">
				<ul class="aa">
					<c:set var="plist" value="<%=plist%>" />
					<c:forEach var="list" items="${plist }">
						<li>
							<div>
								<c:if test="${list.product_mainimg eq null}">
									<a href="./ProductDetail.pro?product_no=${list.product_no }">
										<img src="http://placehold.it/325x300">
									</a>
								</c:if>
								<c:if test="${list.product_mainimg ne null}">
									<a href="./ProductDetail.pro?product_no=${list.product_no }">
										<img src="./product_images_list/${list.product_mainimg }">
									</a>
								</c:if>
							</div>
							<h5>
								<a href="./ProductDetail.pro?product_no=${list.product_no }">${list.product_name }</a>
							</h5>
							<p>
								<a href="./ProductDetail.pro?product_no=${list.product_no }">현재가
									<span class="aa_span1"><fmt:formatNumber
											value="${list.price_action }" type="number" />원</span>
								</a>
							</p>
							<p>
								<a href="./ProductDetail.pro?product_no=${list.product_no }"><img
									src="images/product_icon1.png"> 종료시간 <span
									class="aa_span2"><fmt:formatDate value="${list.e_time }"
											type="both" pattern="MM/dd HH:mm" /></span></a>
							</p>
						</li>
					</c:forEach>
				</ul>
				<!-- 1번째 탭:aa  끝-->

				<!-- 2번째 탭:bb  시작-->
				<ul class="bb">
					<li>
						<!-- 1번째 줄 -->
						<div>
							<a href="#"><img src="http://placehold.it/325x300"></a>
						</div>
						<h5>
							<a href="#">상품이름</a>
						</h5>
						<p>
							<a href="#">상품가격</a>
						</p>
					</li>
					<!-- 1번째 줄 -->
					<li>
						<!-- 2번째 줄 -->
						<div>
							<a href="#"><img src="http://placehold.it/325x300"></a>
						</div>
						<h5>
							<a href="#">상품이름</a>
						</h5>
						<p>
							<a href="#">상품가격</a>
						</p>
					</li>
					<!-- 2번째 줄 -->
					<li>
						<!-- 3번째 줄 -->
						<div>
							<a href="#"><img src="http://placehold.it/325x300"></a>
						</div>
						<h5>
							<a href="#">상품이름</a>
						</h5>
						<p>
							<a href="#">상품가격</a>
						</p>
					</li>
					<!-- 3번째 줄 -->

					<li>
						<!-- 4번째 줄 -->
						<div>
							<a href="#"><img src="http://placehold.it/325x300"></a>
						</div>
						<h5>
							<a href="#">상품이름</a>
						</h5>
						<p>
							<a href="#">상품가격</a>
						</p>
					</li>
					<!-- 4번째 줄 -->
					<li>
						<!-- 5번째 줄 -->
						<div>
							<a href="#"><img src="http://placehold.it/325x300"></a>
						</div>
						<h5>
							<a href="#">상품이름</a>
						</h5>
						<p>
							<a href="#">상품가격</a>
						</p>
					</li>
					<!-- 5번째 줄 -->

				</ul>
				<!-- 2번째 탭:bb  끝-->

				<!-- 3번째 탭:cc  시작-->
				<ul class="cc">
					<li>
						<!-- 1번째 줄 -->
						<div>
							<a href="#"><img src="http://placehold.it/325x300"></a>
						</div>
						<h5>
							<a href="#">상품이름</a>
						</h5>
						<p>
							<a href="#">상품가격</a>
						</p>
					</li>
					<!-- 1번째 줄 -->
					<li>
						<!-- 2번째 줄 -->
						<div>
							<a href="#"><img src="http://placehold.it/325x300"></a>
						</div>
						<h5>
							<a href="#">상품이름</a>
						</h5>
						<p>
							<a href="#">상품가격</a>
						</p>
					</li>
					<!-- 2번째 줄 -->
					<li>
						<!-- 3번째 줄 -->
						<div>
							<a href="#"><img src="http://placehold.it/325x300"></a>
						</div>
						<h5>
							<a href="#">상품이름</a>
						</h5>
						<p>
							<a href="#">상품가격</a>
						</p>
					</li>
					<!-- 3번째 줄 -->

					<li>
						<!-- 4번째 줄 -->
						<div>
							<a href="#"><img src="http://placehold.it/325x300"></a>
						</div>
						<h5>
							<a href="#">상품이름</a>
						</h5>
						<p>
							<a href="#">상품가격</a>
						</p>
					</li>
					<!-- 4번째 줄 -->

				</ul>
				<!-- 3번째 탭:cc  끝-->
			</div>
		</div>
		<!-- 굿즈탭 끝 -->
	</div>
	<!-- 서브굿즈 끝 -->

</div>
<!-- article 끝 -->



