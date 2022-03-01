<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jhyunyou.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
</head>
<body>
   <div class="frame">
        <nav class="colla_menu">
            <ul>
                <li>리빙</li>
                <li>문화</li>
                <li>식품</li>
                <li>테크</li>
                <li>패션</li>
                <li>브랜드</li>
            </ul>
        </nav>
    </div>
    
    <div class="frame">
    <div class="colla_img">콜라보 소개이미지</div>

    <div class="promotion">
        <h3>최신 프로모션</h3>
    </div>

    <div class="p_new">
            <div id="area1">
                <div class="p_img">
                    <img src="${ pageContext.request.contextPath }/resources/images/promotion/promotion1.jpg" width="470px" height="350px">
                </div>
     
                <p>
                <p>${ promotion.title }</p>
                <p>프로모션 기간</p>
                
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
    </div>
</div>
</body>
</html>