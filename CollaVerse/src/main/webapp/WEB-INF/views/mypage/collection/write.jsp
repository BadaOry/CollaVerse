<%@ page language="java"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>

<head>

</head>
<body class="box" style=" overflow-y: scroll;">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<meta charset="UTF-8">
	<title>CollaVerse</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/mypage/collection/write.css">
	<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
	
	<h2> 컬렉션 작성</h2>
	
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
	                	<input multiple="multiple" type="file" name="upfile"  />
	                </td>
	                <td> 
	                     <button type="submit" id="mypage_collection_write_submit">글쓰기</button>
	                </td>
	            </tr>
	        </table>
	    </div>
	</form>
	 
	 <%-- 
	 	<script>
	       document.getElementsByName("files").onchange = function() {
	           var reader = new FileReader();
	
	           reader.onload = function (e) {
	               document.getElementById("imagePreview").src = e.target.result;
	           };
	
	           reader.readAsDataURL(this.files);
	        };
		</script>
	 --%>
	
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

	
</body>
</html>