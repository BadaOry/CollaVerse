<%@ page language="java"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>

<head>
<meta charset="UTF-8">
<title>CollaVerse</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/collections/main.css">
<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
</head>

<body class="box" style=" overflow-y: scroll;">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
    <div class="mini_title" id="search_user_title">
    
    	<p id="search_user_title_text">컬렉션 검색</p>	
    	
    </div>
	
	<div id="searchContainer">

		 <form name="collectionWriteFrm" action="${ path }/collections/search" method="POST">

			
			<select name="searchCategory" id="searchCategory">
				<option value="id">ID</option>
					 
		        <option value="nickname">닉네임</option>
				<%--
				<option value="id">ID</option>
				<option value="nickname">닉네임</option>	
				 --%>				
			</select>
			<input type="text" name="keyword" id="searchUser" placeholder="아이디를 입력해주세요" required>
			<input type="submit" id="searchSubmit" value="검색">

		</form>

	
	</div>
	
		
	<div id="userContainer">
	
		<c:forEach var="userList"  items="${ userList }">
		
			<div class="user_info_container">
				<img id="profile_image" src="${ path }/resources/upload/profile/${ userList.profile_img }"
					onclick="location.href='${ path }/mypage/collection/list/${ userList.id }'" />
			
				<p id="user_nickname"> ${ userList.nickname } </p>
			</div>
					
		</c:forEach>
		
	</div>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<script>
		
	
	</script>

	
</body>
</html>