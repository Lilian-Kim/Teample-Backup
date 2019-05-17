<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- article 시작 -->
<div class="article">
<div class="mypagewrap">
<jsp:include page="../inc/article_mp1.jsp"/>
<!--mp1끝  여기까지 공통-->

<!-- 여기부터 페이지마다 바뀜 -->
<%
String id=(String)session.getAttribute("id");
if(id==null) response.sendRedirect("./MemberLogin.me");
%>
<div class="mp7"> 
<div class="subcate_que">
<jsp:include page="../inc/subcate.jsp"/>
</div><!-- subcate_que -->

<form action="./MemberBoardWriteAction.mbo" method="post">
<table class="qnawriteboard">
<tr>
<td>아이디</td>
<td><input type="text" name="id" class="qnawrite_id" value="<%=id %>" readonly></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="password" class="pwd" name="pw"></td>
</tr>
<tr>
<td>문의 제목</td>
<td><input  type="text" class="sub" name="subject"></td>
</tr>
<tr>
<td>문의 내용</td>
<td ><textarea rows="20" cols="99" name="content"></textarea></td>
</tr>
</table>
<div class="qnawrite_btn">
<input type="submit" value="등록" class="writeqna">
<input type="button" value="취소" class="exit" onclick="location.href='./MemberBoardList.mbo'">
</div><!-- 버튼 두개 div 끝 -->
</form>
	
</div><!-- mp7 -->
<!-- 바뀌는 부분 끝-->
</div><!-- mypagewrap 끝 -->
</div> <!-- article 끝 -->


