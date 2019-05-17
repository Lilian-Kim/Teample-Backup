<%@ page import="Member.TableModel.Memberbean"%>
<%@ page import="Member.TableModel.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="./images/jaturipa.png">
<title>생활중고 경매의 모든것!! 자투리</title>
<link rel="stylesheet" type="text/css" href="css/a.css" />

<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="js/jqsimplemenu.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.menu').jqsimplemenu();
	});
</script>
<!-- 헤더 검색부분 -장군 -->
<script type="text/javascript">
	function search() {
		var searchInput = document.getElementById("searchInput").value;
		if (searchInput != null && searchInput != "") {
			/* alert(searchInput); */
			document.getElementById('searchForm').submit();
		}
	}
</script>
<!-- 헤더 검색부분 -장군 -->

</head>


<!-- BODY 시작 -->
<body>

	<div class="wrap">
		<!-- header 시작 -->
		<header class="header">
			<div class="header_menu">
				<%
					String id = (String) session.getAttribute("id");
					if (id == null) {
				%>
				<a href="./MemberLogin.me">로그인</a> <a href="./MemberJoin.me">회원가입</a>
				<a href="./MemberLogin.me">찜한상품</a>
				<!-- <a href="#">ORDER</a>  -->
				<a href="./MemberLogin.me">마이페이지</a> <a href="./MemberLogin.me">판매하기</a>
				<%
					} else {
						MemberDAO mdao = new MemberDAO();
						Memberbean mbean = mdao.userInfo(id);
						String name = mbean.getName();
				%>
				<%
					switch (mbean.getGrade()) {
						case 0:
				%><span class="grade_logo1"><img
					src="./images/grade0txt.png"></span>
				<%
					;
							break;
						case 1:
				%><span class="grade_logo2"><img
					src="./images/grade1txt.png"></span>
				<%
					;
							break;
						case 2:
				%><span class="grade_logo3"><img
					src="./images/grade2txt.png"></span>
				<%
					;
							break;
						case 3:
				%><span class="grade_logo4"><img
					src="./images/grade3txt.png"></span>
				<%
					;
							break;
						case 4:
				%><span class="grade_logo5"><img
					src="./images/grade4txt.png"></span>
				<%
					;
							break;
						case 5:
				%><span class="grade_logo6"><img
					src="./images/grade5txt.png"></span>
				<%
					;
							break;
						}
				%>
				<span><%=name%>님</span> <a href="./MemberLogout.me">로그아웃</a> <a
					href="./ProductWishlistView.pro">찜한상품</a>
				<!-- <a href="#">ORDER</a>  -->
				<a href="./SellCompletedAction.tra">마이페이지</a> <a
					href="./ProductReg.pro">판매하기</a>
				<%
					}
				%>
			</div>

			<div class="logo_img">
				<a href="index.jsp"><img src="images/logo_img_3.png"></a>
			</div>
			<div class="search">
				<form action="./ProductSearchListAction.pro" method="post"
					name="searchForm" id="searchForm">
					<div class="search_text">
						<input type="text" id="searchInput" name="searchInput"
							onkeydown="if(event.keycode ==13)search();">
						<!-- 검색하기 버튼 -장군 -->
					</div>
					<div class="search_btn">
						<!-- 검색하기 버튼 -장군 -->
						<input type="submit" class="search_btn2" value=""
							onclick="search();" />
					</div>
				</form>
			</div>
			<!-- logo 끝-->



			<div class="category">
				<ul class="menu">
					<!-- 첫번쨰 카테고리 시작-->
					<li><a href="./ProductCategoryList.pro?maincate=1">패션/뷰티/잡화</a>
						<ul>
							<li><a href="./ProductCategoryList.pro?maincate=1&subcate=1">의류</a>
								<ul>
									<li><a
										href="./ProductCategoryList.pro?maincate=1&subcate=1&category=1">여성의류</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=1&subcate=1&category=2">남성의류</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=1&subcate=1&category=3">캐쥬얼의류</a></li>
								</ul></li>
							<li><a href="./ProductCategoryList.pro?maincate=1&subcate=2">뷰티</a>
								<ul>
									<li><a
										href="./ProductCategoryList.pro?maincate=1&subcate=2&category=4">화장품/향수</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=1&subcate=2&category=5">바디/헤어</a></li>

								</ul></li>
							<li><a href="./ProductCategoryList.pro?maincate=1&subcate=3">잡화</a>
								<ul>
									<li><a
										href="./ProductCategoryList.pro?maincate=1&subcate=3&category=6">신발</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=1&subcate=3&category=7">가방/패션잡화</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=1&subcate=3&category=8">쥬얼리/시계/선글라스</a></li>
								</ul></li>
						</ul></li>
					<!-- 첫번쨰 카테고리 끝-->
					<!-- 두번째 카테고리 시작-->
					<li><a href="./ProductCategoryList.pro?maincate=2">가구/생활/유아</a>
						<ul>
							<li><a href="./ProductCategoryList.pro?maincate=2&subcate=1">가구/침구/수납</a>
								<ul>
									<li><a
										href="./ProductCategoryList.pro?maincate=2&subcate=1&category=9">가구/DIY</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=2&subcate=1&category=10">조명/인테리어</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=2&subcate=1&category=11">생활/욕실/수납용품</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=2&subcate=1&category=12">주방용품</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=2&subcate=1&category=13">침구/커튼</a></li>
								</ul></li>
							<li><a href="./ProductCategoryList.pro?maincate=2&subcate=2">생활/취미</a>
								<ul>
									<li><a
										href="./ProductCategoryList.pro?maincate=2&subcate=2&category=14">건강/의료용품</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=2&subcate=2&category=15">반려동물용품</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=2&subcate=2&category=16">악기/취미/키덜트</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=2&subcate=2&category=17">디자인/문구/사무용품</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=2&subcate=2&category=18">꽃/이벤트용품</a></li>
								</ul></li>
							<li><a href="./ProductCategoryList.pro?maincate=2&subcate=3">유아용품</a>
								<ul>
									<li><a
										href="./ProductCategoryList.pro?maincate=2&subcate=3&category=19">기저귀/분유/유아식</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=2&subcate=3&category=20">출산/유아용품/임부복</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=2&subcate=3&category=21">장난감/교육완구/인형</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=2&subcate=3&category=22">유아동의류</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=2&subcate=3&category=23">유아동신발/가방/잡화</a></li>
								</ul></li>
						</ul></li>
					<!-- 두번쨰 카테고리 끝-->
					<!-- 세번째 카테고리 시작 -->
					<li><a href="./ProductCategoryList.pro?maincate=3">가전/디지털/컴퓨터</a>
						<ul>
							<li><a href="./ProductCategoryList.pro?maincate=3&subcate=1">가전</a>
								<ul>
									<li><a
										href="./ProductCategoryList.pro?maincate=3&subcate=1&category=24">대형가전</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=3&subcate=1&category=25">계절가전</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=3&subcate=1&category=26">주방가전</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=3&subcate=1&category=27">생활/미용가전</a></li>
								</ul></li>
							<li><a href="./ProductCategoryList.pro?maincate=3&subcate=2">디지털</a>
								<ul>
									<li><a
										href="./ProductCategoryList.pro?maincate=3&subcate=2&category=28">카메라</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=3&subcate=2&category=39">음향기기</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=3&subcate=2&category=30">게임</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=3&subcate=2&category=31">휴대폰</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=3&subcate=2&category=32">태블릿</a></li>
								</ul></li>
							<li><a href="./ProductCategoryList.pro?maincate=3&subcate=3">컴퓨터</a>
								<ul>
									<li><a
										href="./ProductCategoryList.pro?maincate=3&subcate=3&category=33">노트북/PC</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=3&subcate=3&category=34">모니터/프린터</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=3&subcate=3&category=35">PC주변기기</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=3&subcate=3&category=36">저장장치</a></li>
								</ul></li>
						</ul></li>
					<!-- 세번쨰 카테고리 끝-->
					<!-- 네번째 카테고리 시작 -->
					<li><a href="./ProductCategoryList.pro?maincate=4">스포츠/자동차/공구</a>
						<ul>
							<li><a href="./ProductCategoryList.pro?maincate=4&subcate=1">스포츠/레저</a>
								<ul>
									<li><a
										href="./ProductCategoryList.pro?maincate=4&subcate=1&category=37">휘트니스/수영</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=4&subcate=1&category=38">스포츠의류/운동화</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=4&subcate=1&category=39">골프클럽/의류/용품</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=4&subcate=1&category=40">등산/아웃도어</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=4&subcate=1&category=41">캠핑/낚시</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=4&subcate=1&category=42">구기/라켓</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=4&subcate=1&category=43">자전거/보드</a></li>
								</ul></li>
							<li><a href="./ProductCategoryList.pro?maincate=4&subcate=2">자동차/공구</a>
								<ul>
									<li><a
										href="./ProductCategoryList.pro?maincate=4&subcate=2&category=44">자동차용품/블랙박스</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=4&subcate=2&category=45">타이어/오일/부품</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=4&subcate=2&category=46">공구/안전/산업용품</a></li>
								</ul></li>
						</ul></li>
					<!-- 네번쨰 카테고리 끝-->
					<!-- 다섯번째 카테고리 시작 -->
					<li><a href="./ProductCategoryList.pro?maincate=5">도서/음반/DVD</a>
						<ul>
							<li><a href="./ProductCategoryList.pro?maincate=5&subcate=1">도서</a>
								<ul>
									<li><a
										href="./ProductCategoryList.pro?maincate=5&subcate=1&category=47">국내도서</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=5&subcate=1&category=48">해외도서</a></li>
								</ul></li>
							<li><a href="./ProductCategoryList.pro?maincate=5&subcate=2">음반</a>
								<ul>
									<li><a
										href="./ProductCategoryList.pro?maincate=5&subcate=2&category=49">국내음반</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=5&subcate=2&category=50">해외음반</a></li>
								</ul></li>
							<li><a href="./ProductCategoryList.pro?maincate=5&subcate=3">DVD/블루레이</a>
								<ul>
									<li><a
										href="./ProductCategoryList.pro?maincate=5&subcate=3&category=51">국내작품</a></li>
									<li><a
										href="./ProductCategoryList.pro?maincate=5&subcate=3&category=52">해외작품</a></li>
								</ul></li>
						</ul></li>
					<!-- 다섯번쨰 카테고리 끝-->
				</ul>
			</div>
			<!-- category -->

		</header>
		<!-- header끝 -->