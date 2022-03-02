<%@ page language="java"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>

<head>
	<meta charset="UTF-8">
	<title>CollaVerse</title>
	
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/mypage/collection/list.css">
	
	<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
	
	<link rel="stylesheet" href="${ path }/resources/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${ path }/resources/bootstrap/css/bootstrap.css" />
	<script src="${ path }/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="box" style=" overflow-y: scroll;">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<input type="hidden" value="${ member.id }"></hidden>
	
	<section id="section">
	<div class="title_and_write_button">
	    <div class="mypage_mycollection_title">
	    	My 컬렉션
	    	<div id="collection_write_button_space">
				<a onclick="location.href='${ path }/mypage/collection/write'">
        			<div id="feed_write" >새 피드 작성</div>
        		</a>
		    </div>
		</div>
	</div>
	    
    <div class="mypage_mycollection_list_container">
           <div class="mypage_mycollection_list">
           <c:choose>
	    	<c:when test="${ !empty collectionList }">
				    <c:forEach var="collectionList" items="${ collectionList }">
	                    <div class="collection_list" id="collection_box">
	                    
	                    	<img src= "${ path }/resources/upload/collection/${ collectionList.renamedFileName01 }"
	                    		style="width: 100%; height: 100%" />
	                    	▲ ${ collectionList.cltNo } : ${ collectionList.cltContent }
	                    		
	                    	<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header"></div>
						                <img src="${ path }/resources/upload/collection/${ collectionList.renamedFileName01 }">
										<div class="modal-body">
											${ collectionList.cltContent }					
											</div>
										<div class="modal-footer">
											<button onclick="location.href='${ path }/mypage/collection/update?cltNo=${ collectionList.cltNo }'">수정</button>
											<button onclick="location.href='${path}/mypage/collection/delete'"> 삭제 </button>
										</div>
									</div>
								</div>
	                    	</div>
	                    	
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
	
	<script>
		$('#collection_box').click(function(e){
			e.preventDefault();
			$('#detailModal').modal("show");
		});
	</script>
	
</body>
</html>