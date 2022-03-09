<%@ page language="java"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>

<head>
	<meta charset="UTF-8">
	<title>CollaVerse</title>
	
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/mypage/myFollow/main.css">
	
	<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
	
	<link rel="stylesheet" href="${ path }/resources/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${ path }/resources/bootstrap/css/bootstrap.css" />
	<script src="${ path }/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="box" style=" overflow-y: scroll;">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<section id="section">
	
	    <div class="mini_title" id="mypage_myfollow_title">
    		<p id="myfollow_title">My 팔로우</p>
		</div>
		
		
		<div id="following_container">
			<p class="minimini_tilte" onclick="location.href='${ path }/mypage/myFollow/following'">나의 팔로우</p><p id="count"> - n 명</p>
			
			<div class="member_container">
				
			</div>
		</div>
		
		
		<div id="follower_container">
			<p class="minimini_tilte" onclick="location.href='${ path }/mypage/myFollow/follower'">나의 팔로워</p><span id="count"> - n 명</span>
			
			<div class="member_container">
				
			</div>
					
		</div>
    
    </section>    
    
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>    
	
	
	<script>

	</script>
	
</body>
</html>