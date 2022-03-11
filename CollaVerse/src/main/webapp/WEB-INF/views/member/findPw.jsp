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
	<link rel="stylesheet" type="text/css" href="${ path }/resources/css/find.css">
</head>
<body>

<h1>비밀번호 찾기</h1>
<div class="search" align="center">
	<form action="${ path }/member/findPwResult" method="post">
		<label>아이디 : <input type="text" name="id" required/></label><br><br>
		<div class="btnAll" align="center">
		     <input type="submit" id="btn1" value="검색">
		     <button id="btn2" onclick="window.close();">취소</button>
		</div>
	</form>
</div>
</body>
</html>