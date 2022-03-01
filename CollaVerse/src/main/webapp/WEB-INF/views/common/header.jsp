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
		<div id="header1">
			<h1 id="title">
				<a href="${ path }/" style="">
					CollaVerse
				</a>
			</h1>
		</div>
		
		<div id="header2">
			<c:if test="${ empty loginMember }">
				<table id="table">
					<thead>
						<tr>
							<td><input type="button" value="회원가입" onclick="location.href='${ path }/member/enroll'"></td>
							<td><input type="button" value="로그인" onclick="location.href='${ path }/member/login'"></td>
						</tr>
					</thead>
				</table>
			</c:if>
			<c:if test="${ !empty loginMember }">
					<table id="table">
					<thead>
						<tr>
							<td><span style="color: white" align="right">${ loginMember.nickname } 님 환영합니다! </span></td>
							<td><button onclick="location.href='${ path }/member/myPage'">내정보</button></td>
							<td><input type="button" value="로그아웃" onclick="location.href='${ path }/member/logout'"></td>
						</tr>
					</thead>
				</table>
			</c:if>
		</div>
		
		<div id="header3">
			<nav class="header_nav">
				<ul>
					<li><a href="">공지사항</a>
						<ul>
							<li><a class="header_nav1" href="">공지</a></li>
							<li><a class="header_nav1" href="">공지</a></li>
							<li><a class="header_nav1" href="">공지</a></li>
						</ul>
					</li>
					<li><a href="">콜라보</a>
						<ul>
							<li><a class="header_nav1" href="">콜라</a></li>
							<li><a class="header_nav1" href="">콜라</a></li>
							<li><a class="header_nav1" href="">콜라</a></li>
						</ul>
					</li>
					
					<c:if test="${ loginMember.role == '개인' }">
						<li><a href="${ path }/mypage/person_mypage">My 콜라버스</a>
							<ul>
								<li><a class="header_nav1" href="${ path }/mypage/calendar/calendar_detail">My 콜라보 캘린더</a></li>
								<li><a class="header_nav1" href="${ path }/mypage/follow">팔로우</a></li>
							</ul>
						</li>
					</c:if>
					<c:if test="${ loginMember.role == '기업' }">
						<li><a href="${ path }/mypage/business_mypage">My 콜라버스</a>
							<ul>
								<li><a class="header_nav1" href="${ path }/mypage/calendar/calendar_detail_business">My 콜라보 캘린더</a></li>
								<li><a class="header_nav1" href="${ path }/mypage/statistics">팔로워 및 통계</a></li>
								<li><a class="header_nav1" href="${ path }/mypage/memberinfo">회원 정보</a></li>
							</ul>
						</li>
					</c:if>
					<c:if test="${ loginMember.role == '관리자' }">
						<li><a href="${ path }/mypage/main">My 콜라버스</a>
							<ul>
								<li><a class="header_nav1" href="${ path }/mypage/calendar/calendar_detail">My 콜라보 캘린더</a></li>
								<li><a class="header_nav1" href="${ path }/mypage/memberinfo">회원 정보</a></li>
							</ul>
						</li>
					</c:if>
					
					
					
					<li><a href="">FAQ</a>
						<ul>
							<li><a class="header_nav1" href="">에페큐</a></li>
							<li><a class="header_nav1" href="">에페큐</a></li>
							<li><a class="header_nav1" href="">에페큐</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</header>
</body>
</html>