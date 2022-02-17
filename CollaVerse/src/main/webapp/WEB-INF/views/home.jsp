<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<button type="button" onclick="location.href='${ pageContext.request.contextPath }/member/login'">로그인</button>
<button type="button" onclick="location.href='${ pageContext.request.contextPath }/member/enroll'">회원가입</button>

</body>
</html>
