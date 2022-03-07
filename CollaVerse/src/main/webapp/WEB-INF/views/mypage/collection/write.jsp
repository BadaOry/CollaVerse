<%@ page language="java"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>

<head>
<meta charset="UTF-8">
<title>CollaVerse</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/mypage/collection/write.css">
<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
</head>

<body class="box" style=" overflow-y: scroll;">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
    <div class="mini_title" id="mypage_mycollection_write_title">
    	<p id="collection_write_title">My 컬렉션 작성</p>	
    </div>
	
	<form name="collectionWriteFrm" action="${ path }/mypage/collection/write" method="post" enctype="multipart/form-data">
		<div class="mypage_collection_write_container">
	        <table class="mypage_collection_write">	
	            <tr>
	                <td>
	                	<img id="imagePreview" />
	                </td>
	                <td>
	                    <input type="text" id="mypage_collection_write_content" name="content"/>
	                </td>
	            </tr>
	            <tr>
	                <td>
	                	<input type="file" name="upfile"  />
	                </td>
	                <td> 
	                     <button type="submit" id="mypage_collection_write_submit">글쓰기</button>
	                </td>
	            </tr>
	        </table>
	    </div>
	</form>
	 

	 	<script>
		 	$('[name="upfile"]').on('change',function(){
		 	    console.log('파일 변경 성공');
		 	    
		 	    var reader = new FileReader();
		 		
	           reader.onload = function (e) {
	               document.getElementById("imagePreview").src = e.target.result;
	           };
	
	           reader.readAsDataURL(this.files[0]);
		 	    
		 	});
	 	
		</script>

	
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

	
</body>
</html>