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
			
				<p id="mini_title">서비스 공지사항<p>
				
				<div class="noticecontent"> 
				
					<c:forEach var="recentNoticeList" items="${ recentNoticeList }" begin="0" end="2">
						
						<div class="notice_div">
							<p class="notice_title" onclick="location.href='${ path }/notice/read?bno=${ recentNoticeList.bno }'"> ${ recentNoticeList.title }</p>
						</div>
						
					</c:forEach>
					
				</div>
				
			</div>
			
			
			<div class="brandRank">
			
				<p id="mini_title">지금 뜨는 콜라보<p>
				
				<div class="content" id="top3ListContainer"> 
					
					<div class="top3" id="top3List_1">
						<p class="prize" id="first">1위 </p>
						<p class="pmtHearHit"> 좋아요 수 : ${ top3List[0].heartHit }</p>
						<img id="promotion_image" src="${ path }${ top3List[0].imgPath }${ top3List[0].no }.jpg"
								onclick="location.href='${ path }/collabo/promotion/detail?pmtNo=${ top3List[0].no }'" />
						<p id="pmt_title">${ top3List[0].title }</p>	
					</div>
					
					<div class="top3" id="top3List_2">
						<p class="prize" id="second">2위</p>
						<p class="pmtHearHit"> 좋아요 수 : ${ top3List[1].heartHit }</p>
						<img id="promotion_image" src="${ path }${ top3List[1].imgPath }${ top3List[1].no }.jpg"
								onclick="location.href='${ path }/collabo/promotion/detail?pmtNo=${ top3List[1].no }'" />
						<p id="pmt_title">${ top3List[1].title }</p>
					</div>
					
					<div class="top3" id="top3List_3">
						<p class="prize" id="third">3위</p>
						<p class="pmtHearHit"> 좋아요 수 : ${ top3List[2].heartHit }</p>
						<img id="promotion_image" src="${ path }${ top3List[2].imgPath }${ top3List[2].no }.jpg"
								onclick="location.href='${ path }/collabo/promotion/detail?pmtNo=${ top3List[2].no }'" />
						<p id="pmt_title">${ top3List[2].title }</p>
					</div>

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