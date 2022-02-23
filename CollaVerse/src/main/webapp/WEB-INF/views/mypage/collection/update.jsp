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

        #mypage_collection_update_content {
            width: 300px;
            height: 400px;
        }

        #mypage_collection_update_submit {
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
	
	<h2> 컬렉션 수정</h2>
	
	<form name="collectionUpdateFrm" action="${ path }/mypage/collection/update" method="get" enctype="multipart/form-data">
		<div class="mypage_collection_write_container">
	        <table class="mypage_collection_write">	
	            <tr>
	                <td id="mypage_collection_write_imagePreview"></td>
	                <td>
	                    <input type="text"  id="mypage_collection_write_content"
	                    	value=${ mypagePCollection.content }>
	                </td>
	            </tr>
	            <tr>
	                <td><input type="file" name="upfile"></td>
	                <td> 
	                     <button type="submit" id="mypage_collection_update_submit">글쓰기</button>
	                </td>
	            </tr>
	        </table>
	    </div>
	</form>
	
	
    <script>
	    // ▼ Image Preview
	    $(document).ready(() => {
	        $('input[name="upfile"]').on('change',function(e) {
	            console.log(e);
	            
	            var reader = new FileReader();
	            reader.onload = function(file){
	                $('#mypage_collection_write_imagePreview').html($('<img src="' + file.target.result + '">'));
	            };
	            reader.readAsDataURL(e.target.files[0]);
	            // $('#mypage_collection_write_imagePreview')
	        });
	    });
	</script>
	
	
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<script src="${ path }/resources/js/mypage_p_collection_list_infinite.js"></script>
	<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
</body>
</html>