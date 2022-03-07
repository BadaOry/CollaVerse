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
<title>아이디 찾기 검색결과</title>
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/find.css">
</head>
<body>
		<h2>아이디 찾기 검색결과</h2>

		<c:if test="${ empty findId }">
		<form action="${ path }/member/findIdResult" method="post">
			<h3 align="center">아이디는 : "${ Member.id }" 입니다.</h3>
		</form>
		
				<div class="btnAll" align="center">
					<button type="button" id="btn2" onclick="history.go(-1);">이전</button>
					<input type="button" id="btn1" value="로그인" onclick="location.href='${ path }/member/login'">
				</div>
		</c:if>
</body>
</html>