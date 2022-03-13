<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CollaVerse</title>
<!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="${ path }/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${ path }/dist/css/adminlte.min.css">
  <link rel="stylesheet" href="${ path }/css/bootstrap.min.css">
<script src="${ path }/js/jquery-3.6.0.js"></script>
<style>
	html {
		width: 1200px;
		margin: auto;
	}
</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
</head>
<body>
	<div class="col-lg-12">
   		<div class="card">
   			<div class="card-header">
   				<h3 class="card-title">글제목 : <c:out value="${pageInfo.title}"/></h3>
  			</div>
   			<div class="card-body" style="height: 300px">
   				<c:out value="${pageInfo.content}"/>
   			</div>
   			<div class="card-footer">
   				<div class="user-block">
   					<img class="img-circle img-bordered-sm" src="${path}/dist/img/user1-128x128.jpg" alt="user image">
   					<span class="username"> <a href="#"><c:out value="${pageInfo.writer}"/>
   						</a>
   					</span>
   					<span class="description"><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${pageInfo.modifyDate}"/></span>
   				</div>
   			</div>
   			<div class="card-footer">
   				
   				<button type="submit" id="list_btn" class="btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
   				<div class="float-right">
   					<button type="submit" id="modify_btn" class="btn-warning modBtn"><i class="fa fa-edit"></i> 수정</button>
   					<button type="submit" id="delete_btn" class="btn-danger delBtn"><i class="fa fa-trash"></i> 삭제</button>
   				</div>
   			</div>
   		</div>
   	</div>
   	
   	<!-- 댓글 -->
	<p>댓글</p>
	<div id="reply">
	    <c:forEach items="${reply}" var="replyList">
	        <p>
	        작성자 : ${replyList.writer}<br />
	        작성 날짜 :  <fmt:formatDate value="${replyList.regDate}" pattern="yyyy-MM-dd" />
	        </p>
	
	        <p>${replyList.content}</p>
	    </c:forEach>   
	</div>
   	
   	
   	<!-- 댓글작성 -->
	<form name="replyForm" method="post">
	  <input type="hidden" id="bno" name="bno" value="${pageInfo.bno}" />
	  <input type="hidden" id="page" name="page" value="${cri.pageNum}"> 
	  <input type="hidden" id="perPageNum" name="perPageNum" value="${cri.amount}"> 
	  <input type="hidden" id="searchType" name="searchType" value="${cri.type}"> 
	  <input type="hidden" id="keyword" name="keyword" value="${cri.keyword}"> 
   	<p>
	    <label>댓글 작성자</label>
	    <input type="text" name="writer" />
	</p>
	<p>
	  	<textarea rows="2" cols="100" name="content"></textarea>
	</p>
	<div>
	 	 <button type="button" class="replyWriteBtn">작성</button>
	</div>
	</form>
   	
	<form id="infoForm" action="${ path }/qna/modify" method="get">
		<input type="text" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>' style='display:none;'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
		<input type="hidden" name="keyword" value="${cri.keyword }">
		<input type="hidden" name="type" value="${cri.type }">
	</form>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
let form = $("#infoForm");

/* 목록 버튼 */
$("#list_btn").on("click", function(e){
	form.find("#bno").remove();
	form.attr("action", "${ path }/qna/qnaList");
	form.submit();
});

/* 수정 버튼 */
$("#modify_btn").on("click", function(e){
	form.attr("action", "${ path }/qna/modify");
	form.submit();
});

/* 삭제 버튼 */
$("#delete_btn").on("click", function(e){
    form.attr("action", "${ path }/qna/delete");
    form.attr("method", "post");
    form.submit();
});

$(".replyWriteBtn").on("click", function(){
	  var formObj = $("form[name='replyForm']");
	  formObj.attr("action", "${ path }/qna/replyWrite");
	  formObj.submit();
	});
</script>	
</html>