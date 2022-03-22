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
		
		
		<div class="follower_wrap" id="following_container">
			<p class="minimini_tilte" onclick="location.href='${ path }/mypage/myFollow/following'">나의 팔로우</p><p id="count"> - ${ followingCount } 명</p>
			
			<c:choose>
			
				<c:when test="${ !empty followingList }">
				
					<c:forEach var="followingList" items="${ followingList }" begin="0" end="5">
							
						<div class="member_info_container">
							<img id="profile_image" src="${ path }/resources/upload/profile/${ followingList.profileImg }"				
								 onclick="location.href='${ path }/mypage/collection/list/${ followingList.toMemId }'" />
								 
							<p id="member_nickname">${ followingList.toMemNick }</p>	
						</div>
						
					</c:forEach>
				
					<div class="plus_container">
						<span onclick="location.href='${ path }/mypage/myFollow/following'"> ▶ 더보기 </span>
					</div>
					
				</c:when>
				
				<c:otherwise>
				
					<p id="no_followernList">팔로우가 존재하지 않습니다.</p>
					
				</c:otherwise>
				
			</c:choose>
				
				
	
		</div>
		
		
		<div class="follower_wrap" id="follower_container">
			<p class="minimini_tilte" onclick="location.href='${ path }/mypage/myFollow/follower'">나의 팔로워</p><span id="count"> - ${ followerCount } 명</span>
				
				<c:choose>
					<c:when test="${ !empty followerList }">
						<c:forEach var="followerList" items="${ followerList }" begin="0" end="5">
						
							<div class="member_info_container">
								<img id="profile_image" src="${ path }/resources/upload/profile/${ followerList.profileImg }"
									onclick="location.href='${ path }/mypage/collection/list/${ followerList.toMemId }'" />
								<p id="member_nickname">${ followerList.toMemNick }</p>	
							</div>
						
						</c:forEach>
						
						<div class="plus_container">
							<span onclick="location.href='${ path }/mypage/myFollow/follower'"> ▶ 더보기 </span>
						</div>
						
					</c:when>
					
					<c:otherwise>
				
						<p id="no_followernList">팔로워가 존재하지 않습니다.</p>
					
					</c:otherwise>
				
				</c:choose>
											
		</div>
    
    </section>    
    
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>    
	
	
	<script>

	</script>
	
</body>
</html>