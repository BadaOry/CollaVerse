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
        <h3>식품</h3>
    </div>
    
    <div class="category_list">

       <div class="food">
       
        	<div class="food4">
    	<c:forEach var="flist" items="${ flist }" begin="3">
    	<a href="${ path }/collabo/promotion/detail?pmtNo=${ flist.no }">
            <div class="l_img">
                 <img src="${ path }${ flist.imgPath }${ flist.no }.jpg" alt="" width="400px" height="300px">
            </div>              
            <p>          
            <strong>${ flist.title }</strong>
            </a>
            <p>${ flist.content }</p>
			</c:forEach>                       
            <p>
               
    		<c:forEach var="fpro" items="${ fpro }" begin="8" end="10">
            <table>
            <tr>
            	<td colspan = "2" rowspan="2" width="200px" height="150px">
            	<img src="${ path }${ fpro.proImgpath }${ fpro.proNo }.jpg" alt="" width="120px" height="90px">
            	</td>
            	<td>${ fpro.proName }</td>
            </tr>
            <tr>
            	<td>${ fpro.proPrice }</td>
            </tr>
            </table>
            </c:forEach>
			</div>	
			
         <div class="food1">
    	<c:forEach var="flist" items="${ flist }" begin="0" end="0">
    	<a href="${ path }/collabo/promotion/detail?pmtNo=${ flist.no }">  
            <div class="l_img">
                 <img src="${ path }${ flist.imgPath }${ flist.no }.jpg" alt="" width="400px" height="300px">
            </div>              
            <p>          
            <strong>${ flist.title }</strong>
            </a>
            <p>${ flist.content }</p>
			</c:forEach>                       
            <p>
               
    		<c:forEach var="fpro" items="${ fpro }" begin="0" end="2">
            <table>
            <tr>
            	<td colspan = "2" rowspan="2" width="200px" height="150px">
            	<img src="${ path }${ fpro.proImgpath }${ fpro.proNo }.jpg" alt="" width="120px" height="90px">
            	</td>
            	<td>${ fpro.proName }</td>
            </tr>
            <tr>
            	<td>${ fpro.proPrice }</td>
            </tr>
            </table>
            </c:forEach>
			</div>
			
       <div class="food2">
    	<c:forEach var="flist" items="${ flist }" begin="1" end="1">
    	<a href="${ path }/collabo/promotion/detail?pmtNo=${ flist.no }">
            <div class="l_img">
                 <img src="${ path }${ flist.imgPath }${ flist.no }.jpg" alt="" width="400px" height="300px">
            </div> 
            <p>          
            <strong>${ flist.title }</strong>
            </a>
            <p>${ flist.content }</p>
			</c:forEach>                       
            <p>
               
    		<c:forEach var="fpro" items="${ fpro }" begin="3" end="5">
            <table>
            <tr>
            	<td colspan = "2" rowspan="2" width="200px" height="150px">
            	<img src="${ path }${ fpro.proImgpath }${ fpro.proNo }.jpg" alt="" width="120px" height="90px">
            	</td>
            	<td>${ fpro.proName }</td>
            </tr>
            <tr>
            	<td>${ fpro.proPrice }</td>
            </tr>
            </table>
            </c:forEach>
			</div>
			
       <div class="food3">
    	<c:forEach var="flist" items="${ flist }" begin="2" end="2">
    	<a href="${ path }/collabo/promotion/detail?pmtNo=${ flist.no }">
            <div class="l_img">
                 <img src="${ path }${ flist.imgPath }${ flist.no }.jpg" alt="" width="400px" height="300px">
            </div>              
            <p>          
            <strong>${ flist.title }</strong>
            </a>
            <p>${ flist.content }</p>
			</c:forEach>                       
            <p>
               
    		<c:forEach var="fpro" items="${ fpro }" begin="6" end="7">
            <table>
            <tr>
            	<td colspan = "2" rowspan="2" width="200px" height="150px">
            	<img src="${ path }${ fpro.proImgpath }${ fpro.proNo }.jpg" alt="" width="120px" height="90px">
            	</td>
            	<td>${ fpro.proName }</td>
            </tr>
            <tr>
            	<td>${ fpro.proPrice }</td>
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