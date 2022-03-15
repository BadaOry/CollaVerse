<%@ page language="java"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>

<head>
	<meta charset="UTF-8">
	<title>CollaVerse</title>
	
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/mypage/myFollow/following.css">
	
	<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
	
	<link rel="stylesheet" href="${ path }/resources/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${ path }/resources/bootstrap/css/bootstrap.css" />
	<script src="${ path }/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="box" style=" overflow-y: scroll;">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<section id="section">
	
		<div class="mini_title" id="mypage_follow_title">
			<p class="minimini_tilte">나의 팔로우</p><span id="count"> - ${ followingCount } 명</span>
		</div>
		
		
		<div class="member_container"> <%-- 한 줄에 7개씩 들어갈 수 있음 --%>
	
			<c:if test="${ !empty followingList }">
			
				<c:forEach var="followingList" items="${ followingList }">
					
					<div class="member_info_container">
						<img id="profile_image" src="${ path }/resources/upload/profile/${ followingList.profileImg }" 					
							 onclick="location.href='${ path }/mypage/collection/list/${ followingList.toMemId }'" />
							 
						<p id="member_nickname">${ followingList.toMemNick }</p>	
					</div>
					
				</c:forEach>
				
			</c:if>
				
			<c:if test="${ empty followingList }">
				<p id="followerList_nothing">팔로우가 존재하지 않습니다.</p>
			</c:if>
			
		</div>
	
    
    </section>    
    
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>    


	
	<script>

	</script>
	
</body>
</html>