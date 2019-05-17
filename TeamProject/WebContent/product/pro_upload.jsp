<%@ page import="Member.TableModel.Memberbean"%>
<%@ page import="Member.TableModel.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDAO mdao = new MemberDAO();
	String id = (String) session.getAttribute("id");
	String name = null;
	int seller_no = 0;
	if (id != null) {
		Memberbean mbean = mdao.userInfo(id);
		name = mbean.getName();
		seller_no = mbean.getSeller_no();
	}
%>
<!-- <script type="text/javascript">
	//[] <--문자 범위 [^] <--부정 [0-9] <-- 숫자  
//[0-9] => \d , [^0-9] => \D
	var rgx1 = /\D/g; // /[^0-9]/g 와 같은 표현
	var rgx2 = /(\d+)(\d{3})/;
	function getNumber(obj) {
		var num01;
		var num02;
		num01 = obj.value;
		num02 = num01.replace(rgx1, "");
		num01 = setComma(num02);
		obj.value = num01;

	}

	function setComma(inNum) {
		var outNum;
		outNum = inNum;
		while (rgx2.test(outNum)) {
			outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
		}
		return outNum;

	}
</script> -->
<!-- article 시작 -->
<script type="text/javascript" src="./smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
	    //전역변수선언
	    var editor_object = [];
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: editor_object,
	        elPlaceHolder: "smarteditor",
	        sSkinURI: "smarteditor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : false,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true,
	        }
	    });
	    //전송버튼 클릭이벤트
	    $("#savebutton").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
	        // 이부분에 에디터 validation 검증
	        //폼 submit
	        $("#frm").submit();
	    })
	})
</script>
<!-- 미리보기를 위한 JQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#product_mainimg").on('change', function() {
			readURL(this);
		});
	});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#mainimg_ex').attr('src', e.target.result);
				$('#mainimg_ex').css('width', "325px");
				$('#mainimg_ex').css('height', "300px");
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

<script type="text/javascript">
	$(function() {
		var date = new Date();
		var nowYear = date.getFullYear();
		var nowMonth = date.getMonth() + 1;
		var nowDate = date.getDate();
		var nowDay = date.getDay();
		var nowHours = date.getHours();
		var nowMinutes = date.getMinutes();
		$('#s_year').val(nowYear);
		$('#s_month').val(nowMonth);
		$('#s_day').val(nowDate);
		$('#s_hour').val(nowHours);
		$('#s_minute').val(nowMinutes);
		// 여기까지 초기 페이지 로드시 현재 날짜 정보를 경매시작시간으로 설정한다.
		$('#r_3day').click(function() { // 3일 라디오 버튼 클릭시 현재 날짜에서 +3일 더한 정보를 경매 마감일자로 설정한다.
			$('#e_year').val(nowYear);
			$('#e_month').val(nowMonth);
			$('#e_day').val(nowDate + 3);
			$('#e_hour').val(nowHours);
			$('#e_minute').val(nowMinutes);
		});
		$('#r_5day').click(function() { // 5일 라디오 버튼 클릭시 현재 날짜에서 +5일 더한 정보를 경매 마감일자로 설정한다.
			$('#e_year').val(nowYear);
			$('#e_month').val(nowMonth);
			$('#e_day').val(nowDate + 5);
			$('#e_hour').val(nowHours);
			$('#e_minute').val(nowMinutes);
		});
		$('#r_7day').click(function() { // 7일 라디오 버튼 클릭시 현재 날짜에서 +7일 더한 정보를 경매 마감일자로 설정한다.
			$('#e_year').val(nowYear);
			$('#e_month').val(nowMonth);
			$('#e_day').val(nowDate + 7);
			$('#e_hour').val(nowHours);
			$('#e_minute').val(nowMinutes);
		});
		$('#end_option').val('0'); // 처음 로드시 체크박스 값이 체크되지 않은 상태로 val값을 0으로 지정 
		$('#endoption').click(function() { // 체크박스에서 이벤트가 일어났을시 val값 설정을 위한 이벤트
			if ($('#endoption').is(":checked")) { // 체크가 되었다면?
			    $('#end_option').val('1'); // val = 1  히든값으로 세팅
			} else { // 체크가 되지 않았다면?
			    $('#end_option').val('0'); // val = 2
			}
		});
	});
</script>
<!-- category popup 관련 jquery 시작-->
<script type="text/javascript">
	var date = new Date();
	var nowYear = date.getFullYear();
	var nowMonth = date.getMonth() + 1;
	var nowDate = date.getDate();
	var nowDay = date.getDay();
	var nowHours = date.getHours();
	var nowMinutes = date.getMinutes();
	$(function(){
		$("#s_year").change(function(){
			if($('#s_year').val() < nowYear) {
				alert("현재 년도 이전으로 설정할수 없습니다.");
				$('#s_year').val(nowYear);
			}
		});
		$("#s_month").change(function(){
			if($('#s_month').val() < nowMonth) {
				alert("현재 월 이전으로 설정할수 없습니다.");
				$('#s_month').val(nowMonth);
			}
		});
		$("#s_day").change(function(){
			if($('#s_day').val() < nowDate) {
				alert("현재 일 이전으로 설정할수 없습니다.");
				$('#s_day').val(nowDate);
			}
		});
		$("#s_hour").change(function(){
			if($('#s_hour').val() < nowHours) {
				alert("현재 시간 이전으로 설정할수 없습니다.");
				$('#s_hour').val(nowHours);
			}
		});
		$("#s_minute").change(function(){
			if($('#s_minute').val() < nowMinutes) {
				alert("현재 분 이전으로 설정할수 없습니다.");
				$('#s_minute').val(nowMinutes);
			}
		});
	});
</script>

<script src="http://code.jquery.com/jquery-1.7.js" type="text/javascript"></script>
<script src="js/jquery.bpopup.min.js"></script>
<script type="text/javascript">
var cate1;
var cate2;
var cate3;
var maincate;
var subcate;
var catenum;
var catetext;

$(document).ready(function() {
	$("#pro_popupButton1").click(function() {
		goPopUp1();
	});
})

var goPopUp1 = function() {
	$('#pro_popup1').bPopup();
}

$(function() {
	$(".b_li").css("cursor", "pointer");
	$(".m_ul").hide();
	$(".b_li").each(function(index) {
		$(this).click(function() {
			$(".m_ul").hide().eq(index).show();
			$(".s_ul").hide();
			cate1 = $(this).text();
			maincate = $(this).val();
			document.getElementById("catetextdisp").value = cate1;
		});
	});
});

$(function() {
	$(".m_li").css("cursor", "pointer");
	$(".s_ul").hide();
	$(".m_li").each(function(index) {
		$(this).click(function() {
			$(".s_ul").hide().eq(index).show();
			cate2 = $(this).text();
			cate12 = cate1 + " > " + cate2;
			subcate = $(this).val();
			document.getElementById("catetextdisp").value = cate12;
		});
	});

	$(".s_li").css("cursor", "pointer");
	/* $(".m_li").css("cursor","pointer"); */
	$(".s_li").click(function() {
		// 			$(this).css("background","orange")
		catenum = $(this).val();
		cate3 = $(this).text();
		catetext = cate12 + " > " + cate3;
		document.getElementById("catetextdisp").value = catetext;
	});
});

function cateconfirm() {
	if (catetext == null) {
		alert("카테고리를 선택하십시오");
	} else {
		document.getElementById("catetext").value = catetext;
		document.getElementById("maincate").value = maincate;
		document.getElementById("subcate").value = subcate;
		document.getElementById("catenum").value = catenum;
		document.getElementById("closebtn").click();
	}
}
</script>
<!-- category popup 관련 jquery 끝-->

<div class="article">
	<div class="mypagewrap">
		<jsp:include page="../inc/article_mp1.jsp"/>
		<!--mp1끝  여기까지 공통-->

		<!-- 여기부터 페이지마다 바뀜 -->
		<div class="mp9">
			<div class="upload">
				<form action="./ProductRegAction.pro" method="post" enctype="multipart/form-data" id="frm">
					<input type="hidden" name="seller_no" value="<%=seller_no%>">
					<input type="hidden" name="end_option" id="end_option" > <!-- 히든값으로 넘기는 이유? 체크값스 값은 기본적으로 체크가 되지않으면 값을 넘기지 않기때문에 -->
					<div class="up1">
						<h2>판매등록</h2>
					</div>
					<div class="up2">
						<input type="text" class="up_txt1" id="catetext" name="category" readonly="readonly" placeholder="카테고리 버튼을 눌러 상품카테고리를 선택하세요.">
						<input type="hidden" id="catenum" name="catenum">
						<input type="hidden" id="maincate" name="maincate">
						<input type="hidden" id="subcate" name="subcate">
						<input type="button" id="pro_popupButton1" class="up_btn" value="카테고리">
					</div>
					<div class="up3">
						<p>상품명</p>
						<input type="text" class="up_txt1" name="product_name" placeholder="스팸성 키워드 사용을 주의하세요." maxlength="50">
						0/50자
						<p class="up3_p">자가소비 목적으로 해외에서 직구한 상품을 온라인 등을 통해 되파는 경우, 관세법 위반으로 형사처벌 대상이 되오니 유의해 주시기 바랍니다.</p>
						<p>검색 키워드</p>
						<input type="text" class="up_txt1" name="search_keyword" placeholder="검색키워드를 입력하세요." maxlength="10">
						0/10자
						<p class="up3_p">구매자의 상품검색을 위한 검색키워드를 공백없이 입력하세요. </p>
						
					</div>

					<div class="up4">
						<table class="up4_tb">
							<tr>
								<td>경매 시작가</td>
								<td><input type="number" class="up_txt2" name="price_action"> 원</td>
							</tr>
							<tr>
								<td>즉시 구매가</td>
								<td><input type="number" class="up_txt2" name="price_promptly"> 원 <input
									type="checkbox"> 즉시구매가 설정안함</td>
							</tr>
							<tr>
								<td>경매 시작시간</td>
								<td>
								<input type="number" class="up_txt3" name="s_year" id="s_year">년 
								<input type="number" class="up_txt3" name="s_month" id="s_month">월 
								<input type="number" class="up_txt3" name="s_day" id="s_day">일
								<input type="number" class="up_txt3" name="s_hour" id="s_hour">시 
								<input type="number" class="up_txt3" name="s_minute" id="s_minute">분
								</td>
							</tr>
							<tr>
								<td>경매 마감시간</td>
								<td>
								<input type="radio" value="3" name="days" id="r_3day"> 3일 
								<input type="radio" value="5" name="days" id="r_5day"> 5일 
								<input type="radio" value="7" name="days" id="r_7day"> 7일 <br /> 
								
								<input type="number" class="up_txt3" name="e_year" id="e_year" readonly="readonly">년 
								<input type="number" class="up_txt3" name="e_month" id="e_month" readonly="readonly">월 
								<input type="number" class="up_txt3" name="e_day" id="e_day" readonly="readonly">일 
								<input type="number" class="up_txt3" name="e_hour" id="e_hour" readonly="readonly">시 
								<input type="number" class="up_txt3" name="e_minute" id="e_minute" readonly="readonly">분
								<p>경매 기간은 3일/5일/7일 중 선택가능하며 경매 마감시간도 설정 가능합니다.</p>
								</td>
							</tr>
							<tr>
								<td>경매 마감연장</td>
								<td><input type="checkbox" name="endoption" id="endoption"> 선택
									<p>경매 종료 5분이내 입찰할 경우 종료 시간이 입찰 시간으로부터 5분씩 자동연장됩니다. 단, 30분까지만 연장가능합니다.</p></td>
							</tr>
							<tr>
								<td>수수료</td>
								<!-- 이름수정 -->
								<td>
								<input type="radio" class="sc_op1" value="1" name="commission" checked="checked"> 서비스 이용료 1% (기본)
								<input type="radio" class="sc_op2"  value="3" name="commission"> 서비스 이용료 3%
								<input type="radio" class="sc_op3"  value="5" name="commission"> 서비스 이용료 5%
								<p class="sc_notice1">낙찰금액의 1% 가 서비스 이용료로 사용됩니다. (기본광고 포함)</p>
								<p class="sc_notice2">수수료 옵션 설명</p>
								<p class="sc_notice3">수수료 옵션 설명3</p>
								</td>
							</tr>
						</table>
					</div>

					<div class="up5">
						<p>사진 업로드</p>
						<div class="mainimg_up">
						<img id="mainimg_ex" alt="메인 이미지" src="http://placehold.it/325x300">
					    <input type="file"  data-width="300" data-height="300" name="product_mainimg" id="product_mainimg">
					    </div>
					</div>
					<div class="up6">
						<p>상품설명</p>
						<div>
						<textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:830px; height:450px;"></textarea>
						</div>
					</div>

					<div class="up7">
						<p>판매서비스 이용료 : 구매자가 카드 결제 시 3%, 현금결제시 1.5%</p>
						<p>
							<span>경매상품이므로</span> <span>최종 낙찰가에 따라</span> 정산 예정금액이 달라지며, <span>이용료는 판매대금 정산 시 차감</span>됩니다.
						</p>
					</div>

					<div class="up8">
						<input type="button" id="savebutton" value="판매등록"> <input type="reset" value="취소">
					</div>

				</form>
			</div>

			<!--팝업 내용 시작-->
			<div id="pro_popup1">
				<h3>카테고리를 선택하여 주십시오</h3>
				<span class="b-close" id="closebtn">X</span>
				<ul class="maincategory">
					<li>대카테고리</li>
					<li>중카테고리</li>
					<li>소카테고리</li>
				</ul>
				<div class="pro_content">
					<div class="b_cate">
						<!--대분류-->
						<ul class="b_ul">
							<li class="b_li" value="1">패션/뷰티/잡화</li>
							<li class="b_li" value="2">가구/생활/유아</li>
							<li class="b_li" value="3">가전/디지털/컴퓨터</li>
							<li class="b_li" value="4">스포츠/자동차/공구</li>
							<li class="b_li" value="5">도서/음반/DVD/블루레이</li>
						</ul>
					</div>

					<div class="m_cate">
						<!--중분류-->
						<ul class="m_ul">
							<li class="m_li" value="1">의류</li>
							<li class="m_li" value="2">뷰티</li>
							<li class="m_li" value="3">잡화</li>
						</ul>
						<ul class="m_ul">
							<li class="m_li" value="1">가구/침구/수납</li>
							<li class="m_li" value="2">생활/취미</li>
							<li class="m_li" value="3">유아용품</li>
						</ul>
						<ul class="m_ul">
							<li class="m_li" value="1">가전</li>
							<li class="m_li" value="2">디지털</li>
							<li class="m_li" value="3">컴퓨터</li>
						</ul>
						<ul class="m_ul">
							<li class="m_li" value="1">스포츠/레저</li>
							<li class="m_li" value="2">자동차/공구</li>
						</ul>
						<ul class="m_ul">
							<li class="m_li" value="1">도서</li>
							<li class="m_li" value="2">음반</li>
							<li class="m_li" value="3">DVD/블루레이</li>
						</ul>
					</div>

					<div class="s_cate">
						<!--소분류-->
						<ul class="s_ul">
							<li class="s_li" value="1">여성의류</li>
							<li class="s_li" value="2">남성의류</li>
							<li class="s_li" value="3">캐쥬얼의류</li>
						</ul>
						<ul class="s_ul">
							<li class="s_li" value="4">화장품/향수</li>
							<li class="s_li" value="5">바디/헤어</li>
						</ul>
						<ul class="s_ul">
							<li class="s_li" value="6">신발</li>
							<li class="s_li" value="7">가방/패션잡화</li>
							<li class="s_li" value="8">쥬얼리/시계/선글라스</li>
						</ul>
						<ul class="s_ul">
							<li class="s_li" value="9">가구/DIY</li>
							<li class="s_li" value="10">조명/인테리어</li>
							<li class="s_li" value="11">생활/욕실/수납용품</li>
							<li class="s_li" value="12">주방용품</li>
							<li class="s_li" value="13">침구/커튼</li>
						</ul>
						<ul class="s_ul">
							<li class="s_li" value="14">건강/의료용품</li>
							<li class="s_li" value="15">반려동물용품</li>
							<li class="s_li" value="16">악기/취미/키덜트</li>
							<li class="s_li" value="17">디자인/문구/사무용품</li>
							<li class="s_li" value="18">꽃/이벤트용품</li>
						</ul>
						<ul class="s_ul">
							<li class="s_li" value="19">기저귀/분유/유아식</li>
							<li class="s_li" value="20">출산/유아용품/임부복</li>
							<li class="s_li" value="21">장난감/교육완구/인형</li>
							<li class="s_li" value="22">유아동의류</li>
							<li class="s_li" value="23">유아동신발/가방/잡화</li>
						</ul>
						<ul class="s_ul">
							<li class="s_li" value="24">대형가전</li>
							<li class="s_li" value="25">계절가전</li>
							<li class="s_li" value="26">주방가전</li>
							<li class="s_li" value="27">생활/미용가전</li>
						</ul>
						<ul class="s_ul">
							<li class="s_li" value="28">카메라</li>
							<li class="s_li" value="29">음향기기</li>
							<li class="s_li" value="30">게임</li>
							<li class="s_li" value="31">휴대폰</li>
							<li class="s_li" value="32">태블릿</li>
						</ul>
						<ul class="s_ul">
							<li class="s_li" value="33">노트북/PC</li>
							<li class="s_li" value="34">모니터/프린터</li>
							<li class="s_li" value="35">PC주변기기</li>
							<li class="s_li" value="36">저장장치</li>
						</ul>
						<ul class="s_ul">
							<li class="s_li" value="37">휘트니스/수영</li>
							<li class="s_li" value="38">스포츠의류/운동화</li>
							<li class="s_li" value="39">골프클럽/의류/용품</li>
							<li class="s_li" value="40">등산/아웃도어</li>
							<li class="s_li" value="41">캠핑/낚시</li>
							<li class="s_li" value="42">구기/라켓</li>
							<li class="s_li" value="43">자전거/보드</li>
						</ul>
						<ul class="s_ul">
							<li class="s_li" value="44">자동차용품/블랙박스</li>
							<li class="s_li" value="45">타이어/오일/부품</li>
							<li class="s_li" value="46">공구/안전/산업용품</li>
						</ul>
						<ul class="s_ul">
							<li class="s_li" value="47">국내도서</li>
							<li class="s_li" value="48">해외도서</li>
						</ul>
						<ul class="s_ul">
							<li class="s_li" value="49">국내음반</li>
							<li class="s_li" value="50">해외음반</li>
						</ul>
						<ul class="s_ul">
							<li class="s_li" value="51">국내작품</li>
							<li class="s_li" value="52">해외작품</li>
						</ul>
					</div>
				</div>
				<!-- content -->
				<div class="pop_probtn">
					<input type="button" value="확인" onclick="cateconfirm()"> 
					<input type="text" id="catetextdisp" readonly>
				</div>
			</div>
			<!-- popupwrap -->
			<!-- 팝업 내용 끝 -->

			<!-- upload -->
		</div>
		<!-- mp9 -->
		<!-- 바뀌는 부분 끝-->
	</div>
	<!-- mypagewrap 끝 -->
</div>
<!-- article 끝 -->
