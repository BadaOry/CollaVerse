<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/footer.css">
</head>
<body>

	<footer>
		<div id="cp_container">
		
			<p id="cp">Copyright © CollaVerse</p>
		
		</div>
		
		<div id="info_container">
		
			<p id="serviceInfo" onclick="location.href='${ path }/information'">서비스 소개<p>
			
			<p id="nothing">     │     </p>
			
			<p id="gitHub" onclick="location.href='https://github.com/BadaOry/CollaVerse'">gitHub</p>
			
		</div>
			

	</footer>
	
</body>
</html>