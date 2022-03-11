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
    	<p id="collection_title">${ writerNickname } 의 컬렉션</p>
    	
    	<c:choose>
	    	<%-- 01. collectionList 가 있음 && loginMember 와 id 가 같음 
	    	         ▶ 컬렉션 작성 버튼 --%>	
	    	<c:when test="${ !empty collectionList && loginMember.id == collectionList.get(0).cltWriterId}">
		    	<a onclick="location.href='${ path }/mypage/collection/write'">
		     		<div id="writeCollection" >New Collection !</div>
		     	</a>
		    </c:when>
		    
		    <%-- 02. collectionList 가 없음 && loginMember 와 id 가 같음
		    	     ▶ 컬렉션 작성 버튼 --%>	
	    	<c:when test="${ noCollectionList == '없음' && loginMember.id == noWriterId }">
		    	<a onclick="location.href='${ path }/mypage/collection/write'">
		     		<div id="writeCollection" >New Collection !</div>
		     	</a>
		    </c:when>
		     
		     <%-- 03. collectionList 가 있음 && login 한 상태로 남의 컬렉션 봄 && followCheck 0
		     		  ▶ 팔로우 버튼 --%>	
		    <c:when test="${ !empty collectionList &&  !empty loginMember 
		    && loginMember.id != collectionList.get(0).cltWriterId 
		    && followerCheck == 0 && followingCheck == 0}">
		        <button id="follow_btn" onclick="updateFollow()">Follow !!</button>
		    </c:when>
		    
		    <%-- 04. collectionList 가 없음 && login 한 상태로 남의 컬렉션 봄 && followCheck 0
		     		  ▶ 팔로우 버튼 --%>		    
		    <c:when test="${ noCollectionList == '없음' &&  !empty loginMember 
		    && loginMember.id != noWriterId 
		    && followerCheck == 0 && followingCheck == 0}">
		        <button id="follow_btn" onclick="updateFollow()">Follow !!</button>
		    </c:when>
		    
		    <%-- 05. collectionList 가 있음 && login 한 상태로 남의 컬렉션 봄 && followCheck 1
		     		  ▶ 팔로우 취소 버튼 --%>		    
		    <c:when test="${ !empty collectionList &&  !empty loginMember 
		    && loginMember.id != collectionList.get(0).cltWriterId 
		    && followerCheck == 1 && followingCheck == 1}">
		        <button id="unfollow_btn" onclick="updateFollow()">UnFollow..</button>
		    </c:when>
		   
		    <%-- 05. collectionList 가 없음 && login 한 상태로 남의 컬렉션 봄 && followCheck 1
	     		  ▶ 팔로우 취소 버튼 --%>		    
		    <c:when test="${ noCollectionList == '없음' &&  !empty loginMember 
		    && loginMember.id != noWriterId 
		     && followerCheck == 1 && followingCheck == 1}">
		        <button id="unfollow_btn" onclick="updateFollow()">UnFollow !!</button>
		    </c:when>
		    
		    <c:otherwise>
		    </c:otherwise>
		    
	     </c:choose>
	     

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
		<%-- 모달창 관련 --%>
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
		
		
		<%-- follow 신청 / 취소 --%>
		var to_mem_no = ${ writerNo };
		var from_mem_no = ${ loginMember.no };
		var followerCheck = ${ followerCheck };
		var followingCheck = ${ followingCheck };
		
		function updateFollow() {
			$.ajax({
				type : "POST",
				url : "${ path }/mypage/follow/updateFollow",
				dataType : "json",
				data : {'to_mem_no' : to_mem_no, 'from_mem_no' : from_mem_no,
						'followerCheck' : followerCheck, 'followingCheck' : followingCheck },
				error : function() {
					alert("팔로우 실패");
				},
				success : function(followCheck) {
					
					if(followCheck == 0) {
						alert("Follow 성공 !");
						location.reload();
					} 
					else if (followCheck == 1){
						alert("Follow 취소...");
						location.reload();
					}
				}
					
			});
		}
	</script>
	
</body>
</html>