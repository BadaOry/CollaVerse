<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>

<head>
	<meta charset="UTF-8">
	<title>CollaVerse</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body class="box" style=" overflow-y: scroll;">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<section id="section">
	
		<div id="search">
			<form id="form" action="freeList">
				<select>
					<option>제목</option>
					<option>내용</option>
					<option>작성자</option>
					<option>제목+내용</option>
				</select>
				<input type="text" id="search_input">
				<button type="submit">검색</button>
			</form>
		</div>
		
		<div class="eventbanner">이벤트 배너</div>
		
		<div class="calendar">캘린더</div>
		
		<div class="noticeandrank">
			<div class="notice">공지사항</div>
			
			<div class="rank">랭킹</div>
		</div>
		
		<!-- 
		<div class="image-box">
			<div class="ganzi">
				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1037366/planet2.png">
			  	<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/1037366/three.js'></script>
				<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/1037366/CanvasRenderer.js'></script>
				<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/1037366/Projector.js'></script>
			    <script src="js/index.js"></script>
		    </div>
	    </div>
	     -->
		
		<!-- <div class="container">
		    <div class="image vh-fix"></div>
		    <div class="image vh-fix"></div>
		    <div class="image vh-fix"></div>
		    <div class="image vh-fix"></div>
		    <div class="image vh-fix"></div>
		    <div class="image vh-fix"></div>
		    <div class="image vh-fix"></div>
		    <div class="image vh-fix"></div>
		    <div class="image vh-fix"></div>
		    <div class="image vh-fix"></div>
		</div>
		
 		<script type="module" src="js/script.js"></script>  -->
			
	</section>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>