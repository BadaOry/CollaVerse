<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CollaVerse</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/collabo/promotion/detail.css">
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
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
	
				<div class="slide_content">
				<div class="slide_div">
				<c:forEach var="productInfo" items="${ productInfo }" begin="0" end="2">
					<div>
						<a>
							<img src="${ path }${ productInfo.proImgpath }${ productInfo.proNo }.jpg" alt="" width="550" height="400px">
						</a>
					</div>
					</c:forEach>
				</div>				
				</div>	
	
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
-->





    <div class="p_title">
        <hr>
        	<div style="width: 10%; float: left">
        		<table>
        			<tr>
        				<td>
        					<c:if test="${ empty loginMember }">
			        			<img src="${ path }/resources/images/promotion_deatil_heart/heart_empty.png" style="width:30px; hegith:30px"
			        				onclick="updateHeart()"> 
        					</c:if>
        					<c:if test="${ !empty loginMember }">  		
        						<c:if test="${ heartCheck == 0 }">				
				        			<img src="${ path }/resources/images/promotion_deatil_heart/heart_empty.png" style="width:30px; hegith:30px"
			        					onclick="updateHeart()"> 
				        		</c:if>
        						<c:if test="${ heartCheck == 1 }">				
				        			<img src="${ path }/resources/images/promotion_deatil_heart/heart_full.png" style="width:30px; hegith:30px"
				        				id="heart_btn" onclick="updateHeart()"> 
				        		</c:if>
        					</c:if>
        				</td>
        				
        				<td>
			        		<span> ${ promotionInfo.heartHit } </span>
        				</td>
        			</tr>
        		</table>
        	</div>     	
        	<div style="width: 90%; float: left">
		        <p><input type="text" name="promName" id="title"></p>
        	</div>
        <hr>
    </div>
    
    <div class="p_explain">
        <p>프로모션 설명</p>
    </div>

    <div class="p_content">
        <textarea name="promContent" cols="100" rows="15" ></textarea>
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
    	
        <div class="proInfo">
        
        <div class="proList1">
        <c:forEach var="productInfo" items="${ productInfo }" begin="0" end="0">
        	
        		<table>
        		<tr>
        		<td>
                <img src="${ path }${ productInfo.proImgpath }${ productInfo.proNo }.jpg" alt="" width="470px" height="350px">
                </td>
                </tr>
                
                <tr>
                <td>
	            <p>${ productInfo.proName }</p>
	            </td>
				</tr>

				<tr>
				<td>
	            <p>${ productInfo.proPrice }</p>
	            </td>
				</tr>
				
				<tr>
				<td>
	            <p>${ productInfo.proContent }</p>
	            </td>
	            </tr>
				</table>
			
        </c:forEach>
        </div>
        
        <div class="proList2">
        <c:forEach var="productInfo" items="${ productInfo }" begin="1" end="1">
        	
        		<table>
        		<tr>
        		<td>
                <img src="${ path }${ productInfo.proImgpath }${ productInfo.proNo }.jpg" alt="" width="470px" height="350px">
                </td>
                </tr>
                
                <tr>
                <td>
	            <p>${ productInfo.proName }</p>
	            </td>
				</tr>

				<tr>
				<td>
	            <p>${ productInfo.proPrice }</p>
	            </td>
				</tr>
				
				<tr>
				<td>
	            <p>${ productInfo.proContent }</p>
	            </td>
	            </tr>
				</table>
			
        </c:forEach>
        </div>
        
        <div class="proList3">
        <c:forEach var="productInfo" items="${ productInfo }" begin="2" end="2">
        	
        		<table>
        		<tr>
        		<td>
                <img src="${ path }${ productInfo.proImgpath }${ productInfo.proNo }.jpg" alt="" width="470px" height="350px">
                </td>
                </tr>
                
                <tr>
                <td>
	            <p>${ productInfo.proName }</p>
	            </td>
				</tr>

				<tr>
				<td>
	            <p>${ productInfo.proPrice }</p>
	            </td>
				</tr>
				
				<tr>
				<td>
	            <p>${ productInfo.proContent }</p>
	            </td>
	            </tr>
				</table>
			
        </c:forEach>
        </div>
                        
		</div>

<!--  
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
-->
    </div>

    <hr>

</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
	

<script>
	$(document).ready(function(){
		$(".slide_div").slick(
				{
					dots: true,
					autoplay : true,
					autoplaySpeed: 5000
				}		
		)	
	});

</script>


<script>	
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
				
				if(heartCheck == 0) {
					alert("♥ 좋아요 ♥");
					location.reload();
				} 
				else if (heartCheck == 1){
					alert("별로에요..?");
					location.reload();
				}
			}
				
		});
	}
</script>

</body>
</html>