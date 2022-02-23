<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<section>
		<!-- 대표 프로모션 이미지 -->
		<form method="" enctype=""></form>
		
		<hr width="80%">
			<input type="text" value="프로모션 이름">
		<hr width="80%">
		
		<!-- 제품 정보 -->
		<div>
			<input type="image" src="">
			<input type="text" value="제품 이름">
			<input type="text" value="제품 가격">
			<input type="text" value="제품 설명 & 획득 조건">
		</div>
		
		<div>
			<input type="image" src="">
			<input type="text" value="제품 이름">
			<input type="text" value="제품 가격">
			<input type="text" value="제품 설명 & 획득 조건">
		</div>
		
		<div>
			<input type="image" src="">
			<input type="text" value="제품 이름">
			<input type="text" value="제품 가격">
			<input type="text" value="제품 설명 & 획득 조건">
		</div>
		
		<h1>프로모션 설명</h1>
		<input type="text" value="콜라버스 관리자가 이미지 & 텍스트로 입력">
		
		
		
	</section>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>