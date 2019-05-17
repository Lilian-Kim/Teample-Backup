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
String pageNum = request.getParameter("pageNum");
int num = Integer.parseInt(request.getParameter("num"));
%>
<div class="mp7"> 
<div class="subcate_que">
<jsp:include page="../inc/subcate.jsp"/>
</div><!-- subcate_que -->

<form action="./MemberBoardDeleteAction.mbo?pageNum=<%=pageNum %>" method="post">
<input type="hidden" name="num" value="<%=num%>">
<div class="question_deldiv">
<table class="question_deltb">
<tr>
<td>이름</td>
<td><input type="text" name="name" value="<%=id %>" readonly></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="password" name="pw"></td>
</tr>
</table>

<div class="question_delbtn">
<input type="submit" value="삭제하기" class="btn1">
<input type="button" value="목록" class="btn2" onclick="location.href='./MemberBoardList.mbo?pageNum=<%=pageNum%>'">
</div>
</div>
</form>
	
</div><!-- que1끝 -->
</div><!-- question -->

</div><!-- mp7 -->
<!-- 바뀌는 부분 끝-->
</div><!-- mypagewrap 끝 -->
</div> <!-- article 끝 -->


