
<%@page import="ProductBoard.TableModel.ProductBoardbean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- article 시작 -->
<div class="article">
<div class="mypagewrap">

<!--mp1끝  여기까지 공통-->

<!-- 여기부터 페이지마다 바뀜 -->
<%
String id = (String)session.getAttribute("id");
if(id==null) response.sendRedirect("./MemberLogin.me");
String pageNum = request.getParameter("pageNum");
ProductBoardbean pbbean = (ProductBoardbean)request.getAttribute("pbbean");
int num = Integer.parseInt(request.getParameter("num"));
%>
<div class="mp7"> 
<div class="subcate_que">

</div><!-- subcate_que -->

<form action="./ProductBoardDeleteAction.pbo" method="post">
<input type="hidden" name="num" value="<%=num%>">

<table class="question_deltb">
<tr>
<td>아이디</td>
<td><input type="text" name="id" value="<%=id %>" readonly></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="password" name="pw"></td>
</tr>
</table>

<div class="question_delbtn">
<input type="submit" value="삭제하기" class="btn1">
<input type="button" value="목록" class="btn2" onclick="location.href='./ProductBoardList.pbo'">
</div>
</form>
	
</div><!-- que1끝 -->
</div><!-- question -->

</div><!-- mp7 -->
<!-- 바뀌는 부분 끝-->
</div><!-- mypagewrap 끝 -->
</div> <!-- article 끝 -->


