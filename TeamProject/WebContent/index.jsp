<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >

<c:set var="center" value="${param.center}" />
<c:if test="${center == null }">
   <c:set var="center" value="inc/article.jsp"/>
</c:if>
	<jsp:include page="inc/header.jsp"/>
	<jsp:include page="${center}"/>
	<jsp:include page="inc/footer.jsp"/>
	