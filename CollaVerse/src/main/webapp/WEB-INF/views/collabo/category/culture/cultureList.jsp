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
	
<!--  	
   <div class="frame">
        <nav class="colla_menu">
            <ul>
                <li><a onclick="location.href='${ path }/collabo/category/living/livingList'" >리빙</a></li>
                <li><a onclick="location.href='${ path }/collabo/category/culture/cultureList'" >문화</a></li>
                <li><a onclick="location.href='${ path }/collabo/category/food/foodList'" >식품</a></li>
                <li><a onclick="location.href='${ path }/collabo/category/tech/techList'" >테크</a></li>
                <li><a onclick="location.href='${ path }/collabo/category/fashion/fashionList'" >패션</a></li>
                <li><a onclick="location.href='${ path }/collabo/brand/brand'" >브랜드</a></li>
            </ul>
        </nav>
    </div>
-->    
    

    <div class="category_list">
        <h3>문화</h3>
    </div>

        <div class="culture">
        <div class="culture1">
    	<c:forEach var="clist" items="${ clist }" begin="0" end="0">
    	<a href="${ path }/collabo/promotion/detail?pmtNo=${ clist.no }">  
            <div class="c_img">
                 <img src="${ path }${ clist.imgPath }${ clist.no }.jpg" alt="" width="550px" height="400px">
            </div>              
            <p>          
            <strong>${ clist.title }</strong>
            </a>
            <p>${ clist.content }</p>
			</c:forEach>                       
            <p>
               
    		<c:forEach var="cpro" items="${ cpro }" begin="0" end="2">
            <table>
            <tr>
            	<td colspan = "2" rowspan="2" width="200px" height="150px">
            	<img src="${ path }${ cpro.proImgpath }${ cpro.proNo }.jpg" alt="" width="150px" height="100px">
            	</td>
            	<td>${ cpro.proName }</td>
            </tr>
            <tr>
            	<td>${ cpro.proPrice }</td>
            </tr>
            </table>
            </c:forEach>
			</div>
			
       <div class="culture2">
    	<c:forEach var="clist" items="${ clist }" begin="1" end="1">
    	<a href="${ path }/collabo/promotion/detail?pmtNo=${ clist.no }">  
            <div class="l_img">
                 <img src="${ path }${ clist.imgPath }${ clist.no }.jpg" alt="" width="550px" height="400px">
            </div>              
            <p>          
            <strong>${ clist.title }</strong>
            </a>
            <p>${ clist.content }</p>
			</c:forEach>                       
            <p>
               
    		<c:forEach var="cpro" items="${ cpro }" begin="3" end="5">
            <table>
            <tr>
            	<td colspan = "2" rowspan="2" width="200px" height="150px">
            	<img src="${ path }${ cpro.proImgpath }${ cpro.proNo }.jpg" alt="" width="150px" height="100px">
            	</td>
            	<td>${ cpro.proName }</td>
            </tr>
            <tr>
            	<td>${ cpro.proPrice }</td>
            </tr>
            </table>
            </c:forEach>
			</div>
			
       <div class="culture3">
    	<c:forEach var="clist" items="${ clist }" begin="2" end="2">
    	<a href="${ path }/collabo/promotion/detail?pmtNo=${ clist.no }">  
            <div class="l_img">
                 <img src="${ path }${ clist.imgPath }${ clist.no }.jpg" alt="" width="550px" height="400px">
            </div>              
            <p>          
            <strong>${ clist.title }</strong>
            </a>
            <p>${ clist.content }</p>
			</c:forEach>                       
            <p>
               
    		<c:forEach var="cpro" items="${ cpro }" begin="6" end="7">
            <table>
            <tr>
            	<td colspan = "2" rowspan="2" width="200px" height="150px">
            	<img src="${ path }${ cpro.proImgpath }${ cpro.proNo }.jpg" alt="" width="150px" height="100px">
            	</td>
            	<td>${ cpro.proName }</td>
            </tr>
            <tr>
            	<td>${ cpro.proPrice }</td>
            </tr>
            </table>
            </c:forEach>
			</div>						
            </div>
    
    	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
    	
</body>
</html>