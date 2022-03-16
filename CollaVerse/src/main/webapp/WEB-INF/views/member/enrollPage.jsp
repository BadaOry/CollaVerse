<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>
<head>
	<title>CollaVerse</title>
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/enrollPage.css">
	<script src="${ path }/js/jquery-3.6.0.js"></script>
	
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

		<div class="enroll" align="center">
			<p class="mini-title">회원가입</p>
			<div class="enroll2" align="center">
				<input type="button" id="personal" value="개인회원가입" onclick="location.href='${ path }/member/terms'">
				<input type="button" id="business" value="사업자회원가입" onclick="location.href='${ path }/member/terms_business'">
			</div>
		</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
