<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CollaVerse</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/collabo.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<div class="frame">      
    
    <div class="category_name">
        <h3>패션</h3>
    </div>
    
    <div class="category_list">

        <div class="fashion">
        
        <div class="fashion4">
    	<c:forEach var="fslist" items="${ fslist }" begin="3">
    	<a href="${ path }/collabo/promotion/detail?pmtNo=${ fslist.no }">
            <div class="fs_img">
                 <img src="${ path }${ fslist.imgPath }${ fslist.no }.jpg" alt="" width="400px" height="300px">
            </div>              
            <p>          
            <strong>${ fslist.title }</strong>
            </a>
            <p>${ fslist.content }</p>
			</c:forEach>                       
            <p>
               
    		<c:forEach var="fspro" items="${ fspro }" begin="9" end="11">
            <table>
            <tr>
            	<td colspan = "2" rowspan="2" width="200px" height="150px">
            	<img src="${ path }${ fspro.proImgpath }${ fspro.proNo }.jpg" alt="" width="120px" height="90px">
            	</td>
            	<td>${ fspro.proName }</td>
            </tr>
            <tr>
            	<td>${ fspro.proPrice }</td>
            </tr>
            </table>
            </c:forEach>
			</div>						
        
        <div class="fashion1">
    	<c:forEach var="fslist" items="${ fslist }" begin="0" end="0">
    	<a href="${ path }/collabo/promotion/detail?pmtNo=${ fslist.no }">
            <div class="fs_img">
                 <img src="${ path }${ fslist.imgPath }${ fslist.no }.jpg" alt="" width="400px" height="300px">
            </div>              
            <p>          
            <strong>${ fslist.title }</strong>
            </a>
            <p>${ fslist.content }</p>
			</c:forEach>                       
            <p>
               
    		<c:forEach var="fspro" items="${ fspro }" begin="0" end="2">
            <table>
            <tr>
            	<td colspan = "2" rowspan="2" width="200px" height="150px">
            	<img src="${ path }${ fspro.proImgpath }${ fspro.proNo }.jpg" alt="" width="120px" height="90px">
            	</td>
            	<td>${ fspro.proName }</td>
            </tr>
            <tr>
            	<td>${ fspro.proPrice }</td>
            </tr>
            </table>
            </c:forEach>
			</div>
			
       <div class="fashion2">
    	<c:forEach var="fslist" items="${ fslist }" begin="1" end="1">
    	<a href="${ path }/collabo/promotion/detail?pmtNo=${ fslist.no }">
            <div class="fs_img">
                 <img src="${ path }${ fslist.imgPath }${ fslist.no }.jpg" alt="" width="400px" height="300px">
            </div> 
            <p>          
            <strong>${ fslist.title }</strong>
            </a>
            <p>${ fslist.content }</p>
			</c:forEach>                       
            <p>
               
    		<c:forEach var="fspro" items="${ fspro }" begin="3" end="5">
            <table>
            <tr>
            	<td colspan = "2" rowspan="2" width="200px" height="150px">
            	<img src="${ path }${ fspro.proImgpath }${ fspro.proNo }.jpg" alt="" width="120px" height="90px">
            	</td>
            	<td>${ fspro.proName }</td>
            </tr>
            <tr>
            	<td>${ fspro.proPrice }</td>
            </tr>
            </table>
            </c:forEach>
			</div>
			
       <div class="fashion3">
    	<c:forEach var="fslist" items="${ fslist }" begin="2" end="2">
    	<a href="${ path }/collabo/promotion/detail?pmtNo=${ fslist.no }">
            <div class="fs_img">
                 <img src="${ path }${ fslist.imgPath }${ fslist.no }.jpg" alt="" width="400px" height="300px">
            </div>              
            <p>          
            <strong>${ fslist.title }</strong>
            </a>
            <p>${ fslist.content }</p>
			</c:forEach>                       
            <p>
               
    		<c:forEach var="fspro" items="${ fspro }" begin="6" end="8">
            <table>
            <tr>
            	<td colspan = "2" rowspan="2" width="200px" height="150px">
            	<img src="${ path }${ fspro.proImgpath }${ fspro.proNo }.jpg" alt="" width="120px" height="90px">
            	</td>
            	<td>${ fspro.proName }</td>
            </tr>
            <tr>
            	<td>${ fspro.proPrice }</td>
            </tr>
            </table>
            </c:forEach>
			</div>						
    </div>
    
    </div>
    
    </div>
    
    	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
    	
</body>
</html>