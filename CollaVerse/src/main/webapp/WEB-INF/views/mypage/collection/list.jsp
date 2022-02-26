<%@ page language="java"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>

<head>
	<meta charset="UTF-8">
	<title>CollaVerse</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/style.css">
    <style>
    	.collection_container{
    		height:auto;
    	}
        .mypage_mycollection_title {
            width: 100%;
            height: 80px;
            border: 1px solid black;
            text-align: left;
            font-size:30px;
            padding: 20px 0 20px 30px ;
            margin: 0 0 80px 0;
            box-sizing: border-box;
        }

		#collection_write_button_space {
		width: 30%;
		float: right;
		}
		
        .mypage_mycollection_list_container {
            width: 70%;
            height: 650px; /* auto 가 왜 안먹지? */
            margin: auto;

        }

        .mypage_mycollection_list {
            height: auto;
            margin: 0 0 30px 0;
        }


        .mypage_mycollection_list .collection_list {
            float : left;
        }

        #collection_box {
            width: 30%;
            height: 270px;
            border: 1px solid rgb(89, 22, 145);
            margin: 20px 20px 0 0 ;
        }
        
        #collection_no_collectionList {
       		text-align : center;
       	}
    </style>
</head>
<body class="box" style=" overflow-y: scroll;">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<input type="hidden" value="${ member.id }"></hidden>
	
	<section id="section">
	    <div class="mypage_mycollection_title">
	    	My 컬렉션
	    	<div id="collection_write_button_space">
				<a onclick="location.href='${ path }/mypage/collection/write'">
        			<div id="feed_write" >새 피드 작성</div>
        		</a>
	    </div>
	    
	    
	    <div class="mypage_mycollection_list_container">
            <div class="mypage_mycollection_list">
            <c:choose>
		    	<c:when test="${ !empty collectionList }">
				    <c:forEach var="collectionList" items="${ collectionList }">
	                    <div class="collection_list" id="collection_box">  
	                    	${ collectionList.cltNo }
	                    </div>
				    </c:forEach>
				</c:when>
		    	<c:otherwise>
		    		<p id="collection_no_collectionList">컬렉션이 존재하지 않습니다.</p>
				</c:otherwise>
            </c:choose>

            </div>
	    </div>
    </section>    
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>    
	
	<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
</body>
</html>