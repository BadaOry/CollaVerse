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
            margin-right: 20px;
        }
    </style>
</head>
<body class="box" style=" overflow-y: scroll;">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<section id="section">
	    <div class="mypage_mycollection_title">
	    	My 컬렉션
	    	<!-- 
	    	<div id="collection_write_button_space">
	    		<c:if test=" ${ loginMember } != null && ${ loginMember.id } == ">
		    		<button id="collection_write_button" onclick="${ path }/mypage/collection/write" method="get"> 컬렉션 저장하기 </button>
	    		</c:if>
	    	</div>
	    	 -->
	    </div>
	    
	    
	    <div class="mypage_mycollection_list_container">
            <div class="mypage_mycollection_list">
			    <c:forEach var="collectionList" items="${ collectionList }">
                    <div class="collection_list" id="collection_box">  
                    	${ collectionList.cltNo }
                    </div>
			    </c:forEach>

            </div>
	    </div>
    </section>    
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>    
	
	<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
</body>
</html>