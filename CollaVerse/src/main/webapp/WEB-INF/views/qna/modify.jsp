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
<title>게시판 수정</title>
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
	<form id="modifyForm" action="${ path }/qna/modify" method="post">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">게시글 수정</h3>
				</div>
				<div class="card-body">
					<div class="form-group">
						<label for="bno">번호</label>
						<input class="form-control" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>' readonly>
					</div>
					<div class="form-group">
						<label for="title">제목</label>
						<input class="form-control" id="title" name="title" value='<c:out value="${pageInfo.title}"/>'>
					</div>
					<div class="form-group">
						<label for="content">내용</label>
						<textarea class="form-control" id="content" name="content" rows="10" style="resize: none;"><c:out value="${pageInfo.content}"/></textarea>
					</div>
					<div class="form-group">
						<label for="writer">작성자</label>
						<input class="form-control" id="writer" name="writer" value="${pageInfo.writer}" readonly>
					</div>
				</div>		
				<div class="card-footer">
					<button type="button" class="btn-primary" id="list_btn"><i class="fa fa-list"></i> 목록</button>
					<div class="float-right">
						<button type="button" class="btn-warning cancelBtn" id="cancel_btn"><i class="fa fa-trash"></i> 취소</button>
						<button type="submit" class="btn-success modBtn" id="modify_btn"><i class="fa fa-save"></i> 수정 저장</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<form id="infoForm" action="${ path }/qna/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
		<input type="hidden" name="keyword" value="${cri.keyword }">
		<input type="hidden" name="type" value="${pageMaker.cri.type }">
	</form>
<script>
let form = $("#infoForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
let mForm = $("#modifyForm");    // 페이지 데이터 수정 from

/* 목록 페이지 이동 버튼 */
$("#list_btn").on("click", function(e){
    form.find("#bno").remove();
    form.attr("action", "${ paht }/qna/qnaList");
    form.submit();
});

/* 수정 하기 버튼 */
$("#modify_btn").on("click", function(e){
    mForm.submit();
});

/* 취소 버튼 */
$("#cancel_btn").on("click", function(e){
    form.attr("action", "${ path }/qna/read");
    form.submit();
});

/* 삭제 버튼 */
$("#delete_btn").on("click", function(e){
    form.attr("action", "${ path }/qna/delete");
    form.attr("method", "post");
    form.submit();
});
</script>	
</body>
</html>