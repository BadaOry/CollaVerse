<%@ page language="java"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>

<head>
	<meta charset="UTF-8">
	<title>CollaVerse</title>
	
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/information.css">
	
	<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
	
</head>
<body class="box" style=" overflow-y: scroll;">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
		
	<section id="section">
		
		<div id="welcomImgContainer">
			<img id="welcomeImg" src="${ path }/resources/images/home/welcome.png" />
		</div>
		
		<div id="contentContainer">
			<div id="miniTitle">
				<span class="purple"> Colla </pspan> <span class="gray">boration</span>
				<span class="yellow">+</span>
				<span class="gray"> uni</span> <span class="purple">  Verse</span>
			</div>
			
			<div id="content">
				<p class="content_text">콜라보의 우주를 여행하는 여행자님, 어서오세요.</p>
				
				<p class="content_text">세상의 모든 콜라보 아이템을 모아놓은 작은 우주 CollaVerse 입니다.</p>
				
				<p class="content_text">CollaVerse 에서 편리하게 콜라보 브랜드 소식을 받아보세요.</p>
				
				</span>
				
			</div>
			
			<div id="infoContainer">
			
				<div id="forUserContainer">
					<p id="guide_title_user">CollaVerse 여행자 가이드</p>
					<p class="guide_content"><strong>여행자는 이런것을 할 수 있어요 !</strong></p>
					
					<ul style="padding: 0;">
						<li class="user_li">편리한 콜라보 아이템 정보 확인</li>
						<li class="user_li">팔로우를 통한 브랜드 소식 확인</li>
						<li class="user_li">한정판 콜라보 아이템 일정 관리</li>
						<li class="user_li">나만의 콜라보 컬렉션 만들기</li>
						<li class="user_li">다른 여행자의 컬렉션 구경하기 & 팔로우</li>
					</ul>
					
				</div>
				
				
				<div id="forBrandContainer">
					<p id="guide_title_brand">CollaVerse 기업 회원 가이드</p>
					<p class="guide_content"><strong>기업 회원은 이런것을 사용할 수 있어요 !</strong></p>
					
					<ul style="padding: 0;">
						<li class="brand_li">CollaVerse 플랫폼을 통한 <br>빠르고 손쉬운 콜라보 제품 마케팅</li>
						<li class="brand_li">내용만 전해주면 끝! <br>편리한 프로젝트 정보 관리</li>
						<li class="brand_li">고객들의 실시간 피드백을 확인하는 마케팅 툴</li>
						<li class="brand_li">CollaVerse 에서 제공하는 마케팅 통계 <br>(좋아요, 팔로우 등)</li>
						<li class="brand_li">자사 프로젝트 일정 관리</li>
					</ul>
					
				</div>
				
			</div>
			
		</div>
    
    </section>    
    
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>   
	

</body>
</html>