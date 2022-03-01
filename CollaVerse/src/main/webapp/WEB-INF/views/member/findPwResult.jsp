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
<title>비밀번호 찾기 검색결과</title>
</head>
<body>
		<h3>비밀번호 찾기 검색결과</h3>
		<c:if test="${ empty findPw }">
		<form action="${ path }/member/findPwResult" method="post">
			<h5>비밀번호는 등록된 이메일로 전송 하였습니다.</h5>
		</form>
				<p>
					<button onclick="window.close();">창닫기</button>
				</p>
		</c:if>
</body>
</html>