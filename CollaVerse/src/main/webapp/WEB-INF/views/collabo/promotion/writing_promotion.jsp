<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />

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

<form action="${ pageContext.request.contextPath }/collabo/promotion/writing_promotion" method="post"
				enctype="multipart/form-data">
   <div class="frame">
	
				<div class="slide_content">
				<div class="slide_div">
					<div style="width: 550; height: 400px">
						<a><strong>작성자 </strong></a><input type="text" name="writerId" value="${ loginMember.id }" readonly>
					<table>
						<tr>
							<th>카테고리</th>
							<td>
								<select name="c_no">
									<option value="1">리빙</option>
									<option value="2">문화</option>
									<option value="3">식품</option>
									<option value="4">테크</option>
									<option value="5">패션</option>
								</select>					
							</td>
						</tr>
						<tr>
							<th>시작일</th>
							<td>
								<%-- name="startDate" 달력에서 날짜 선택하게하는 --%>					
								<input type="date" name="startDate">
							</td>
						</tr>
						<tr>
							<th>종료일</th>
							<td>
								<%-- name="endDate" 달력에서 날짜 선택하게하는 --%>					
								<input type="date" name="endDate">
							</td>
						</tr>
					</table>
					</div>
				</div>				
				</div>	

    <div class="p_title">
        <hr>
        	<input type="text" name="promName" id="title" placeholder="프로모션 이름">
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
			
        </div>
        
        <div class="proList2">
        	
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
			
        </div>
        
        <div class="proList3">
        	
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
			
        </div>
                        
		</div>

    </div>

    <hr>

<!--       
     <div class="brand_title">
        <p>브랜드 소개</p>
     </div>
     
     <div class="brand_introduction"> 
     <c:forEach var="brandInfo" items="${ brandInfo }" begin="0" end="1">  
        <table>
        		<tr>
        		<td>
                <p>${ brandInfo.brName }</p>
                </td>
                <td>
	            <p>${ brandInfo.brContent }</p>
	            </td>                
                </tr>
                
		</table>		
        </c:forEach>
    </div>
-->

</div>
</form>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
	
	<!-- <h2>프로모션 작성</h2>
		
			<table>
				<tr>
					<th>프로모션 이름</th>
					<td><input type="text" name="promName" id="title"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writerId" value="${ loginMember.id }" readonly></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<select name="c_no">
							<option value="1">리빙</option>
							<option value="2">문화</option>
							<option value="3">식품</option>
							<option value="4">테크</option>
							<option value="5">패션</option>
						</select>					
					</td>
				</tr>
				<tr>
					<th>시작일</th>
					<td>
						<%-- name="startDate" 달력에서 날짜 선택하게하는 --%>					
						<input type="date" name="startDate">
					</td>
				</tr>
				<tr>
					<th>종료일</th>
					<td>
						<%-- name="endDate" 달력에서 날짜 선택하게하는 --%>					
						<input type="date" name="endDate">
					</td>
				</tr>
				<tr>
					<th>대표 프로모션 이미지</th>
					<td><input type="file" name="promImg"></td>
				</tr>
				<tr>
					<th>제품1 이미지</th>
					<td><input type="file" name="prodImg"></td>
				</tr>
				<tr>
					<th>제품1 이름</th>
					<td><textarea name="prodName1" cols="30" rows="1" ></textarea></td>
				</tr>
				<tr>
					<th>제품1 가격</th>
					<td><textarea name="prodPrice1" cols="30" rows="1" ></textarea></td>
				</tr>
				<tr>
					<th>제품1 구매가능 수량</th>
					<td><textarea name="prodQty1" cols="30" rows="1" ></textarea></td>
				</tr>
				<tr>
					<th>제품1 설명 / 획득 조건</th>
					<td><textarea name="prodContent1" cols="50" rows="15" ></textarea></td>
				</tr>
				<tr>
					<th>제품2 이미지</th>
					<td><input type="file" name="prodImg"></td>
				</tr>
				<tr>
					<th>제품2 이름</th>
					<td><textarea name="prodName2" cols="30" rows="1" ></textarea></td>
				</tr>
				<tr>
					<th>제품2 가격</th>
					<td><textarea name="prodPrice2" cols="30" rows="1" ></textarea></td>
				</tr>
				<tr>
					<th>제품2 구매가능 수량</th>
					<td><textarea name="prodQty2" cols="30" rows="1" ></textarea></td>
				</tr>
				<tr>
					<th>제품2 설명 / 획득 조건</th>
					<td><textarea name="prodContent2" cols="50" rows="15" ></textarea></td>
				</tr>
				<tr>
					<th>제품3 이미지</th>
					<td><input type="file" name="prodImg"></td>
				</tr>
				<tr>
					<th>제품3 이름</th>
					<td><textarea name="prodName3" cols="30" rows="1" ></textarea></td>
				</tr>
				<tr>
					<th>제품3 가격</th>
					<td><textarea name="prodPrice3" cols="30" rows="1" ></textarea></td>
				</tr>
				<tr>
					<th>제품3 구매가능 수량</th>
					<td><textarea name="prodQty3" cols="30" rows="1" ></textarea></td>
				</tr>
				<tr>
					<th>제품3 설명 / 획득 조건</th>
					<td><textarea name="prodContent3" cols="50" rows="15" ></textarea></td>
				</tr>
				<tr>
					<th>프로모션 설명</th>
					<td><textarea name="promContent" cols="100" rows="15" ></textarea></td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="등록">
						<input type="reset" value="취소">
					</th>
				</tr>
			</table>   -->

</body>
</html>