<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('addr1').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('addr2').focus();
					}
				}).open();
	}
</script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//기본형태    
		//$('#registerForm').validate(); //유효성 검사를 적용
		// validate signup form on keyup and submit
		//확장옵션
		$('#registerForm').validate({
			rules : {
				id : {
					required : true,
					minlength : 3,
					maxlength : 15,
//					equalTo : "#id"
				},
				pw : {
					required : true
				},
				pw2 : {
					required : true,
					equalTo : '#pw'
				},
				name : {
					required : true
				},
			},
			messages : {
				id : {
					required : "아이디를 입력하시오.",
					minlength : "3자 이상",
					maxlength : "15자 이하",
					remote : jQuery.format("입력하신 {0}는 이미존재하는 아이디입니다. ")
				},
				pw : {
					required : "암호를 입력하시오."
				},
				pw2 : {
					required : "암호확인를 입력하시오.",
					equalTo : "암호를 다시 확인하세요"
				},
				name : {
					required : "이름을 입력하시오."
				},
			},
			highlight : function(element, errorClass) {
				$(element).closest('.form-group').addClass("has-error");
			},
			unhighlight : function(element, errorClass) {
				$(element).closest('.form-group').removeClass("has-error");
			}
		});
	}); //end ready()
</script>

<script>

function phoneCheck(){

    if( !( (event.keyCode >= 48 && event.keyCode<=57) || (event.keyCode >= 96 && event.keyCode <= 105) || 
             event.keyCode==8 || event.keyCode==13) ){
            alert("숫자만 입력하세요.");
            event.returnValue=false;        
       } 
}//숫자만 입력하도록

 function checkmail(){
	 if(registerForm.email3.value=='1'){
		 registerForm.email2.readonly=false;
		 registerForm.email2.value="";
		 registerForm.email2.focus();
	 }else{
		 registerForm.email2.readonly=true;
		 registerForm.email2.value=registerForm.email3.value;
	 }
 }//email 셀렉트값 받아오기
 
 function CheckForm(registerForm){ 
	 
	  if (document.getElementById("phone2").value == "") {
	         alert("전화번호를 입력해주세요.");
	         document.getElementById("phone2").focus();
	         return false;
	      }else{
	    	  if(document.getElementById("phone2").value.length !=4){
	    		  alert("전화번호 4자리를 입력하세요.")
	    		  document.getElementById("phone2").focus();
	    		  return false;
	    	  }
	      }
	      
	      if (document.getElementById("phone3").value == "") {
	         alert("전화번호를 입력해주세요.");
	         document.getElementById("phone3").focus();
	         return false;
	      } else{
	    	  if(document.getElementById("phone3").value.length !=4){
	    		  alert("전화번호 4자리를 입력하세요.")
	    		  document.getElementById("phone3").focus();
	    		  return false;
	    	  }
	      }
	      //핸드폰번호 유효성 체크 
	       var chk1=document.registerForm.check1.checked;
	       var chk2=document.registerForm.check2.checked;
	    
	       if(chk1==""){
	        alert('이용약관에 동의해 주세요.');
	        return false;
	       }
	       if(chk2==""){
	        alert('개인정보 수집 및 이용에 동의해 주세요.');
	        return false;
	    }//checkbox 체크
	 }

</script>


</head>
<body>
	<div class="article">

		<div class="join_wrap">
			<form action="./MemberJoinAction.me" method="post" id="registerForm" name="registerForm" onSubmit="return CheckForm(this)">
				<div class="title">
					<img src="images/sub_join_title_text01.gif">
				</div>
				<!-- title 끝 -->

				<div class="join_form">

					<table class="join_tb">
						<tr>
							<td>아이디 <img src="images/ico_required.gif"></td>
							<td><input type="text" class="jtb_text" name="id" id="id" autofocus="autofocus" placeholder="3자 이상 15자 이하"></td>
						</tr>
						<tr>
							<td>비밀번호<img src="images/ico_required.gif"></td>
							<td><input type="password" class="jtb_text" name="pw" id="pw"></td>
						</tr>
						<tr>
							<td>비밀번호 확인 <img src="images/ico_required.gif"></td>
							<td><input type="password" class="jtb_text" name="pw2" id="pw2"></td>
						</tr>
						<tr>
							<td>이름 <img src="images/ico_required.gif"></td>
							<td><input type="text" class="jtb_text" name="name" id="name"></td>
						</tr>
						<tr>
							<td>휴대전화 <img src="images/ico_required.gif"></td>
							<td><select name="phone1">
								    <option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select> - <input type="text" class="jtb_text2" name="phone2" id="phone2" onkeydown="phoneCheck();"> - <input type="text"
								class="jtb_text2" name="phone3" id="phone3" onkeydown="phoneCheck();"></td>
						</tr>
						<tr>
							<td>이메일 <img src="images/ico_required.gif"></td>
							<td><input type="text" class="jtb_text" name="email1"> @ <input type="text"
								class="jtb_text" name="email2" id="email2"> <select name="email3" id="email3" onchange="checkmail();">
									<option value="" selected>선택하세요</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="nate.com">nate.com</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="1">직접입력</option>
							</select></td>
						</tr>
						<tr>
							<td>이메일 수신여부 <img src="images/ico_required.gif"></td>
							<td><input type="radio" name="infomail" checked="checked" value="1">&nbsp;<label>수신함</label>
								&nbsp;<input type="radio" name="infomail" value="0">&nbsp;<label>수신안함</label>
								<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</td>
						</tr>

						<tr>
							<td>우편번호 <img src="images/ico_required.gif"></td>
							<td><input type="text" class="jtb_text2" name="zipcode" id="zipcode" placeholder="우편번호">
								<input type="button" class="btn3" onclick="sample6_execDaumPostcode()" value="우편번호검색"></td>
						</tr>
						<tr>
							<td>주소 <img src="images/ico_required.gif"></td>
							<td><input type="text" class="jtb_text3" name="addr1" id="addr1" placeholder="주소"><br />
								<input type="text" class="jtb_text3" name="addr2" id="addr2" placeholder="상세주소"></td>
						</tr>

					</table>
				</div>
				<!-- join_form 끝 -->

				<h3>이용약관 동의</h3>
				<div class="using_agree">
					<div class="txt1">
						<textarea rows="20" cols="110" disabled="disabled">
제1장 자투리(통신판매중개) 서비스
 
제1조 (서비스의 종류)
회사에서 회원에게 제공하는 서비스의 종류는 다음과 같습니다.
1. E-Commerce 서비스: 회사가 인터넷사이트를 통하여 회원 간에 상품의 매매가 이루어질 수 있도록 온라인 거래장소를 제공하는 서비스 및 관련 부가서비스를 말합니다.
가. 판매 관련 업무지원 서비스
나. 구매 관련 지원 서비스
다. 계약체결, 결제 지원 및 결제대금 보호 서비스
라. 상품검색정보 서비스
마. 기타 전자상거래 관련 서비스
2. 기타 서비스 : 상품문의게시판 서비스, 구매자 판매자 간의 1:1 메신저 서비스, 구매자 구매자 간의 메신저 서비스, 상품평, 전문가 리뷰 등 기타 정보제공 서비스, 회사가 직접 또는 제휴사와 공동으로 제공하는 텔레마케팅(TM), 이벤트 서비스를 말합니다.
 
제2조 (대리행위 및 보증인의 부인)
① 회사는 구매자와 판매자 간의 자유로운 상품의 거래를 위한 시스템을 운영 및 관리, 제공할 뿐이므로 구매자 또는 판매자를 대리하지 않으며, 회원 사이에 성립된 거래와 관련된 책임과 회원이 제공한 정보에 대한 책임은 해당 회원이 직접 부담하여야 합니다.
② 회사는 자투리를 통하여 이루어지는 구매자와 판매자 간의 거래와 관련하여 판매의사 또는 구매의사의 존부 및 진정성, 등록 상품의 품질, 완전성, 안정성, 적법성 및 타인의 권리에 대한 비침해성, 구매자 또는 판매자가 입력하는 정보 및 그 정보를 통하여 링크된 URL에 게재된 자료의 진실성 또는 적법성 등 일체를 보증하지 않으며, 이와 관련한 일체의 위험과 책임은 해당 이용자가 전적으로 부담합니다.
③ 회사는 구매자와 판매자간의 거래의 안전성과 신뢰성을 높이는 도구만을 개발하여 제공합니다. 단, 회사가 판매하는 직매입 상품의 경우 구매자에 대하여 회사는 판매자의 지위를 갖게 됩니다.
 
제3조 (구매자의 서비스 이용)
① 구매자는 구매의사 없이 판매자의 상품에 입찰하거나 구매표시를 해서는 안 되며, 구매의사 없이 입찰행위를 통하여 상품 가격을 올리거나 구매의사를 표시하여 판매자의 상품판매 기회를 방해하거나 다른 구매자의 구매기회를 방해한 것이 적발되면 회사는 해당 아이디(ID)[해당 아이디(ID)와 동일인 소유로 확인되는 아이디(ID) 포함]에 대하여 회원자격을 정지하는 등의 조치를 할 수 있습니다 
② 구매자는 상품을 구매하기 전에 반드시 판매자가 사이트 내에 작성한 상품의 상세 내용과 거래의 조건을 정확하게 확인해야 합니다. 구매하려는 상품의 내용과 거래의 조건을 확인하지 않고 구매하여 발생한 모든 손실과 손해는 구매자 본인에게 있습니다.
③ 구매자는 상품의 상세 내용과 거래의 조건 등에 관한 내용을 판매자에게 확인하기 위하여 회사가 제공하는 1:1 메신저 서비스를 이용할 수 있습니다. 해당 서비스를 통한 대화 내용은 대화 당사자가 동시에 대화 진행 불가 시 대화 내용 유지 등 원활한 서비스 제공을 위해 최대 7일간 암호화되어 저장되었다가 자동으로 삭제되며 회사는 해당 서비스 이용 목적 외 이를 사용하지 않습니다.
④ 구매자는 구매자의 지인 및 일반 자투리 고객과의 1:1, 1:N 간 채팅을 위해 회사가 제공하는 메신저 서비스를 이용할 수 있습니다. 서비스를 이용하는 과정에서 구매자의 전화번호, 단말기 주소록 내에 저장된 연락처 정보(이름/전화번호), 자투리 회원가입 이름, MDN 정보를 수집합니다. 해당 서비스를 통한 대화 내용은 대화 당사자가 동시에 대화 진행 불가 시 대화 내용 유지 등 원활한 서비스 제공을 위해 최대 7일간 암호화되어 저장되었다가 자동으로 삭제되며 회사는 해당 서비스 이용 목적 외 이를 사용하지 않습니다.
⑤ 구매자는 이 약관과 회사가 서비스 화면에서 알리는 내용을 지켜야 하며, 약관과 알리는 내용을 위반하거나 이행하지 않아서 발생하는 모든 손실과 손해에 대해 책임을 집니다.
⑥ 회사는 판매자가 등록한 상품의 내용과 거래조건에 대해서 어떠한 보증이나 대리를 하지 않습니다. 따라서 구매자는 스스로 책임지고 상품을 구매해야 합니다.
⑦ 구매자는 구매한 상품에 청약철회의 원인이 발생하면 수령한 상품을 임의로 사용하거나 훼손되도록 방치해서는 안 됩니다. 청약철회 상품의 임의사용이나 상품보관의 미흡으로 상품이 훼손되었을 때에는 그에 합당한 비용을 부담하여야 합니다.
⑧ 구매자는 판매자와 상품매매 절차에서 분쟁이 발생하면 분쟁의 해결을 위하여 성실히 임해야 하며, 분쟁해결의 불성실로 판매자와 회사에 손실과 손해가 발생하면 그에 대한 모든 책임을 져야 합니다.
⑨ 구매자가 상품을 구매할 때는 반드시 본인 명의의 결제수단을 사용하여야 하며, 타인의 결제수단을 임의로 사용 해서는 안 됩니다. 타인의 결제수단을 임의로 사용하여 발생하는 회사, 결제수단 소유자, 판매자의 손실과 손해에 대한 모든 책임은 구매자에게 있습니다.
⑩ 매매대금의 결제와 관련하여 구매자가 입력한 정보 및 그 정보와 관련하여 발생한 책임과 불이익은 전적으로 구매자가 감당해야 합니다.
⑪ 상품을 주문한 후 5영업일(토요일과 공휴일 제외) 이내에 매매대금을 결제하지 않으면 주문취소로 간주되며, 해당 주문은 자동으로 취소됩니다.
⑫ 회사는 구매자가 매매대금 결제 때 사용한 결제수단에 대해 정당한 사용권한이 있는지 확인할 수 있으며, 이에 대한 확인이 완료될 때까지 거래진행을 중지하거나 해당 거래를 취소할 수 있습니다.
⑬ 회사는 구매자에게 서비스가 안전하게 제공 될 수 있도록 각종 설비와 자료를 관리해야 하며, 서비스가 제공 목적에 맞게 이용되고 있는지 확인하고 구매자에게 이용 목적에 위반되는 부분이 있는 것으로 확인되면 사유의 소명을 요청할 수 있습니다.
⑭ 회사가 구매자의 서비스 이용 편의를 높이기 위해 제휴업체로부터 정보를 제공받아 게재하거나 제3자가 제공하는 방식으로 자투리 사이트 내 또는 링크 방식으로 참조용 정보나 콘텐츠를 제공하더라도, 구매자는 상품 구매 때 자신의 판단과 책임으로 결정하여 구매하여야 하며, 회사는 어떠한 경우에도 회원의 구매결정에 대하여 책임을 지지 않습니다.
⑮ 미성년자가 구매할 때 법정대리인이 해당 계약에 대하여 동의하지 않으면, 미성년자 본인 또는 법정대리인은 그 계약을 취소할 수 있습니다. 미성년자의 거래에 관한 상세한 사항은 관련 법령이 정하는 바를 따릅니다.
 
제4조 (결제대금 보호서비스의 이용)
① 회사는 e커머스 서비스의 신뢰성을 높이고 회원 간에 안전한 거래가 이루어질 수 있도록 결제대금 보호 서비스를 제공합니다. 결제대금 보호 서비스란, 매매계약이 체결되고 구매자가 대금을 결제 하였을 경우, 구매자가 판매자로부터 해당 상품을 받았다면 회사는 미리 정한 서비스 이용료를 공제한 후 해당 판매자에게 대금을 정산해 주고, 구매자가 판매자로부터 상품을 받지 못했거나 받았더라도 판매자에게 반품한 후 환불을 요청했을 때에는 구매자가 결제한 금액을 회사가 구매자에게 환불해주는 서비스를 말합니다.
② 결제대금 보호 서비스는 자투리에서 구매하는 모든 상품에 적용 됩니다.
③ 결제대금 보호 서비스는 회원 간에 이루어지는 상품매매의 안전성과 신뢰성을 높이고, 상품을 인수하기 전에 대금을 결제해야 하는 구매자를 보호하기 위해 제공합니다.
④ 회사에서 제공하는 결제대금 보호 서비스는 판매자나 구매자를 대리하는 것이 아니며, 상품의 매매와 관련하여 판매자나 구매자의 의무를 대행하는 것도 아닙니다.
⑤ 회사의 결제대행 서비스를 통하여 상품구매대금을 결제하는 과정에서 발생하는 송금수수료 등은 대금을 송금하는 구매자가 부담해야 합니다.
⑥ 결제대금 보호 서비스를 제공하는 과정에서 회사가 결제대금을 보관하여 이자 등이 발생했을 때 구매자는 회사에 그 반환을 청구할 수 없습니다.
⑦ 결제대금 보호 서비스를 이용하는 구매자는 상품 배송이 완료되었을 때 회사에 구매확정, 교환 또는 반품의 의사표시를 해야 합니다.
⑧ 구매자에게 구매확정의 의사가 있거나 구매확정의 의사가 있는 것으로 간주하는 상황이 발생하면 결제대금 보호 서비스는 종료됩니다.
⑨ 배송완료가 되었음에도 구매확정기간 내에 구매자로부터 교환 또는 반품의 의사표시가 없으면 회사는 구매확정의 의사가 있다고 간주합니다.
⑩ 회사는 구매자에게 구매확정의 의사가 있거나 구매확정의 의사가 있다고 간주하면 ’전자상거래 등에서의 소비자보호에 관한 법률’의 관련 규정에 따라 관련 대금을 상품의 판매자에게 송금할 수 있습니다.
⑪ 결제대금 보호 서비스가 종료된 이후에 청약철회, 취소, 해제, 무효 등의 사유가 발생한다면 구매자는 판매자와 직접 청약철회, 취소, 해제 및 결제대금 환불 등에 관한 절차를 진행해야 합니다.
 
제5조 (금지행위)
① 회사가 제공하는 결제대금 보호 서비스를 이용하지 않고 판매자와 구매자가 직접 거래하는 행위(직거래)는 거래의 안전을 위하여 금지되고, 직거래를 통하여 발생한 제반 문제에 대한 책임은 거래 당사자에게 있으며 회사는 이에 대해 어떠한 책임도 지지 않습니다.
② 직거래를 하거나 이를 유도한 것으로 확인된 판매자는 서비스 이용이 정지되거나 이용계약이 해지될 수 있으며, 회원은 직거래를 하거나 유도한 판매자를 회사가 운영하는 안전거래센터에 신고할 수 있습니다.
③ 회사는 공정한 경매의 진행을 위하여 허위입찰, 상습적인 낙찰취소 또는 경매물품 구매 후 반품, 입찰방해, 낙찰가격 조작 등 일체의 불공정한 경매 부정행위를 금합니다.
④ 회사는 경매 부정행위가 확인되면 입찰취소 처리를 할 수 있으며 입찰제한, 이용계약의 해지 등의 조치를 할 수 있습니다.
⑤ 회사가 제공하는 서비스 이용방법을 따르지 않고 비정상적인 방법으로 서비스를 이용하거나 시스템에 접근하는 행위는 금지됩니다.
⑥ 시스템 부정행위가 확인되면 회사는 해당 회원에게 부가적으로 제공한 혜택의 일부 또는 전부를 회수하거나, 특정 서비스의 이용을 제한하고, 이용계약을 해지하는 등의 조치를 할 수 있습니다.
⑦ 타인의 명의, 카드정보, 계좌정보 등을 무단으로 사용하여 회사가 제공하는 구매서비스를 이용하는 행위는 금지됩니다.
⑧ 물품판매 또는 용역제공을 가장하여 자금을 융통하는 것과 같이 여신전문금융업법 등 법령에 따라 금지된 방법으로 비정상적인 결제를 하는 것은 금지되며, 해당 내용이 확인되었을 때 회사는 회원의 거래를 취소하거나 중지시키고 관련기관에 통보할 수 있습니다.
⑨ 실제 상품의 배송이 없는 등 상품의 실질적인 구매의사가 없는 구매행위와 회사가 제공하는 할인율 등을 이용하여 비정상적인 거래를 하는 것은 금지되며, 해당 내용이 확인되면 회사는 해당 거래를 취소하고 서비스이용을 제한하거나 이용계약을 해지할 수 있습니다.
⑩ 제3자에게 재판매하기 위한 목적으로 회사가 제공하는 혜택을 부당하게 이용하는 행위(다른 오픈마켓이나 인터넷쇼핑몰 등에 임의로 최저가를 등록하는 등으로 자투리 할인쿠폰 발행을 유도한 후 해당 쿠폰을 적용하여 구매하는 행위 등)는 금지되며, 재판매 목적의 거래행위가 확인된 경우 회사는 해당 회원에 대하여 서비스이용제한, 이용계약의 해지 등의 조치를 취할 수 있으며, 이러한 행위로 손해가 있을 경우 배상을 청구할 수 있습니다.
⑪ 판매자 본인의 상품 구매 또는 실제 상품의 이동 없이 판매점수 및 광고효과를 높이기 위한 구매 또는 부당한 할인 획득을 위해 제3자의 아이디를 이용한 구매 행위는 금지되며, 해당 내용이 확인된 경우 거래취소하거나 서비스이용제한 등의 조치를 할 수 있습니다.
 
제6조 (안전거래센터)
① 회사는 타인의 권리 침해, 법령의 위반 등 회원이 서비스를 이용할 때 발생할 수 있는 거래의 안전과 관련된 법적 문제를 조정하기 위하여 안전거래센터를 운영합니다.
② 안전거래센터는 다음과 같은 역할을 합니다.
1. 매매부적합물의 판매에 대한 조치
2. 타인의 권리를 침해하는 행위에 대한 조치
3. 약관 위반 또는 법령을 위반하는 행위에 대한 조치
4. 기타 거래의 안전 및 사이트의 안전 확보등을 위한 조치
5. 회원 또는 거래의 안전 확인 및 안전이 확인될 때 까지 거래 보류하거나 거래 취소할 수 있으며, 서비스 이용을 제한하거나 이용계약의 해지 등의 조치
③ 안전거래센터의 조정에 회원은 신의성실의 원칙에 따라 성실히 응해야 합니다.
 
제7조 (분쟁조정 센터)
① 회사는 회원 상호 간 또는 회원과 제3자 간의 분쟁을 조정하기 위하여 분쟁조정센터를 운영 합니다.
② 분쟁조정센터를 통하여 분쟁을 조정할 때 회사는 제3자의 입장에서 공정하게 분쟁의 조정에 임해야 합니다.
③ 분쟁조정센터의 조정에 회원은 신의성실의 원칙에 따라 성실히 응해야 합니다.
 
제8조 (회사의 면책)
① 상품의 매매와 관련하여 발생하는 상품의 배송, 청약철회, 반품 등의 거래진행은 거래 당사자인 판매자와 구매자 간에 수행되어야 하며, 회사는 거래진행에 관여하지 않으며 어떠한 책임도 부담지지 않습니다.
② 제13조 제2항의 사유로 서비스를 일시적으로 중단하여 이용자 또는 제3자가 손해를 입었을 때 회사는 이에 대해 책임을 지지 않습니다.
③ 제13조 제3항의 사유로 서비스를 제한하거나 중단하게 된다면 회사는 불가항력을 이유로 그 책임을 지지 않습니다.
④ 회사는 이용자의 귀책사유로 서비스 이용에 장애가 발생하는 것에 대해 책임을 지지 않습니다.
⑤ 이용자가 자신의 개인정보를 타인에게 유출하거나 제공하여 발생하는 피해에 대해 회사는 일절 책임을 지지 않습니다.
⑥ 회사의 서비스 화면에서 링크, 배너 등을 통하여 연결된 회사(이하 피연결회사)와 이용자간에 이루어진 거래에 회사는 개입하지 않으며, 해당 거래에 대하여 책임을 지지 않습니다.
⑦ 회사는 서비스 화면에 표시되는 판매자 또는 제3자가 제공하는 상품 또는 정보 등의 정확성, 적시성, 타당성 등을 보증하지 않으며, 그와 관련하여 어떠한 책임도 지지 않습니다.
⑧ 회사는 제33조 제1항에 따른 서비스나 기능의 전부 또는 일부를 수정하거나 중단하는 것에 대해 책임을 지지 않습니다.
						</textarea>
					</div>
					<div class="using_check">
						이용약관에 동의하십니까? <input type="checkbox" id="check1" name="check1">동의함
					</div>
				</div>
				<!-- 이용약관 끝-->

				<h3>개인정보 수집 및 이용 동의</h3>
				<div class="info_agree">
					<div class="txt2">
						<textarea rows="20" cols="110" disabled="disabled">
자투리 개인정보 처리방침

자투리는 고객의 개인정보보호를 소중하게 생각하고, 고객의 개인정보를 보호하기 위하여 항상 최선을 다하고 있습니다. 자투리는 통신비밀보호 법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법 및 같은법 시행령 등 정보통신서비스 제공자가 준수하여야 할 관련 법령상의 개인정보보호 규정을 지키며, 관련 법령에 따른 개인정보처리방침을 정하여 이를 자투리 홈페이지에 공개하여 고객이 언제나 용이하게 열람할 수 있도록 하고 있습니다. 회사는 정부의 법률 및 지침 변경 등에 따라 수시로 개인정보처리방침을 바꿀 수 있고, 이에 따른 개인정보 처리방침의 지속적인 개선을 위하여 필요한 절차를 정하고 있습니다. 그리고 개인정보 처리방침 을 개정하거나 변경할 때에는 홈페이지 첫페이지에 해당 내용을 알리고 있습니다. 이용자들께서는 사이트 방문 시 수시로 확인하시기 바랍니다
자투리「개인정보처리방침」은 아래와 같은 내용을 담고 있습니다.

  개인정보의 수집에 대한 동의
  개인정보의 수집 및 이용 목적
  개인정보의 수집 항목
  개인정보의 수집 방법
  개인정보의 보유 및 이용기간
  수집한 개인정보의 이용 및 제3자 제공
  개인정보의 열람 및 정정
  개인정보의 수집,이용,제공에 대한 동의철회
  개인정보 파기절차 및 방법
  비회원 개인정보보호
  아동의 개인정보보호
  개인정보처리 업무의 위탁
  개인정보처리방침의 고지 또는 통지방법
  개인정보보호를 위한 기술 및 관리적 대책
  링크 사이트
  게시물
  개인정보 자동 수집장치의 설치•운영 및 그 거부에 대한 사항
  이용자의 권리와 의무
  의견수렴 및 불만처리
  개인정보보호 책임자 및 담당자
  광고성 정보 전송
  고지의무

1. 개인정보 수집에 대한 동의
자투리는 고객님께서 개인정보처리방침 또는 이용약관의 내용에「동의한다」또는「동의하지 않는다」버튼을 클릭할 수 있는 절차를 마련하고 있으며,「동의한다」버튼을 클릭하면 개인정보 수집 에 동의한 것으로 봅니다.

2. 개인정보의 수집 및 이용 목적
"개인정보"는 생존하는 개인에 관한 정보로서 해당 정보에 포함된 성명, 주민등록번호 등의 사항으로 해당 개인을 식별할 수 있는 정보(해당 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 쉽게 결합하여 식별할 수 있는 것을 포함)를 말합니다.

3. 개인정보의 수집 항목
  가. 자투리는 기본적인 서비스 제공을 위한 필수 정보만을 수집하고 있으며 고객 각각의 기호와 필요에 맞는 서비스를 제공하기 위하여 정보 수집 때 별도 동의를 얻고 있습니다. 선택 정보를 입력하지 않아도 서비스 이용에 제한은 없습니다.
  나. 자투리는 이용자의 기본적 인권을 침해 할 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는 수집하지 않습 니다. 그리고, 어떤 경우에라도 입력하신 정보를 이용자들에게 미리 밝힌 목적 이외의 다른 목적으로는 사용하지 않으며 외부로 유출하지 않습니다.						
						</textarea>
					</div>
					<div class="info_check">
						개인정보 수집 및 이용에 동의하십니까? <input type="checkbox" id="check2" name="check2">동의함
					</div>
				</div>
				<!-- 개인정보 끝-->

				<div class="join_btn">
					<input type="submit" class="btn1" value="회원가입"> 
					<input type="reset" class="btn2" value="취소">
				</div>
				<!-- 확인/취소 -->
			</form>
		</div>
		<!-- join_wrap 끝 -->
	</div>
	<!-- article 끝 -->

</body>
</html>
