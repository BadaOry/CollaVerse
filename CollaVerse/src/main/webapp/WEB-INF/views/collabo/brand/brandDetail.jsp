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
<link rel="stylesheet" type="text/css" href="${path}/resources/css/collabo.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<div class= "select_alpha">
	
	<div class= select_brand>
	<p>BRAND</p>
	</div>	
	
		<div class= "alpha_list">
    		<c:forEach var="blist" items="${ blist }">
    			<table>
    			<tr>
    			<td>
    				<img src="${ path }${ blist.brImgPath }${ blist.brMemberNo }.jpg" alt="" width="250px" height="150px">
    			</td>
    			</tr>
    			<tr>
    				<td>${ blist.brName }</td>
    			</tr>
    			<tr>
    				<td>${ blist.brContent }</td>
    			</tr>
    			</table>
    		</c:forEach>    		
    	</div>
    	
	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>