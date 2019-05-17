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

<table class="qnaread">
<tr>
<td>제목</td>
<td colspan="3"><%=mbbean.getSubject() %></td>
</tr>
<%-- <tr>
<td>임시1</td>
<td><%=mbbean.getNum() %></td>
<td>임시2</td><td><%=mbbean.getReadcount() %></td>
</tr> --%>
<tr>
<td>작성자</td>
<td><%=mbbean.getId() %></td>
<td>작성일</td><td><%=mbbean.getDate() %></td>
</tr>
<tr>
<td class="qnareadtd1">내용</td>
<td colspan="3"><%=mbbean.getContent() %></td>
</tr>
<%if(mbbean.getQnastatus()==1){%><tr style="border:1px solid gray;"><td class="qnareadtd1">답변내용&nbsp;&nbsp;&nbsp;</td>
<td colspan="3"><%=mbbean.getReply() %></td></tr><%}%>
</table>

<div class="qnaread_btn">
<%if(id!=null){if(id.equals("admin")){%>
	
<input type="button" value="답변하기" class="btn replybtn"
 onclick="location.href='./MemberBoardUpdate.mbo?num=<%=mbbean.getNum()%>&pageNum=<%=pageNum%>'">
<%-- <input type="button" value="답변달기"  class="btn"
  onclick="location.href='./MemberBoardReply.mbo?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'"> --%>

<%}else{%>

<input type="button" value="글수정" class="btn updatebtn"
 onclick="location.href='./MemberBoardUpdate.mbo?num=<%=mbbean.getNum()%>&pageNum=<%=pageNum%>'">
<input type="button" value="글삭제" class="btn deletebtn"
 onclick="location.href='./MemberBoardDelete.mbo?num=<%=mbbean.getNum()%>&pageNum=<%=pageNum%>'">

<%}
}%>
<input type="button" value="목록보기" class="btn exitbtn" 
   onclick="location.href='./MemberBoardList.mbo?pageNum=<%=pageNum%>'">
</div><!--"qnaread_btn" 끝-->
	
</div><!-- mp7 -->
<!-- 바뀌는 부분 끝-->
 </div> <!-- mypagewrap 끝 -->
</div> <!-- article 끝 -->


