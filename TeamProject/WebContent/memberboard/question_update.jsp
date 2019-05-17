<%@page import="MemberBoard.TableModel.MemberBoardbean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- article 시작 -->
<div class="article">
<div class="mypagewrap">
<jsp:include page="../inc/article_mp1.jsp"/>
<!--mp1끝  여기까지 공통-->

<!-- 여기부터 페이지마다 바뀜 -->
<%
String id = (String)session.getAttribute("id");
if(id==null) response.sendRedirect("./MemberLogin.me");
MemberBoardbean mbbean = (MemberBoardbean)request.getAttribute("mbbean");
String pageNum = (String)request.getAttribute("pageNum");
%>
<div class="mp7"> 
<div class="subcate_que">
<jsp:include page="../inc/subcate.jsp"/>
</div><!-- subcate_que -->

<%if(id.equals("admin")){%>

<table class="question_uptbl1">
<tr>
<td>고객 아이디</td>
<td><input type="text" class="uptbl1_id" name="id" value="<%=mbbean.getId() %>" readonly></td>
</tr>
<tr>
<td>문의 제목</td>
<td><input type="text" class="uptbl1_sub" name="subject" value="<%=mbbean.getSubject()%>" readonly></td>
</tr>
<tr>
<td>문의 내용</td>
<td><textarea rows="13" cols="40" name="content" readonly><%=mbbean.getContent() %></textarea></td>
</tr>
</table>

<form action="./MemberBoardUpdateAction.mbo?pageNum=<%=pageNum %>" method="post">
<input type="hidden" name="num" value="<%=mbbean.getNum()%>">
<input type="hidden" name="id" value="admin">


<table class="question_uptbl2">
<tr>
<td>답변 내용</td>
<td><textarea rows="20" cols="40" name="reply"></textarea></td>
</tr>
</table>

<div class="question_upbtn">
<input type="submit" value="답변등록" class="btn">
<input type="reset" value="리셋" class="btn">
<input type="button" value="목록" class="btn" onclick="location.href='./MemberBoardList.mbo?pageNum=<%=pageNum%>'">
</div>
</form>

<%}else{%>

<form action="./MemberBoardUpdateAction.mbo?pageNum=<%=pageNum %>" method="post">
<input type="hidden" name="num" value="<%=mbbean.getNum()%>">

<table class="question_uptbl3">
<tr>
<td>아이디</td>
<td><input type="text" class="question_upid" name="id" value="<%=id %>" readonly></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="text" class="pwd" name="pw"></td>
</tr>
<tr>
<td>제목</td>
<td><input type="text" name="subject" value="<%=mbbean.getSubject()%>"></td>
</tr>
<tr>
<td>내용</td>
<td><textarea rows="13" cols="40" name="content"><%=mbbean.getContent() %></textarea></td>
</tr>
</table>

<div class="question_upbtn">
<input type="submit" value="수정하기" class="btn">
<input type="reset" value="리셋" class="btn">
<input type="button" value="목록" class="btn" onclick="location.href='./MemberBoardList.mbo?pageNum=<%=pageNum%>'">
</div>
</form>
	
<%}%>

</div><!-- mp7 -->
<!-- 바뀌는 부분 끝-->
</div><!-- mypagewrap 끝 -->
</div> <!-- article 끝 -->
