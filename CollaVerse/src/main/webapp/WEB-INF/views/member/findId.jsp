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
<title>아이디 찾기</title>
</head>
<body>

<h1>아이디 찾기</h1>

	<form action="findId" method="post">
		<label>이메일 : <input type="text" name="email" /></label><br>
	</form>
	
	<table>
	  <tr>
		  <td>
		     <button onclick="location.href='${ path }/member/findIdResult'">찾기</button>
		  </td>
		  <td>
		     <button onclick="window.close();">취소</button>
		  </td>
	  </tr>
	</table>

</body>
</html>