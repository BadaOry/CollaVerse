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
							<img src="${ path }${ productInfo.proImgpath }${ productInfo.proNo }.jpg" alt=""width="450px" height="350px">
						</a>
					</div>
					</c:forEach>
				</div>				
				</div>	

    <div class="p_title">
        <hr>
        	<div style="width: 3%; float: left">
        		<table>
        			<tr>
        				<td>
        					<c:if test="${ empty loginMember }">
			        			<img src="${ path }/resources/images/promotion_deatil_heart/heart_empty.png" style="width:30px; hegith:30px"
			        				onclick="cantUpdateHeart()"> 
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
        	<!-- 제품명 가운데 정렬 맞추기 위해 style 수정 -->     	
        	<div style="width: 97%; float: left">
		        <p><strong>${ promotionInfo.title }</strong></p>
        	</div>
        	
    	<hr>        	
    </div>
    
    <div class="p_explain">

        <p>프로모션 설명</p>
    </div>

    <div class="p_content">
        <p>
            ${ promotionInfo.content }
        </p>
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
                <img src="${ path }${ productInfo.proImgpath }${ productInfo.proNo }.jpg" alt="" width="350px" height="250px">
                </td>
                </tr>
                
                <tr>
                <td>
	            <strong>${ productInfo.proName }</strong>
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
	          
				<tr>
				<td>
	            <p> ( 구매 수량: ${ productInfo.proQty } ) </p>
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
                <img src="${ path }${ productInfo.proImgpath }${ productInfo.proNo }.jpg" alt="" width="350px" height="250px">
                </td>
                </tr>
                
                <tr>
                <td>
	            <strong>${ productInfo.proName }</strong>
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
	            
				<tr>
				<td>
	            <p> ( 구매 수량: ${ productInfo.proQty } ) </p>
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
                <img src="${ path }${ productInfo.proImgpath }${ productInfo.proNo }.jpg" alt="" width="350px" height="250px">
                </td>
                </tr>
                
                <tr>
                <td>
	            <strong>${ productInfo.proName }</strong>
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
	            
				<tr>
				<td>
	            <p> ( 구매 수량: ${ productInfo.proQty } ) </p>
	            </td>
	            </tr>   	            
				</table>
			
        </c:forEach>
        </div>
                        
		</div>

    </div>
    
    <div class="p_date_name">
        <p>프로모션 기간</p>
    </div>
    
    <div class="p_date">
        		<table>
        		<tr>
        		<td><fmt:formatDate value="${ promotionInfo.startDate }" pattern="yyyy-MM-dd ~"/></td>
                <td><fmt:formatDate value="${ promotionInfo.endDate }" pattern="yyyy-MM-dd"/></td>        		
                </tr>
				</table>       
    </div>          

</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
	

<script>
	$(document).ready(function(){
		$(".slide_div").slick(
				{
					dots: true,
					autoplay : true,
					autoplaySpeed: 3000
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


<script>

	function cantUpdateHeart() {	
			alert("로그인 후 이용해주세요.");	
		}
</script>	

	

</body>
</html>