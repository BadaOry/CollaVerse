<%@ page language="java"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>CollaVerse</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
	<header>
		<div id="header2">
			<c:if test="${ empty loginMember }">
				<table id="table">
					<thead>
						<tr>

						
							<td><span class="myinfo" onclick="location.href='${ path }/member/enrollPage'">회원가입</span></td>
							<td style="color: white; font-size:12px; font-family: 'Sam3KRFont';"> │ </td>
							<td><span class="myinfo" id="login" onclick="location.href='${ path }/member/login'">로그인</span></td>		

						</tr>
					</thead>
				</table>
			</c:if>
			<c:if test="${ !empty loginMember }">
				<table id="table">
					<thead>
						<tr>
							<td colspan="3" id="welcome"><span id="memebr_nickname">${ loginMember.nickname }</span> <span>님 환영합니다! </span></td>
							
						</tr>
						<tr style="height: 30px"> 
							<c:if test="${ loginMember.role == '개인'}">
								<td style="text-align: center;"><span class="myinfo" onclick="location.href='${ path }/member/myPage'">내정보</span></td>
								<td style="color: white; font-size:12px; font-family: 'Sam3KRFont';"> │ </td>
							</c:if>
							<c:if test="${ loginMember.role == '기업'}">
								<td style="text-align: center;"><span class="myinfo" onclick="location.href='${ path }/member/myPage_business'">내정보</span></td>
								<td style="color: white; font-size:12px; font-family: 'Sam3KRFont';"> │ </td>
							</c:if>
							<td><span id="logout" onclick="location.href='${ path }/member/logout'">로그아웃</span></td>
						</tr>
					</thead>
				</table>
			</c:if>
			
		</div>
	

		<div id="header1">
			<p id="title">
				<a href="${ path }/">
					CollaVerse
				</a>
			</p>
		</div>
		
		
		
		<div id="header3">
			<nav class="header_nav">
				<ul>
					<li><a class="menu_title" href="${ path }/notice/noticeList">공지사항</a></li>

					<li><a class="menu_title"  href="${ path }/collabo/promotion/main">콜라보</a>
						<ul>
							<li><a class="header_nav1" href="${ path }/collabo/category/living/livingList">리빙</a></li>
							<li><a class="header_nav1" href="${ path }/collabo/category/culture/cultureList">문화</a></li>
							<li><a class="header_nav1" href="${ path }/collabo/category/food/foodList">식품</a></li>
							<li><a class="header_nav1" href="${ path }/collabo/category/tech/techList">테크</a></li>
							<li><a class="header_nav1" href="${ path }/collabo/category/fashion/fashionList">패션</a></li>
							<li><a class="header_nav1" href="${ path }/collabo/brand/brand">브랜드</a></li>
						</ul>
					</li>
					
					<li><a class="menu_title"  href="${ path }/collections/main">컬렉션</a>
					</li>
					
					<c:if test="${ loginMember.role == '개인' }">
						<li><a href="${ path }/mypage/personMypage">My 콜라버스</a>
							<ul>
								<li><a class="header_nav1" href="${ path }/mypage/calendar/scheduleDetail">My 콜라보 캘린더</a></li>
								<li><a class="header_nav1" href="${ path }/mypage/collection/list/${ loginMember.id }">MyCollection</a></li>
								<li><a class="header_nav1" href="${ path }/mypage/myFollow/main">팔로우</a></li>
							</ul>
						</li>
					</c:if>
					<c:if test="${ loginMember.role == '기업' }">
						<li><a href="${ path }/mypage/businessMypage">My 콜라버스</a>
							<ul>
								<li><a class="header_nav1" href="${ path }/mypage/calendar/scheduleDetail">My 콜라보 캘린더</a></li>
								<li><a class="header_nav1" href="${ path }/mypage/statistics/statisticsCount">통계</a></li>
								<li><a class="header_nav1" href="${ path }/mypage/collection/list/${ loginMember.id }">MyCollection</a></li>
								<li><a class="header_nav1" href="${ path }/mypage/myFollow/main">팔로우</a></li>
							</ul>
						</li>
					</c:if>
					<c:if test="${ loginMember.role == '관리자' }">
						<li><a class="menu_title"  href="${ path }/mypage/main">My 콜라버스</a>
							<ul>
								<li><a class="header_nav1" href="${ path }/mypage/calendar/scheduleDetail">My 콜라보 캘린더</a></li>
								<li><a class="header_nav1" href="${ path }/mypage/memberinfo">회원 정보</a></li>
							</ul>
						</li>
					</c:if>
					
					<li><a class="menu_title"  href="${ path }/qna/qnaList">FAQ</a></li>
				</ul>
			</nav>
		</div>

		 
	</header>
</body>
</html>