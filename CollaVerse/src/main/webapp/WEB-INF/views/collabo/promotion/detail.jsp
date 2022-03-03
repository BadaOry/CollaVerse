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

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
   <div class="frame">
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
    </div>

    <div class="frame">

    <div class="tab_content">
            <input type="radio" name="tabmenu" id="tab01" checked>
            <input type="radio" name="tabmenu" id="tab02">
            <input type="radio" name="tabmenu" id="tab03">

    <div class="conbox con1">
        <img id="main_img1" src="${ pageContext.request.contextPath }/resources/images/promotion/promotion1.jpg" width="550px" height="350px">
    </div>

    <div class="conbox con2">
        <img id="main_img2" src="${ pageContext.request.contextPath }/resources/images/promotion/promotion2.jpg" width="550px" height="350px">
    </div>

    <div class="conbox con3">
        <img id="main_img3" src="${ pageContext.request.contextPath }/resources/images/promotion/promotion3.jpg" width="550px" height="350px">
    </div>

    <div class="btn">
        <label for="tab01"></label>
        <label for="tab02"></label>
        <label for="tab03"></label>
    </div>
</div>

    <div class="p_title">
        <hr>
        <strong>프로모션 이름</strong>
        <hr>
    </div>

    <div class="category_detail">
        <strong>제품 정보</strong>
    </div>

    <div class="p_info">
        <div id="area1">
            <div class="p_img">
                <img src="${ pageContext.request.contextPath }/resources/images/product/product1_1.jpg" width="470px" height="350px">
            </div>

            <p>제품 이름</p>
            <p>제품 가격</p>
            <p>제품 설명</p>
            </div>

            <div id="area2">
            <div class="p_img">
                <img src="${ pageContext.request.contextPath }/resources/images/product/product1_2.jpg" width="470px" height="350px">
            </div>

            <p>제품 이름</p>
            <p>제품 가격</p>
            <p>제품 설명</p>
            </div>

            <div id="area3">
            <div class="p_img">
                <img src="${ pageContext.request.contextPath }/resources/images/product/product1_3.jpg" width="470px" height="350px">
            </div>

            <p>제품 이름</p>
            <p>제품 가격</p>
            <p>제품 설명</p>
            </div>
    </div>

    <hr>

    <div class="p_explain">
        <p>프로모션 설명</p>
    </div>

    <div class="p_content">
        <p>
            내용 (관리자가 작성)
        </p>
    </div>


</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
	
</body>
</html>