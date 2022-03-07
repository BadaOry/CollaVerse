<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/collabo.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
   <div class="frame">
       <!--  
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
        -->
    </div>
    
    <div class="frame">
    <div class="colla_img">콜라보 소개이미지</div>

    <div class="promotion">
        <h3 class="mini_title">최신 프로모션</h3>
        <a onclick="location.href='${ path }/collabo/promotion/detail?pmtNo=1'">
        	클릭해서 테스트용 pmt_no=1 으로 이동
        </a>
    </div>
        
    <div class="p_new">
            <div class="area1">
            <ul>
            <c:forEach var="list" items="${ list }" begin="0" end="2">
            	<li>
                <div class="p_img">
                    <img src="${ path }${ list.imgPath }${ list.no }.jpg" alt="" width="250px" height="300px">
                </div>     
                <p>
                <p>${ list.title }</p>
				<p><fmt:formatDate value="${ list.startDate }" pattern="yyyy-MM-dd ~"/></p>
                </li> 
 			</c:forEach>
 			</ul>
            </div>
 
            <div class="area2">
            <ul>
            <c:forEach var="list" items="${ list }" begin="3" end="5">
            <li>
                <div class="p_img">
                    <img src="${ path }${ list.imgPath }${ list.no }.jpg" alt="" width="250px" height="300px">
                </div>     
                <p>
                <p>${ list.title }</p>
				<p><fmt:formatDate value="${ list.startDate }" pattern="yyyy-MM-dd ~"/></p>
            </li>     
 		</c:forEach>
 		</ul>
            </div>

            <div class="area3">
            <ul>
             <c:forEach var="list" items="${ list }" begin="6" end="8">
             <li>
                <div class="p_img">
                    <img src="${ path }${ list.imgPath }${ list.no }.jpg" alt="" width="250px" height="300px">
                </div>     
                <p>
                <p>${ list.title }</p>
				<p><fmt:formatDate value="${ list.startDate }" pattern="yyyy-MM-dd ~"/></p>
             </li>
 		</c:forEach>
 		</ul>
            </div>         
            
            <div class="area4">
            <ul>
            <c:forEach var="list" items="${ list }" begin="9" end="11">
            <li>
                <div class="p_img">
                    <img src="${ path }${ list.imgPath }${ list.no }.jpg" alt="" width="250px" height="300px">
                </div>     
                <p>
                <p>${ list.title }</p>
				<p><fmt:formatDate value="${ list.startDate }" pattern="yyyy-MM-dd ~"/></p>
            </li>    
 		</c:forEach>
 		</ul>
            </div>
            
      
            <div class="area5">
             <c:forEach var="list" items="${ list }" begin="12" end="14">
                <div class="p_img">
                    <img src="${ path }${ list.imgPath }${ list.no }.jpg" alt="" width="250px" height="300px">
                </div>     
                <p>
                <p>${ list.title }</p>
				<p><fmt:formatDate value="${ list.startDate }" pattern="yyyy-MM-dd ~"/></p>
                 
 		</c:forEach>
            </div>
    </div>
</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
	
</body>
</html>