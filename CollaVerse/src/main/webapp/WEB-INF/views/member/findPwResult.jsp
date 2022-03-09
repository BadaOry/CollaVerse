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
<title>CollaVerse</title>
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/find.css">
</head>
<body>
		<h2>비밀번호 찾기 검색결과</h2>
		<c:if test="${ empty findPw }">
		<form action="${ path }/member/findPwResult" method="post">
			<h4>비밀번호는 등록된 이메일로 전송 하였습니다.</h4>
		</form>
				<div class="btnAll" align="center">
					<button id="btn1" onclick="window.close();">창닫기</button>
				</div>
		</c:if>
</body>
</html>