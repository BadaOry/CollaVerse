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
			<c:if test="${ empty loginmember }">
				<table id="table">
					<thead>
						<tr>
							<td><input type="button" value="회원가입" onclick=""></td>
							<td><input type="button" value="로그인" onclick=""></td>
						</tr>
					</thead>
				</table>
			</c:if>
			<c:if test="${ !empty loginmember }">
				
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
					<li><a href="">마이페이지</a>
						<ul>
							<li><a class="header_nav1" href="">마이</a></li>
							<li><a class="header_nav1" href="">마이</a></li>
							<li><a class="header_nav1" href="">마이</a></li>
						</ul>
					</li>
					<li><a href="">F&Q</a>
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