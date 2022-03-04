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
<title>비밀번호 찾기</title>
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/find.css">
</head>
<body>

<h1>비밀번호 찾기</h1>

<div class="search" align="center">
	<form action="findPw" method="post">
		<label>아이디 : <input type="text" name="id" /></label><br><br>
		<label>이메일 : <input type="text" name="email" /></label><br>
	</form>
</div>
<br>
		<div class="btnAll" align="center">
		     <button id="btn1" onclick="location.href='${ path }/member/findPwResult'">찾기</button>
		     <button id="btn2" onclick="window.close();">취소</button>
		</div>

</body>
</html>