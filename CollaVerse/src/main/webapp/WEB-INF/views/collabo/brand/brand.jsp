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
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    

    

    <div class="brand_list">
  
	<p>BRAND</p>
		
	<div class="brand_logo">
    		<div class=area1>
    		<c:forEach var="blist" items="${ blist }" begin="0" end="2">
    			<table>
    			<tr>
    			<td>
    				<a href="${ path }/collabo/promotion/detail?pmtNo=${ blist.brPmtNo }">
    				<img src="${ path }${ blist.brImgPath }${ blist.brMemberNo }.jpg" alt="" width="250px" height="150px">
    				</a>
    			</td>
    			</tr>
    			</table>
    		</c:forEach>
    		</div>
    		
    		<div class=area2>
    		<c:forEach var="blist" items="${ blist }" begin="3" end="5">
    			<table>
    			<tr>
    			<td>
    				<a href="${ path }/collabo/promotion/detail?pmtNo=${ blist.brPmtNo }">
    				<img src="${ path }${ blist.brImgPath }${ blist.brMemberNo }.jpg" alt="" width="250px" height="150px">
    				</a>
    			</td>
    			</tr>
    			</table>
    		</c:forEach>
    		</div> 
    		
    		<div class=area3>
    		<c:forEach var="blist" items="${ blist }" begin="6" end="8">
    			<table>
    			<tr>
    			<td>
    				<a href="${ path }/collabo/promotion/detail?pmtNo=${ blist.brPmtNo }">
    				<img src="${ path }${ blist.brImgPath }${ blist.brMemberNo }.jpg" alt="" width="250px" height="150px">
    				</a>
    			</td>
    			</tr>
    			</table>
    		</c:forEach>
    		</div>
    		
    		<div class=area4>
    		<c:forEach var="blist" items="${ blist }" begin="9" end="11">
    			<table>
    			<tr>
    			<td>
    				<a href="${ path }/collabo/promotion/detail?pmtNo=${ blist.brPmtNo }">
    				<img src="${ path }${ blist.brImgPath }${ blist.brMemberNo }.jpg" alt="" width="250px" height="150px">
    				</a>
    			</td>
    			</tr>
    			</table>
    		</c:forEach>
    		</div>
    		
    		<div class=area5>
    		<c:forEach var="blist" items="${ blist }" begin="12" end="14">
    			<table>
    			<tr>
    			<td>
    				<a href="${ path }/collabo/promotion/detail?pmtNo=${ blist.brPmtNo }">
    				<img src="${ path }${ blist.brImgPath }${ blist.brMemberNo }.jpg" alt="" width="250px" height="150px">
    				</a>
    			</td>
    			</tr>
    			</table>
    		</c:forEach>
    		</div>    	
    					    		    		   		
    </div>
		
			<div class="brand_array">
			<p>ABC</p>
			
			<p> A B C D E F G H I J K L M N O P Q R S T U V W X Y Z </p>
			 
								
			</div>
						
			<div class="form-type">
			<select id="select-type" name="type">
			<option value="A">A</option>
			<option value="가">가</option>
			</select>
			</div>
		
			<div class="brand_list">
							
			</div>
	</div>


    	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
    	
</body>
</html>