<%@page import="MemberBoard.TableModel.MemberBoardbean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- article 시작 -->

<div class="article">
<div class="mypagewrap">
<jsp:include page="../inc/article_mp1.jsp"/>
<!--mp1끝  여기까지 공통-->

<!-- 여기부터 페이지마다 바뀜 -->
<div class="mp7"> 
<div class="subcate_que">
<jsp:include page="../inc/subcate.jsp"/>
</div><!-- subcate_que -->
<%
String id=(String)session.getAttribute("id");
List<MemberBoardbean> boardList=(List<MemberBoardbean>)request.getAttribute("boardList");
int count=((Integer)request.getAttribute("count")).intValue();
String pageNum=(String)request.getAttribute("pageNum");
int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
int startPage=((Integer)request.getAttribute("startPage")).intValue();
int endPage=((Integer)request.getAttribute("endPage")).intValue();
%>
<div class="question">
<div class="que1">
<table>
	<caption>문의내역</caption>
	<tr>
	<td>작성일</td>
	<td>제목</td>
	<td>작성자</td>
	<td>상태</td>
	</tr>
<%if(count==0){%>
<tr>
<td colspan="4">문의내역이 없습니다.</td>
</tr>
</table>
<%}else{for(int i=0;i<boardList.size();i++){MemberBoardbean mbbean=boardList.get(i);%>
 <tr onclick="location.href='./MemberBoardContentAction.mbo?num=<%=mbbean.getNum()%>&pageNum=<%=pageNum%>'">
 <td><%=mbbean.getDate() %></td>
 <td style="cursor: pointer"><%=mbbean.getSubject() %></td>
 <td><%=mbbean.getId() %></td>
 <td>
 <%if(mbbean.getQnastatus()==1){%><span style="color:red;">답변완료</span><%}
 else{%><span style="color:green;">답변대기</span><%}%>
 </td>
 </tr><%}%>
 <tr>
 <td colspan="2">문의내역 : 총 <%=count %>건</td>
 <td colspan="2"><div>
	<%if(count!=0){
	
	if(startPage > pageBlock){%><a href="./MemberBoardList.mbo?pageNum=<%=startPage-pageBlock%>">Prev</a><%}
	
	for(int i=startPage;i<=endPage;i++){%><a href="./MemberBoardList.mbo?pageNum=<%=i%>"><%=i%></a><%}
	
	if(endPage < pageCount){%><a href="./MemberBoardList.mbo?pageNum=<%=startPage+pageBlock%>">Next</a><%}
	
	}%>
</div></td>
</tr>
</table>
<%}

if(id!=null){%><div><input type="button" value="문의하기" class="writeqna" onclick="location.href='./MemberBoardWrite.mbo'"></div><%}%>

</div><!-- que1끝 -->
</div><!-- question -->

</div><!-- mp7 -->
<!-- 바뀌는 부분 끝-->
</div><!-- mypagewrap 끝 -->
</div> <!-- article 끝 -->


