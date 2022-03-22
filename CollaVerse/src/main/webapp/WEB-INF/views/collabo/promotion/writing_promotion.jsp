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
	
				<div class="promotion_input">
					<table id="middle">
						<tr>
							<th style="color: #730e74">작성자</th>
							<td><input id="product" type="text" name="writerId" value="${ loginMember.id }" readonly></td>
						</tr>
						<tr>
							<th style="color: #730e74">카테고리</th>
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
							<th style="color: #730e74">시작일</th>
							<td>
								<%-- name="startDate" 달력에서 날짜 선택하게하는 --%>					
								<input type="date" name="startDate">
							</td>
						</tr>
						<tr>
							<th style="color: #730e74">종료일</th>
							<td>
								<%-- name="endDate" 달력에서 날짜 선택하게하는 --%>					
								<input type="date" name="endDate">
							</td>
						</tr>
						<tr>
							<th style="color: #730e74">대표 프로모션 이미지</th>
							<td><input id="product" type="file" name="promImg"></td>
						</tr>
					</table>
				</div>	

    <div class="p_title">
        <hr>
        	<input id="promName" type="text" name="promName" placeholder="프로모션 이름">
        <hr>
    </div>
    
    <div id="promotion_explain">
		<p><textarea id="promContent" name="promContent" placeholder="프로모션 설명"></textarea></p>
    </div>

    <div class="p_info">
    	
        <div class="proInfo">
        
        <div class="proList1">
        	
        		<table>
        		<tr>
        		<th style="color: #730e74">제품1 이미지</th>
        		</tr>
        		
        		<tr>
        		<td>
                <input id="product" type="file" name="prodImg">
                </td>
                </tr>
                
                <tr>
                <td>
	            <p><textarea id="product" name="prodName1" cols="30" rows="1" placeholder="제품1 이름"></textarea></p>
	            </td>
				</tr>

				<tr>
				<td>
	            <p><textarea id="product" name="prodPrice1" cols="30" rows="1" placeholder="제품1 가격"></textarea></p>
	            </td>
				</tr>
				
				<tr>
				<td>
	            <p><textarea id="product" name="prodContent1" cols="50" rows="15" placeholder="제품1 설명/획득 조건"></textarea></p>
	            </td>
	            </tr>
	            
				<tr>
				<td>
	            <p><textarea id="product" name="prodQty1" cols="30" rows="1" placeholder="제품1 구매 가능 수량"></textarea></p>
	            </td>
	            </tr>
				</table>
			
        </div>
        
        <div class="proList2">
        	
        		<table>
        		<tr>
        		<th style="color: #730e74">제품2 이미지</th>
        		</tr>
        		
        		<tr>
        		<td>
                <input id="product" type="file" name="prodImg">
                </td>
                </tr>
                
                <tr>
                <td>
	            <p><textarea id="product" name="prodName2" cols="30" rows="1" placeholder="제품2 이름"></textarea></p>
	            </td>
				</tr>

				<tr>
				<td>
	            <p><textarea id="product" name="prodPrice2" cols="30" rows="1" placeholder="제품2 가격"></textarea></p>
	            </td>
				</tr>
				
				<tr>
				<td>
	            <p><textarea id="product" name="prodContent2" cols="50" rows="15" placeholder="제품2 설명/획득 조건"></textarea></p>
	            </td>
	            </tr>
	            
				<tr>
				<td>
	            <p><textarea id="product" name="prodQty2" cols="30" rows="1" placeholder="제품2 구매 가능 수량"></textarea></p>
	            </td>
	            </tr>
				</table>
			
        </div>
        
        <div class="proList3">
        	
        		<table>
        		<tr>
        		<th style="color: #730e74">제품3 이미지</th>
        		</tr>
        		
        		<tr>
        		<td>
                <input id="product" type="file" name="prodImg">
                </td>
                </tr>
                
                <tr>
                <td>
	            <p><textarea id="product" name="prodName3" cols="30" rows="1" placeholder="제품3 이름"></textarea></p>
	            </td>
				</tr>

				<tr>
				<td>
	            <p><textarea id="product" name="prodPrice3" cols="30" rows="1" placeholder="제품3 가격"></textarea></p>
	            </td>
				</tr>
				
				<tr>
				<td>
	            <p><textarea id="product" name="prodContent3" cols="50" rows="15" placeholder="제품3 설명/획득 조건"></textarea></p>
	            </td>
	            </tr>
	            
				<tr>
				<td>
	            <p><textarea id="product" name="prodQty3" cols="30" rows="1" placeholder="제품3 구매 가능 수량"></textarea></p>
	            </td>
	            </tr>
				</table>
			
        </div>
                        
		</div>
		
		<hr>
		
		<div id="2button2" align="center">
			<button id="promotion_enroll">등록</button>
			<button id="cancel" type="reset">취소</button>
	    </div>

    </div>

    <hr>

</div>
</form>

<!-- 	<script>
		 	$('[name="promImg"]').on('change',function(){
		 	    console.log('파일 변경 성공');
		 	    
		 	    var reader = new FileReader();
		 		
	           reader.onload = function (e) {
	               document.getElementById("imagePreview").src = e.target.result;
	           };
	
	           reader.readAsDataURL(this.files[0]);
		 	    
		 	});
	</script> -->

	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 

</body>
</html>