<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>

<head>
	<meta charset="UTF-8">
	<title>CollaVerse</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css">
	<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
</head>
<body class="box" style=" overflow-y: scroll;">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<section id="section">
		
		<div class="logo">
			<img id="logoimage" src="${ path }/resources/images/home/main_image.png">
		</div>
		
		<div class="noticeandrank">
		
			<div class="notice">
			
				<p id="mini_title">공지사항<p>
				
				<div class="content"> 
					내용 실험중 내용 실험중 내용 실험중 내용 실험중 내용 실험중 내용 실험중 내용 실험중 내용 실험중 내용 실험중 내용 실험중 
				</div>
				
			</div>
			
			
			<div class="brandRank">
			
				<p id="mini_title">지금 뜨는 콜라보<p>
				
				<div class="content" id="top3ListContainer">  
					<c:forEach var="top3List" items="${ top3List }">
					
						<div class="pmt_info_container">
							
							<img id="promotion_image" src="${ path }${ top3List.imgPath }${ top3List.no }.jpg"
								onclick="location.href='${ path }/collabo/promotion/detail?pmtNo=${ top3List.no }'" />
							
							<p id="pmt_title">${ top3List.title }</p>	
						
						</div>
					</c:forEach>					
				</div>

			
			</div>
		
		
			<div class="collectionRecommend">
			
				<p id="mini_title">컬렉션 추천<p>
				
				<div class="content" id="collectionRecommendContent"> 
					<c:forEach var="randomUserList" items="${ randomUserList }" begin="0" end="2">
					
						<div class="member_info_container">
							
							<img id="profile_image" src="${ path }/resources/upload/profile/${ randomUserList.profile_img }"
								onclick="location.href='${ path }/mypage/collection/list/${ randomUserList.id }'" />
							<p id="member_nickname">${ randomUserList.nickname }</p>	
						
						</div>
					</c:forEach>					
				</div>
			
			</div>
			
		</div>
		

			
	</section>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>