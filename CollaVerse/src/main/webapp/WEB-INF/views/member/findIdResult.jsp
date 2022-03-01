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
</head>
<body>
		<h3>아이디 찾기 검색결과</h3>

		<c:if test="${ Member.EMAIL eq email }">
		<form action="${ path }/member/findIdResult" method="post">
			<h5>아이디는 : "${ Member.id }" 입니다.</h5>
		</form>
		
				<p>
					<input type="button" value="로그인" onclick="location.href='${ path }/member/login'">
					<button type="button" onclick="history.go(-1);">취소</button>
				</p>
		</c:if>
</body>
</html>