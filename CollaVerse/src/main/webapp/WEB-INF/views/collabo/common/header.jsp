<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COLLAVERSE</title>
<script src="${ path }/js/jquery-3.6.0.js"></script>
</head>
<body>
	<header>
		<div class="header-inner">
			<div class="member-container">
				<a href="${ path }/home" class="logo">
					<img src="${ pageContext.request.contextPath }/resources/images/logo.png" alt="메인으로 이동">
				</a>
				<c:if test="${ empty loginMember }">
					<div class="before-login">
						<button class="btn" onclick="location.href='${ path }//'">로그인</button>
						<button class="btn" onclick="location.href='${ path }//'">회원가입</button>
					</div>
				</c:if>
				<c:if test="${ !empty loginMember }">
					<div class="after-login">
						<table>
							<tr>
								<td colspan="2">
									${ loginMember.name }
								</td>
								<td>
									<button onclick="location.href='${ path }//'">내 정보</button>
								</td>
								<td>
									<button onclick="location.replace('${ path }/')">로그아웃</button>
								</td>
							</tr>
						</table>
					</div>
				</c:if>
			</div>
		</div>	
	
		
	    <div class="menu-bar">
	        <ul>
	            <li><a href="${ pageContext.request.contextPath }/living/livingList">리빙</a></li>
	            <li><a href="${ pageContext.request.contextPath }/culture/cultureList">문화</a></li>
	            <li><a href="${ pageContext.request.contextPath }/fashion/restList">패션</a></li>
				<li><a href="${ pageContext.request.contextPath }/food/foodList">식품</a></li>
	            <li><a href="${ pageContext.request.contextPath }/tech/techList">테크</a></li>
	            <li><a href="${ pageContext.request.contextPath }/brand/brand">브랜드</a></li>
	            <li><a href="${ pageContext.request.contextPath }/promotion/promotion">프로모션</a></li>
	        </ul>
	    </div>
	</header>
</body>
</html>