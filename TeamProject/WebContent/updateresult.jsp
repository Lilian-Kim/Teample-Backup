<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	window.onload = function() {
		setTimeout(function() {
			location.href = "index.jsp";
		}, 5000);
	};
</script>
<!-- article 시작 -->
<div class="article">
	<div class="mypagewrap">
		<jsp:include page="./inc/article_mp1.jsp" />
		<!--mp1끝  여기까지 공통-->

		<!-- 여기부터 페이지마다 바뀜 -->
		<div class="mp8">
			<div class="subcate_info">
				<jsp:include page="./inc/subcate.jsp" />
			</div>
			<!-- subcate_info -->
			<div class="update_img">
				<div class="update_img1">
					<img src="images/MOve.gif">
				</div>
				<div class="update_img2">
					<img src="images/moving.png">
				</div>
			</div>
		</div>
	</div>
</div>