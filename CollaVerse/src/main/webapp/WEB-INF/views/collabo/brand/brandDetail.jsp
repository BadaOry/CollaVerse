<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

	<div class="frame">

	<div class= "select_alpha">
	
	<div class= select_brand>
	<p>브랜드</p>
	</div>	
	
		<div class= "alpha_list">
		<c:choose>
			<c:when test="${ !empty blist }">
    		<c:forEach var="blist" items="${ blist }" >
    			<table>
    			<tr>
    			<td>
    				<img src="${ path }${ blist.brImgPath }${ blist.brMemberNo }.jpg" alt="" width="250px" height="150px">
    			</td>
    			</tr>
    			<tr>
    				<td>
    				<strong> ${ blist.brName } </strong>
    				</td>
    			</tr>
    			<tr>
    				<td>${ blist.brContent }</td>
    			</tr>
    					
    			</table>
    		</c:forEach>
    		</c:when>
    		<c:otherwise>
    		<div class= no_brand>
    			<tr>
    				<td> 
    				조회된 브랜드가 없습니다.
    				</td>
    			</tr>
    		</div>
    		</c:otherwise>
    	</c:choose>     	   		
    	</div>

    	</div>
	</div>
	

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>