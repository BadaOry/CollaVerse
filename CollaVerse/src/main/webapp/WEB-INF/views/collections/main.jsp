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

<style>
        #userContainer .box{
            height: 500px; background: tomato; color:white;
            box-sizing: border-box; padding: 30px 10px;
        }
        #userContainer .box:nth-child(2n) { background: teal;}
    </style>
    
</head>

<body class="box" style=" overflow-y: scroll;">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
    <div class="mini_title" id="search_user_title">
    
    	<p id="search_user_title_text">컬렉션 검색</p>	

    </div>
	
	<div id="order_container">
	
   			<p id="orderby">컬렉션 정렬 방식 </p>    	   	   
    		 
    		<p id="orderby2">
    			<a onclick="location.href='${ path }/collections/search/only_brand'">브랜드  </a>	
    		</p>

 			<p id="orderby">│</p> 
 			
	    	<p id="orderby3">
	    		<a onclick="location.href='${ path }/collections/search/only_user'">콜라버스 유저</a>
			</p>
	
	</div>
	
	
	<div id="searchContainer">

		 <form name="collectionWriteFrm" action="${ path }/collections/search/result" method="POST">

			
			<select name="searchCategory" id="searchCategory">
				<option value="id">ID</option>
					 
		        <option value="nickname">닉네임</option>
				
			</select>
			<input type="text" name="keyword" id="searchUser" placeholder="아이디를 입력해주세요" required>
			<input type="submit" id="searchSubmit" value="검색">

		</form>

	
	</div>
	
		
	<div id="userContainer">
	
			<c:forEach var="allUserList"  items="${ allUserList }">
			
				<div class="user_info_container">
					<img id="profile_image" src="${ path }/resources/upload/profile/${ allUserList.profile_img }"
						onclick="location.href='${ path }/mypage/collection/list/${ allUserList.id }'" />
				
					<p id="user_nickname"> ${ allUserList.nickname } </p>
				</div>
						
			</c:forEach>

		
	</div>
		
		<%-- 
		
			<div>
				<c:forEach var="infiniteUserList"  items="${ infiniteUserList }">
				
					<div class="user_info_container">
						<img id="profile_image" src="${ path }/resources/upload/profile/${ infiniteUserList.Collections.profile_img }"
							onclick="location.href='${ path }/mypage/collection/list/${ infiniteUserList.Collections.id }'" />
					
						<p id="user_nickname"> ${infiniteUserList.Collections.nickname } </p>
					</div>
							
				</c:forEach>
				
			</div>
		 -->
		 
		
		<!--  인피니트 코드 실습 #1
		
		<div class="box"> 1번째 블록</div>
		<div class="box"> 2번째 블록</div>
		
		 -->
		 



	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<script>
		<%-- 인피니트 코드 실습 #1 
		var count =2;
		var userList = ${ userList };
		
	    window.onscroll = function() {
	        if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
	            var toAdd = document.createElement("div");
	            toAdd.classList.add("box")
	            toAdd.textContent = ++count +  "번째 블록"
	            if()
	            document.querySelector('#userContainer').appendChild(toAdd);
	        }
	    }
		
		
	
	</script>
		--%>

	
</body>
</html>