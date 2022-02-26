<%@ page language="java"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>

<head>
    <style>
        .mypage_collection_write_container {
            padding: 50px 0 50px 0;
        }
        .mypage_collection_write {
            border: solid 2px black;
            margin: auto;
        }

        #mypage_collection_write_imagePreview {
            width: 400px;
            height: 400px;
            border: 2px solid black;
        }

        #mypage_collection_write_content {
            width: 300px;
            height: 400px;
        }

        #mypage_collection_write_submit {
            width: 308px;
            height: 30px;
            background-color: blueviolet;
            color: white;
        }
    </style>
</head>
<body class="box" style=" overflow-y: scroll;">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<meta charset="UTF-8">
	<title>CollaVerse</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/style.css">
	
	<h2> 컬렉션 작성</h2>
	
	<form name="collectionWriteFrm" action="${ path }/mypage/collection/write" method="post" enctype="multipart/form-data">
		<div class="mypage_collection_write_container">
	        <table class="mypage_collection_write">	
	            <tr>
	                <td>
	                	<img id="mypage_collection_write_imagePreview" /d>
	                </td>
	                <td>
	                    <input type="text" id="mypage_collection_write_content" name="content"/>
	                </td>
	            </tr>
	            <tr>
	                <td>
	                	<input multiple="multiple" type="file" name="upfile" />
	                </td>
	                <td> 
	                     <button type="submit" id="mypage_collection_write_submit">글쓰기</button>
	                </td>
	            </tr>
	        </table>
	    </div>
	</form>
	
	
	
	<script>
		function readImage(input) {
			if(input.files && input.files[0]) {
				
				const reader = new FileReader();
				
				reader.onload = e => {
					const previewImage = document.getElementById("mypage_collection_write_imagePreview")
					previewImage.src = e.target.result
				}
				
				reader.readAsDataURL(input.files[0])
			}
		}
		
		const inputImage = document.getElementById("mypage_collection_write_imagePreview")
		inputImage.addEventListener("change", e => {
			readImage(e.target)
		})
	</script>
	
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<script src="${ path }/resources/js/mypage_p_collection_list_infinite.js"></script>
	<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
</body>
</html>