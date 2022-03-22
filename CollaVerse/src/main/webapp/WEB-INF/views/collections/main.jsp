<%@ page language="java"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>

<head>
<meta charset="UTF-8">
<title>CollaVerse</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/collections/main.css">
<script src="${ path }/resources/js/jquery-3.6.0.js"></script>

<style>
        #userContainer .box{
            height: 500px; background: tomato; color:white;
            box-sizing: border-box; padding: 30px 10px;
        }
        #userContainer .box:nth-child(2n) { background: teal;}
    </style>
    
</head>

<body class="box" style=" overflow-y: scroll;">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
    <div class="mini_title" id="search_user_title">
    
    	<p id="search_user_title_text">컬렉션 검색</p>	

    </div>
	
	<div id="order_container">
	
   			<p id="orderby">컬렉션 정렬 방식 </p>    	   	   
    		 
    		<p id="orderby2">
    			<a onclick="location.href='${ path }/collections/search/only_brand'">브랜드  </a>	
    		</p>

 			<p id="orderby">│</p> 
 			
	    	<p id="orderby3">
	    		<a onclick="location.href='${ path }/collections/search/only_user'">콜라버스 유저</a>
			</p>
	
	</div>
	
	
	<div id="searchContainer">

		 <form name="collectionWriteFrm" action="${ path }/collections/search/result" method="POST">

			
			<select name="searchCategory" id="searchCategory">
				<option value="id">ID</option>
					 
		        <option value="nickname">닉네임</option>
				
			</select>
			<input type="text" name="keyword" id="searchUser" placeholder="검색 내용을 입력해주세요" required>
			<input type="submit" id="searchSubmit" value="검색">

		</form>

	
	</div>			 
		
		
	<div id="userContainer">			
		
	</div>
	

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<script>
	
		var count =1;
        var timer;
		
		window.onload = function() {
			getList();	
		}
		
	    window.onscroll = function() {
	        if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
	          clearTimeout(timer);
	          timer = setTimeout(function() {
	            // 실행할 코드 내용
	        	getList();        	
	          },200) 
	        }

	    };
		
	    function getList() {
	    	$.ajax({
        		type : 'post',
        		url : '${ path }/collections/infinite',
        		dataType : 'json',
        		data : {
        			lastBlock : count
        		},
        		error : function() {
        			alert("에러났다긔");
        		},
        		success : function(data) {
        			var str = "";
        			
        			if (data != "" && data.length != 0 ) {
        				$(data).each(function(index, value) {
        					str += '<div class="user_info_container">' 
        						+ '<img id="profile_image" src="${ path }/resources/upload/profile/' + value.profile_img + '" onclick="location.href=\'${ path }/mypage/collection/list/' + value.id + '\'" />' 
	        					+ '<p id="user_nickname">' + value.nickname + '</p>'
        						+ '</div>'	
        					;
        				});
        				console.log(str);
        				
        				$("#userContainer").append(str);
        				
        				count++;
        				
        			} else {
        				window.onscroll = null;
        			}
        		} 
        		
        		
        	});
	    }
		
	</script>
	

	
</body>
</html>