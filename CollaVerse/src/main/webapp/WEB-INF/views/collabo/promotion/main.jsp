<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/jhyunyou.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
   <div class="frame">
       <!--  
        <nav class="colla_menu">
            <ul>
                <li><a onclick="location.href='${ path }/collabo/category/living/livingList'" >리빙</a></li>
                <li><a onclick="location.href='${ path }/collabo/category/culture/cultureList'" >문화</li>
                <li><a onclick="location.href='${ path }/collabo/category/food/foodList'" >식품</li>
                <li><a onclick="location.href='${ path }/collabo/category/tech/techList'" >테크</li>
                <li><a onclick="location.href='${ path }/collabo/category/fashion/fashionList'" >패션</li>
                <li><a onclick="location.href='${ path }/collabo/brand/brand'" >브랜드</li>
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
            <div id="area1">
            <ul>
            <c:forEach var="list" items="${ list }" begin="0" end="3">
            	<li>
                <div class="p_img">
                    <img src="${ path }${ list.imgPath }${ list.no }.jpg" alt="" width="250px" height="300px">
                </div>     
                <p>
                <p>${ list.title }</p>
				<p>${ list.startDate }</p>
                </li> 
 			</c:forEach>
 			</ul>
            </div>

            <div id="area2">
            <ul>
            <c:forEach var="list" items="${ list }" begin="4" end="7">
            <li>
                <div class="p_img">
                    <img src="${ path }${ list.imgPath }${ list.no }.jpg" alt="" width="250px" height="300px">
                </div>     
                <p>
                <p>${ list.title }</p>
				<p>${ list.startDate }</p>
            </li>     
 		</c:forEach>
 		</ul>
            </div>

            <div id="area3">
            <ul>
             <c:forEach var="list" items="${ list }" begin="8" end="11">
             <li>
                <div class="p_img">
                    <img src="${ path }${ list.imgPath }${ list.no }.jpg" alt="" width="250px" height="300px">
                </div>     
                <p>
                <p>${ list.title }</p>
				<p>${ list.startDate }</p>
             </li>
 		</c:forEach>
 		</ul>
            </div>         
            
            <div id="area4">
            <ul>
            <c:forEach var="list" items="${ list }" begin="12" end="15">
            <li>
                <div class="p_img">
                    <img src="${ path }${ list.imgPath }${ list.no }.jpg" alt="" width="250px" height="300px">
                </div>     
                <p>
                <p>${ list.title }</p>
				<p>${ list.startDate }</p>
            </li>    
 		</c:forEach>
 		</ul>
            </div>
            
<!--           
            <div id="area5">
             <c:forEach var="list" items="${ list }" begin="12" end="15">
                <div class="p_img">
                    <img src="${ path }${ list.imgPath }${ list.no }.jpg" alt="" width="450px" height="330px">
                </div>     
                <p>
                <p>${ list.title }</p>
				<p>${ list.startDate }</p>
                 
 		</c:forEach>
            </div>

            <div id="area2">
                <div class="p_img">
                    <img src="${ pageContext.request.contextPath }/resources/images/promotion/promotion4.jpg" width="470px" height="350px">
                </div>
                <p>
                <p>프로모션 타이틀</p>
                <p>프로모션 기간</p>
            </div>

            <div id="area3">
                <div class="p_img">
                    <img src="${ pageContext.request.contextPath }/resources/images/promotion/promotion10.jpg" width="470px" height="350px">
                </div>
                <p>
                <p>프로모션 타이틀</p>
                <p>프로모션 기간</p>
            </div>
-->



    </div>
</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
	
</body>
</html>