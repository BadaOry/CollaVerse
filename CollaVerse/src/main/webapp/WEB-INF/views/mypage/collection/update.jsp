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
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/mypage/collection/update.css">
	<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
	
	<h2> 컬렉션 수정</h2>
	
	<form name="collectionUpdateFrm" action="${ path }/mypage/collection/update" method="post" enctype="multipart/form-data">
		<div class="mypage_collection_write_container">
	        <table class="mypage_collection_write">	
	            <tr>
	                <td>
	                	<img id="imagePreview" src="${ path }/resources/upload/collection/${ updateCollectionInfo.renamedFileName01 }"/>
	                </td>
	                <td>
	                    <input type="text" id="mypage_collection_update_content" name="content"
	                    	value=" ${ updateCollectionInfo.cltContent }"/>
	                </td>
	            </tr>
	            <tr>
	                <td>
	                	<input type="hidden" id="cltNo" name="cltNo" value="${ updateCollectionInfo.cltNo }">
	                </td>
	                <td>
	                     <button type="submit" id="mypage_collection_update_submit">컬렉션 수정</button>
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