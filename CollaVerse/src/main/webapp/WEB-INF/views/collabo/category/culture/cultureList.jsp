<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/collabo.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
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
    

    <div class="category_list">
        <h3>문화</h3>
    </div>

       <div class="culture">
    	<c:forEach var="clist" items="${ clist }">
        <div id="area1">
            <div class="c_img">
                 <img src="${ path }${ clist.imgPath }${ clist.no }.jpg" alt="" width="550px" height="400px">
            </div>
            <p>
            <p>${ clist.title }</p>
            <p>${ clist.content }</p>
            <p>제품 1</p>
            <p>제품 2</p>
        </div>
		</c:forEach>
    </div>
    
    	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
    	
</body>
</html>