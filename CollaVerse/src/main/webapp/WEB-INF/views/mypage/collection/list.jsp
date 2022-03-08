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
	
	<section id="section">
	
    <div class="mini_title" id="mypage_mycollection_title">
    	<p id="collection_title">My 컬렉션</p>
    	
    	<c:if test="${ !empty collectionList && loginMember.id == collectionList.get(0).cltWriterId}">
		    	<a onclick="location.href='${ path }/mypage/collection/write'">
		     		<div id="writeCollection" >New Collection !</div>
		     	</a>
	     </c:if>

	</div>
	    
    <div class="mypage_mycollection_list_container">
           <div class="mypage_mycollection_list">
           <c:choose>
	    	<c:when test="${ !empty collectionList }">
				    <c:forEach var="collectionList" items="${ collectionList }">
	                    
	                    <div class="collection_list" id="collection_box">
	                    
	                    	<img src= "${ path }/resources/upload/collection/${ collectionList.renamedFileName01 }"
	                    		style="width: 100%; height: 100%" />
	                    	<%-- ▲ ${ collectionList.cltNo } : ${ collectionList.cltContent } --%>
	                    		
	                    	<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								
								<div class="modal-dialog" role="document">
									
									<div class="modal-content">
										
										<div class="modal-header"></div>
						                <img src="${ path }/resources/upload/collection/${ collectionList.renamedFileName01 }">
										
										<div class="modal-body" id="cltContent">${ collectionList.cltContent }</div>
										
										<div class="modal-footer">
											<c:choose>
												<c:when test="${ !empty loginMember && loginMember.id == collectionList.cltWriterId}">
													<span id="update_btn" onclick="location.href='${ path }/mypage/collection/update?cltNo=${ collectionList.cltNo }'">수정</span>
													<span class="deleteModalClass" id="delete_btn">삭제
														<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
															<div class="modal-dialog" role="document" id="confirmModal" 
																style="margin-top: 38%;">
																<div class="modal-content" id="deleteModalColoring">	
																	<table style="padding: 0 0 0 180px;">
																		<tr><span>정말로 삭제하시겠습니까?</span></tr>
																		<tr>
																			<td>
																			<span id="delete_btn_y" onclick="location.href='${ path }/mypage/collection/delete?cltNo=${ collectionList.cltNo }'">네</span>
																			</td>
																			<td>
																			<span class="delete_btn_n" id="delete_btn_n">아니오</span>
																			</td>
																		</tr>
																	</table>
																</div>
															</div>
														</div>			
													</span>	
												</c:when>
												<c:otherwise>
													
												</c:otherwise>
											</c:choose>	
											
										</div>
										
									</div>
								</div>
	                    	</div>
	                    	
	                    </div>
				    </c:forEach>
			</c:when>
			
			<c:when test="${ noCollectionList == '없음' }">
	    		<p id="collection_no_collectionList">컬렉션이 존재하지 않습니다.</p>
			</c:when>
			
	    	<c:otherwise>
			</c:otherwise>
           </c:choose>

           </div>
	    </div>
    </section>    
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>    
	
	<script>
		$('.collection_list').click(function(e){
			e.preventDefault();
			$(this).children('#detailModal').modal("show");
		});

	
		$('.deleteModalClass').click(function(e){
			e.preventDefault();
			$(this).children('#deleteModal').modal("show");
		});
		
		
		$('.delete_btn_n').click(function(e){
			e.preventDefault();
			$(this).parents('#deleteModal').modal("hide");
		});
	</script>
	
</body>
</html>