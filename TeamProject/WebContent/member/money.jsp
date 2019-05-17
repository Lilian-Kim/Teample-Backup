<%@page import="Member.TableModel.Memberbean"%>
<%@page import="Member.TableModel.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- article 시작 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	$('.popup-with-move-anim').magnificPopup({
		type: 'inline',
		fixedContentPos: false,
		fixedBgPos: true,
		overflowY: 'auto',
		closeBtnInside: true,
		preloader: false,
		midClick: true,
		removalDelay: 300,
		mainClass: 'my-mfp-slide-bottom'
	});
});


function chargeCheck(){

	var cmoney = document.getElementById("cmoney").value;
	var radio = document.getElementsByName("chr");
	var chk;
	
	for(var i=0; i<radio.length; i++){
		if(radio[i].checked){ chk = true; break; }else{ chk = false; }
	}
	
    if( !( (event.keyCode >= 48 && event.keyCode<=57) || (event.keyCode >= 96 && event.keyCode <= 105) || 
    		event.keyCode==8 || event.keyCode==13) ){
         alert("충전하실 금액을 정확히 입력하십시오");
         event.returnValue=false;        
    }else if(event.keyCode==13 && cmoney==0){
    	alert("금액을 입력하지 않으셨습니다");
        event.returnValue=false;
    }else if(event.keyCode==13 && cmoney!=0 && chk==false){
    	alert("결제 수단을 선택하십시오");
        event.returnValue=false;
    }else if(event.keyCode==13 && cmoney!=0 && chk==true){
    	document.getElementById("charge").submit();
    }
    
}

function chargeConfirm(){
	
	var cmoney = document.getElementById("cmoney").value;
	var radio = document.getElementsByName("chr");
	var chk;
	
	for(var i=0; i<radio.length; i++){
		if(radio[i].checked){ chk = true; break; }else{ chk = false; }
	}
	
	if(cmoney==0){
    	alert("금액을 입력하지 않으셨습니다");
        event.returnValue=false;
    }else if(cmoney!=0 && chk==false){
    	alert("결제 수단을 선택하십시오");
        event.returnValue=false;
    }else if(cmoney!=0 && chk==true){
    	document.getElementById("charge").submit();
    }
	
}
</script>

<%
MemberDAO mdao = new MemberDAO();
String id = (String)session.getAttribute("id");
int mymoney = mdao.getMoney(id);
Memberbean name = (Memberbean)mdao.userInfo(id);
String myname = name.getName();
%>

<div class="article">
<div class="mypagewrap">
<jsp:include page="../inc/article_mp1.jsp"/>
<!--mp1끝  여기까지 공통-->

<!-- 여기부터 페이지마다 바뀜 -->
<div class="mp3"> 
<div class="subcate_mn">
<jsp:include page="../inc/subcate.jsp"/>
</div><!-- subcate_mn -->

<div class="money">
<div class="money_1">
<div><img src="./images/money2.png"></div> <!-- 이미지 교체 -->
<h4>사용가능 금액</h4>
<p><fmt:formatNumber value="${mbean.money }" type="number"/>원</p>
<div><input type="button" value="충전하기" class="popup-with-move-anim" href="#small-dialog">

<div class="zoom-anim-dialog mfp-hide" id="small-dialog"><!-- ------------------------- -->
 <form action="./MemberCharge.me" name="charge" id="charge" method="post">
 
 	<h3>사이버머니 충전</h3>
	<h4>${mbean.name }님의 현재 잔액은 <fmt:formatNumber value="${mbean.money }" type="number"/>원 입니다. </h4>
	
	<input type="hidden" name="id" value="${mbean.id }">
	<input type="hidden" name="mymoney" value="${mbean.money }">
	
	<input type="text" name="cmoney" placeholder="충전 금액을 입력하세요" onkeydown="chargeCheck()" id="cmoney"><br/>
	<input type="radio" name="chr" id="chr1">
	<label for="chr1">신용/체크카드</label> 
	<input type="radio" name="chr" id="chr2">
	<label for="chr2">무통장입금</label> 
	<input type="radio" name="chr" id="chr3">
	<label for="chr3">휴대폰결제</label><br/>
	
	<select class="chr1">
	<option>하나</option>
	<option>신한</option>
	<option>NH</option>
	<option>BC</option>
	<option>우리</option>
	</select>
	
	<select class="chr2">
	<option>하나은행 : 123-456-789-1 &nbsp; 예금주 : 자투리</option>
	<option>신한은행 : 123-456-789-1 &nbsp; 예금주 : 자투리</option>
	<option>농협 : 123-456-789-1 &nbsp; 예금주 : 자투리</option>
	<option>우리은행 : 123-456-789-1 &nbsp; 예금주 : 자투리</option>
	<option>국민은행 : 123-456-789-1 &nbsp; 예금주 : 자투리</option>
	</select>
	
	<select class="chr3">
	<option>SKT</option>
	<option>KT</option>
	<option>LGU</option>
	</select>
	
	<input type="button" value="충전" class="chr_btn" id="chr_btn" onclick="chargeConfirm()">
	</form> 
</div><!-- ---------------------------------------------------------------------------- -->
</div>
</div><!-- money_1 -->

<div class="money_2">
<div><img src="./images/money1.png"></div> <!-- 이미지 교체 -->
<h4>차감대기 금액</h4>
<p>${mbean.deduction_money }원</p>
</div><!-- money_2 -->

</div><!-- money끝 -->
</div><!-- mp3 -->
<!-- 바뀌는 부분 끝-->

</div><!-- mypagewrap 끝 -->
</div> <!-- article 끝 -->


