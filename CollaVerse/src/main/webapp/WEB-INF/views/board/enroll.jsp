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
<title>등록창</title>
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
</head>
<body class="hold-transition sidebar-mini">

      		<form role="form" id="writeForm" method="post" action="${ path }/board/enroll">
      			<div class="card">
      				<div class="card-header with-border">
      					<h3 class="card-title">게시글 작성</h3>
      				</div>
      				<div class="card-body">
      					<div class="form-group">
      						<label for="title">제목</label>
      						<input class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
      					</div>
      					<div class="form-group">
      						<label for="content">내용</label>
      						<textarea class="form-control" id="content" name="content" rows="30" placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
      					</div>
      					<div class="form-group">
      						<label for="writer">작성자</label>
      						<input class="form-control" id="writer" name="writer">
      					</div>
      				</div>
      				<div class="card-footer">
      					<button type="button" class="btn btn-primary"><i class="fa fa-list"></i> 목록</button>
      					<div class="float-right">
      						<button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i> 초기화</button>
      						<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 저장</button>
      					</div>
      				</div>
      			</div>
      		</form>
      	

</body>
</html>
