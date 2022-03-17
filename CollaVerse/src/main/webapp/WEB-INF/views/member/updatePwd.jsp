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
	<link rel="stylesheet" type="text/css" href="${ path }/resources/css/updatePwd.css">
</head>
<body>

<h1>비밀번호 변경</h1>
<div class="updatePwd" align="center">
	<form action="${ path }/member/updatePwd" method="post">
	<table>
		<tr>
			<th align="right">현재 비밀번호 : </th>
			<td><input type="password" name="originalPw" id="originalPw" value="${ loginMember.password }" required/></td>
		</tr>
		<tr>
			<th align="right">새 비밀번호 : </th>
			<td><input type="password" name="newPw" id="newPw" required/></td>
		</tr>
		<tr>
			<th align="right">새 비밀번호 확인 : </th>
			<td><input type="password" name="newPwCheck" id="newPwCheck" required/></td>
		</tr>
	</table>
	<br>
		<div class="btnAll" align="center">
		     <input type="submit" id="btn1" value="수정">
		     <button id="btn2" onclick="window.close();">취소</button>
		</div>
	</form>
</div>

</body>
</html>