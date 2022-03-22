<%@ page language="java"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>

<head>
<meta charset="UTF-8">
<title>CollaVerse</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/collections/search/only_brand.css">
<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
</head>

<body class="box" style=" overflow-y: scroll;">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
    <div class="mini_title" id="search_user_title">
    
    	<p id="search_user_title_text">컬렉션 검색</p>	
    	
    </div>
    
	<div id="order_container">
	
   			<p id="orderby">컬렉션 정렬 방식 </p>    	

    		<p id="orderby2">
    			<a onclick="location.href='${ path }/collections/search/only_brand'"><strong>브랜드  </strong></a>	
    		</p>

 			<p id="orderby">│</p> 
 			
	    	<p id="orderby3">
	    		<a onclick="location.href='${ path }/collections/search/only_user'">콜라버스 유저</a>
			</p>
	
	</div>
	
	
	<div id="searchContainer">
	
		 <form name="collectionWriteFrm" action="${ path }/collections/search/result_brand" method="POST">

			<select name="searchCategory" id="searchCategory">
				<option value="id">ID</option>
		        <option value="nickname" 
					<c:if test="${ map.searchOption == 'nickname' }">selected</c:if>
		        >닉네임</option>			
			</select>
			<input type="text" name="keyword" id="searchUser" placeholder="검색 내용을 입력해주세요" value="${ map.keyword }" required>
			<input type="submit" id="searchSubmit" value="검색">

		</form>

	
	</div>
	
	<div id="userContainer">
		<c:if test="${ !empty brandUserList }">
		
			<c:forEach var="brandUserList"  items="${ brandUserList }">
			
				<div class="user_info_container">
					<img id="profile_image" src="${ path }/resources/upload/profile/${brandUserList.profile_img }"
						onclick="location.href='${ path }/mypage/collection/list/${ brandUserList.id }'" />
				
					<p id="user_nickname"> ${ brandUserList.nickname } </p>
				</div>
						
			</c:forEach>
		
		</c:if>
		
		<c:if test="${ noFindList == '없음' }">
		
			<p id="noSerachList"> 검색 결과가 존재하지 않습니다. </p>
			
		</c:if>
		
	</div>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<script>
		
	
	</script>

	
</body>
</html>