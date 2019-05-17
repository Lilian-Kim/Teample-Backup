<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

.qnawriteboard{width:800px; margin-left: 100px;}
.qnawriteboard td textarea{border:1px solid gray;}
.qnawriteboard td input{border-style: none;}
.qnawriteboardtd1{width: 100px;}
.qnawriteboardtd2{}

.writeqna{color:orange; background:gray; border:0; margin-left: 190px; font: 18px bold;}
.exit{color:orange; background:gray; border:0; margin-left: 1px; font: 18px bold;}

</style>

<!-- article 시작 -->

<div class="article">

<div class="mypagewrap">


<!-- 여기부터 페이지마다 바뀜 -->
<%
String id=(String)session.getAttribute("id");
if(id==null) response.sendRedirect("./MemberLogin.me");
%>
<div class="mp7">

<form action="./ProductBoardWriteAction.pbo" method="post">
<input type="hidden" value="${pbean.product_no}" name="product_no">
<input type="hidden" value="${pbean.seller_no }" name="seller_no">
<table class="qnawriteboard">
<tr>
<td class="qnawriteboardtd1">아이디</td>
<td class="qnawriteboardtd2"><input type="text" name="id" value="<%=id %>" readonly></td>
</tr>
<tr>
<td class="qnawriteboardtd1">비밀번호</td>
<td class="qnawriteboardtd2"><input type="text" name="pw"></td>
</tr>
<tr>
<td class="qnawriteboardtd1">문의 제목</td>
<td class="qnawriteboardtd2"><input type="text" name="subject"></td>
</tr>
<tr>
<td class="qnawriteboardtd1">문의 내용</td>
<td class="qnawriteboardtd2"><textarea rows="20" cols="99" name="content"></textarea></td>
</tr>
</table>
<input type="submit" value="등록" class="writeqna">
<input type="button" value="취소" class="exit" onclick="location.href='./ProductBoardList.pbo'">
</form>
	
</div><!-- que1끝 -->
</div><!-- question -->

</div><!-- mp7 -->
<!-- 바뀌는 부분 끝-->
</div><!-- mypagewrap 끝 -->
</div> <!-- article 끝 -->


