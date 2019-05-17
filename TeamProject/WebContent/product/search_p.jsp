<%@ page import="Engine.ProductInfo"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="Engine.JsonParse"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.jdom2.Element"%>
<%@ page import="org.jdom2.Document"%>
<%@ page import="org.jdom2.input.SAXBuilder"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.List"%>
<%@ page import="java.net.URL"%>
<%@ page import="org.xml.sax.InputSource"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String str = request.getParameter("str"); //넘겨받은 검색어
	str = str.replaceAll("\\p{Z}", ""); //검색어 공백제거.
	HashMap<Integer, ProductInfo> searchInfo = JsonParse.parse(str);
%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	/* 	border: 1px solid red;   */
	text-decoration: none;
	border-collapse: collapse;
	outline: none;
}

body {
	box-sizing: border-box;
	color: #333;
	font-family: "맑은 고딕";
	width:620px;
}


a {
	text-decoration: none;
	color: inherit;
}

.cont{
width:620px;
/* height:100%; */
/* overflow:hidden; */
/* border:1px solid red; */
}

.cont hr{
border:2px solid #ff5000;
}

.search_list01{
/* border:1px solid blue; */
padding-left:20px;

}

.search_list01 .s_list0{
width:600px;
height:180px;
/* border:1px solid green;  */

}

.search_list01 .s_list0 .search_img {
 	border:1px solid #A1A1A1; 
	width: 112px;
	height: 160px;
	float:left;
	box-sizing:border-box;
	border-right:none;
}

.search_list01 .s_list0 table {
/*  	border:1px solid yellow;   */
	height: 160px;
	width: 450px;
	font-size: 12px;
/* 	margin-left:10px; */
}

.search_list01 .s_list0  td {
border:1px solid #A1A1A1; 
padding-left:5px;
}

.search_list01 .s_list0 td:first-child{
width:55px;
background:#3A4154;
font-weight:bold;
color:#fff;
}

.list_none{
width:250px;
height:80px;
padding:60px 10px 10px 50px;
font-size:12px;
font-weight:bold;
color:#797979;
margin: 0 auto;
}

</style>
<script type="text/javascript">
function resizeWindow(win)    {
	var wid = win.document.body.offsetWidth + 16;
	var hei = win.document.body.offsetHeight + 67;        //60 과 70은 여백.
	win.resizeTo(wid,hei);
	}
</script>

</head>
<body onload='resizeWindow(this)'>
<div class="cont">

<hr>
	<div class="search_list01">
		<h4>상품 가격 비교</h4>
		<c:set var="searchinfo" value="<%=searchInfo %>">
		</c:set>
		<c:if test="${!empty searchinfo }">
		<%
			for (ProductInfo pinfo : searchInfo.values()) {
				String title = pinfo.getTitle();
				String price_min = pinfo.getPrice_min();
				String maker = pinfo.getMaker();
				String brand = pinfo.getBrand();
				String category_name = pinfo.getCategory_name();
				String shoppingmall = pinfo.getShoppingmall();
				String link = pinfo.getLink();
				String image_url = pinfo.getImage_url();
		%>
		<a href="<%=link%>" target="_blank"><div class="s_list0">
			<div class="search_img">
				<img src="<%=image_url%>" alt="" height="158" width="110" />
			</div>
				<table>
					<tr>
						<td>상품명</td>
						<td><%=title%></td>
					</tr>
					<tr>
						<td>최저가</td>
						<td><%=price_min%>원</td>
					</tr>
					<tr>
						<td>메이커</td>
						<td><%=maker%></td>
					</tr>
					<tr>
						<td>브랜드</td>
						<td><%=brand%></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td><%=category_name%></td>
					</tr>
					<tr>
						<td>쇼핑몰</td>
						<td><%=shoppingmall%></td>
					</tr>
				</table>
				
		</div></a>
		<%
			}
		%>
		</c:if>
		<c:if test="${empty searchinfo}">
			<div class="list_none">
			일치하는 상품이 존재하지 않습니다.
			</div>
		</c:if>
	</div>
	<hr>
</div>
</body>
</html>
