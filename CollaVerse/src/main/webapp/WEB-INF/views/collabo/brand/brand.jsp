<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CollaVerse</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/collabo.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    

    

    <div class="brand_list">
  
		<p>BRAND</p>
		
	<div class="brand_logo">
    		브랜드 리스트 (로고)
    </div>
		
	</div>

				<div class="brand_array">
						<h3>ABC</h3> 
						
						<h3>가나다</h3>
				</div>
				
				<div class="form-type">
					<select id="select-type" name="type">
						<option value="A">A</option>
						<option value="가">가</option>
					</select>
				</div>

				<div class="brand_list">
					
				</div>


    	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
    	
</body>
</html>