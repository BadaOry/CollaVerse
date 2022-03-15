<%@ page language="java"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>

<head>
	<meta charset="UTF-8">
	<title>CollaVerse</title>
	
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/mypage/myFollow/follower.css">
	
	<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
	
	<link rel="stylesheet" href="${ path }/resources/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${ path }/resources/bootstrap/css/bootstrap.css" />
	<script src="${ path }/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="box" style=" overflow-y: scroll;">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<section id="section">
	
		<div class="mini_title" id="mypage_follower_title">
    		<p class="minimini_tilte">나의 팔로워</p><span id="count"> - ${ followerCount } 명</span>
		</div>	
		
 		
		<div class="member_container"> <%-- 한 줄에 7개씩 들어갈 수 있음 --%>
	
			<c:if test="${ !empty followerList }">
			
				<c:forEach var="followerList" items="${ followerList }">
					
					<div class="member_info_container">
						<img id="profile_image" src="${ path }/resources/upload/profile/${ followerList.profileImg }"
							onclick="location.href='${ path }/mypage/collection/list/${ followerList.toMemId }'" />
						<p id="member_nickname">${ followerList.toMemNick }</p>	
					</div>
					
				</c:forEach>
				
			</c:if>
				
			<c:if test="${ empty followerList }">
				<p id="followerList_nothing">팔로워가 존재하지 않습니다.</p>
			</c:if>
			
		</div>
    
    </section>    
    
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>    
	
	
	<script>

	</script>
	
</body>
</html>