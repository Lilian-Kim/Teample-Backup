<%@page import="Member.TableModel.Memberbean"%>
<%@page import="Member.TableModel.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String id = (String)session.getAttribute("id");
MemberDAO mdao = new MemberDAO();
Memberbean mbean = new Memberbean();
mbean = mdao.userInfo(id);
String creditrate = mdao.checkCreditRate(mbean.getSeller_no());
%>

<div class="mp1">

<div class="mp1_01"><span>${mbean.name }</span>님의 등급은 
<span style="font-weight: bold;">
<c:if test="${mbean.grade == 0}"><font color="#76C50C">NEW</font></c:if>
<c:if test="${mbean.grade == 1}"><font color="#BDBDBD">SILVER</font></c:if>
<c:if test="${mbean.grade == 2}"><font color="#FFCD12">GOLD</font></c:if>
<c:if test="${mbean.grade == 3}"><font color="#C98AFF">VIP</font></c:if>
<c:if test="${mbean.grade == 4}"><font color="#000000">VVIP</font></c:if>
<c:if test="${mbean.grade == 5}"><font color="#FF007F">THE FIRST</font></c:if>
</span>입니다.&nbsp;신용도:<%=creditrate %></div>

<div class="mp1_02"><span><fmt:formatNumber value="${mbean.money }" type="number"/></span>원</div>

<div class="mp1_li">
<ul>
<c:if test="${empty tlist}">
<li><a href="./ProductTenderList.pro"><span>0건</span></a></li></c:if>
<c:if test="${!empty tlist}">
<li><a href="./ProductTenderList.pro"><span>${fn:length(tlist) }건</span></a></li></c:if>
<c:if test="${empty plist}">
<li><a href="./ProductSellListAction.pro"><span>0건</span></a></li></c:if>
<c:if test="${!empty plist}">
<li><a href="./ProductSellListAction.pro"><span>${fn:length(plist) }건</span></a></li></c:if>

<li><a href="./MemberMyMoney.me"><span><fmt:formatNumber value="${mbean.money }" type="number"/>원</span></a></li>
<li><a href="./SellCompletedAction.tra"><span>0건</span></a></li>
<li><a href="./MemberBoardList.mbo"><span>${mantomancount }건</span></a></li>
</ul>
</div>
</div>