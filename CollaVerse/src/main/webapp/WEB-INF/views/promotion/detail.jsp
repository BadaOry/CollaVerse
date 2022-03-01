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
		<div>
			<div class="form_section_content">
				<div id="upload_img"></div>
			</div>
		</div>
		
		<!-- 프로모션 이름 -->
		<hr width="80%">
		<div>
			<div id="upload_name"></div>
		</div>
		<hr width="80%">
		
		<!-- 제품 정보 -->
		
		<div id="goods_information">제품 정보</div>
		
		<div>
			<div>
				<div id="upload_img_"></div>
				<input type="text" value="제품 이름">
				<input type="text" value="제품 가격">
				<input type="text" value="제품 설명 & 획득 조건">
			</div>
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
		<div><label>~~~</label></div>
		
		
		
	</section>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>