<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CollaVerse</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/collabo/promotion/detail.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
<style>
	#product_box {
    width: 470px;
    height: 350px;
    border: 1px solid rgb(89, 22, 145);
    margin: 20px 20px 0 0 ;
}
</style>
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
        	<div style="width: 10%; float: left">
        	<%-- test="empty loginMember" 인 경우 로그인해서 하트 누르라고 alert
        	     test="loginMember.no==HEART 테이블의 heart_mem_no && HEART 테이블의 HEARTCHECK 가 0 일 때 빈 하트 보여주고  																			 1 일 때 찬 하트 보여줌 --%>
        	<%-- 	<p id="heart_btn" onclick="updateHeart()">♥ ${ promotionInfo.heartHit }</p> --%>
        		<button id="heart_btn" onclick="updateHeart()">♥ </button>${ promotionInfo.heartHit }
        	</div>     	
        	<div style="width: 90%; float: left">
		        <p><strong>${ promotionInfo.title }</strong></p>
        	</div>
        <hr>
    </div>

    <div class="category_detail">
        <p>제품 정보</p>
        <%-- <strong>제품 정보</strong> --%>
    </div>

    <div class="p_info">
    	<%--
    	<div id="area1">
	    	<c:forEach var="ProductList" items="${ ProductInfo }">
	        	<div class="product_list" id="product_box">
	        		<img src= "${ path }/resources/upload/collection/${ collectionList.renamedFileName01 }"
	        			style="width: 100%; height: 100%" />
	        		▲ ${ productInfo.proNo } : ${ productInfo.proName }
	        	</div>
		    </c:forEach>
    	</div>
    	--%>
    	
        <div id="area1">
            <div class="p_img">
                <img src="${ pageContext.request.contextPath }/resources/images/product/product1_1.jpg" width="470px" height="350px">
            </div>
	
			<div>
	            <p>제품 이름</p>
	            <p>제품 가격</p>
	            <p>제품 설명</p>
            </div>
		</div>

        <div id="area2">
        	<div class="p_img">
	        	<img src="${ pageContext.request.contextPath }/resources/images/product/product1_2.jpg" width="470px" height="350px">
	        </div>  
	        
	       <div>
	            <p>제품 이름</p>
	            <p>제품 가격</p>
	            <p>제품 설명</p>
           </div> 
        </div>

        <div id="area3">
            <div class="p_img">
                <img src="${ pageContext.request.contextPath }/resources/images/product/product1_3.jpg" width="470px" height="350px">
            </div>
			<div>
	            <p>제품 이름</p>
	            <p>제품 가격</p>
	            <p>제품 설명</p>
           </div>
        </div>

    </div>

    <hr>

    <div class="p_explain">
        <p>프로모션 설명</p>
    </div>

    <div class="p_content">
        <p>
            ${ promotionInfo.content }
        </p>
    </div>


</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
	

<script>
<%-- ▼ 하트 구현 기능 용 Ajax --%>
	var pmt_no = ${ promotionInfo.no };
	var heart_mem_no = ${ loginMember.no };
	
	function updateHeart() {
		$.ajax({
			type : "POST",
			url : "${ path }/collabo/promotion/detail/heart",
			dataType : "json",
			data : {'pmt_no' : pmt_no, 'heart_mem_no' : heart_mem_no },
			error : function() {
				alert("하트 업데이트 실패");
			},
			success : function(heartCheck) {
				
				if(heartCheck = 0) {
					alert("하트 업데이트 완료");
					location.reload();
				} 
				else if (heartCheck = 1){
					alert("하트 취소");
					location.reload();
				}
			}
				
		});
	}
</script>
	
</body>
</html>