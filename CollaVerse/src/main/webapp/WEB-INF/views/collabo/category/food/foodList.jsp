<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<%-- <jsp:include page="/views/collabo/common/header.jsp" /> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOOD</title>
<script src="${ path }/js/jquery-3.6.0.js"></script>
</head>
<body>

 
   <div class="frame">
   
<!-- 
        <nav class="navigator">
            <span style="margin: 0;padding: 0;">
                <h3 class="site-name" style="display: inline-block;">COLLAVERSE</h3>
                <img class="value-icon" src="" >                
            </span>
            <ul>
                <li><a class="nav menu">LIVING</a></li>
                <li><a class="nav menu">CULTURE</a></li>
                <li><a class="nav menu">FASHION</a></li>
                <li><a class="nav menu">FOOD</a></li>
                <li><a class="nav menu">TECH</a></li>
            </ul>
        </nav>
-->

<!-- 이미지 넘기기 -->
        <div class="tab_content">
            <input type="radio" name="tabmenu" id="tab01" checked>
            <input type="radio" name="tabmenu" id="tab02">
            <input type="radio" name="tabmenu" id="tab03">

            <div class="conbox con1">
                <img id="sample1" src=""  width="" height="">
            </div>

            <div class="conbox con2">
                <img id="sample2" src=""  width="900px" height="">
            </div>

            <div class="conbox con3">
                <img id="sample3" src=""  width="900px" height="">
            </div>


            <div class="tab_btn">
                <label for="tab01"></label>
                <label for="tab02"></label>
                <label for="tab03"></label>
            </div>
            
            <strong>콜라보 프로젝트 이름</strong>
            
            <hr>
            
            <div class="product_info">
            <h3>제품 정보</h3>
			      <ul>
				        <li>
				          <a href="${ pageContext.request.contextPath }/food/foodDetail?">
				            <div class="info_img">
				              <img src="" alt="">
				            </div>
				            <p>제품 이름</p>
				            <p>제품 가격</p>
				            <p>제품 설명</p>
				          </a>
				        </li>
			      </ul>
            </div>
            
        </div>
</body>
</html>