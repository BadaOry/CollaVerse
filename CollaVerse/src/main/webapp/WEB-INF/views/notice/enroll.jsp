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
/* 헤더 */
#header1 {
	height: 80px;
	margin: -20px 0 0 0; 
}

#header3 {
	margin: 35px 0 0 0;
}


body {
	margin: 8px;
}
	
h2 {
	text-align: center;
	font-size: 100px;
}

/* --------- */

.card-title {
	/* 고정값 */
	font-family: 'Sam3KRFont';
	font-size: 40px;
	color: #730e74;
	position: relative;
	left: 150px;
	/* 변경값 */
	text-align: left;
	margin: 50px 0 30px 50px; /* 위아래 마진은 고정, 왼쪽 마진만 변경하여 사용*/
}

.card-body {
	padding: 0 200px 0 200px;
}

label {
	font-family: 'DOSGothic';
	font-size: 20px;
}

input, textarea {
	font-family: 'DOSGothic';
	height: 40px;
}

.btn-primary, .btn-success {
	font-family: 'Sam3KRFont';
	font-size: 15px;
	color: white;
	/* 변경값 */
	width: 80px;
	background-color : #730e74;
	border-color: #faae22;	
}
.btn-primary:hover {
	background-color: #730e74;
	border-color: #730e74;
}
.btn-success:hover {
	background-color: #730e74;
	border-color: #730e74;
}

.btn-warning {
	font-family: 'Sam3KRFont';
	font-size: 15px;
	color: #730e74;
	/* 변경값 */
	width: 100px;
	background-color : #faae22;
	border-color: #730e74;
}

.card-header with-border {
	border-bottom: 0px solid rgba(0,0,0);
}

.cardd {
	margin: 0 0 30px 0 ;
}

.card-footer {
	background-color: white;
}
#info_container #serviceInfo {
	margin-top: 12px;
}
#info_container #gitHub {
	margin-top: 11px;
}
</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
</head>
<body class="hold-transition sidebar-mini">
	<form role="form" id="writeForm" method="post" action="${ path }/notice/enroll">
		<div class="cardd">
			<div class="card-headerr with-border">
				<h3 class="card-title">공지사항 작성</h3>
			</div>
			<div class="card-body">
				<div class="form-group">
					<label for="title"></label>
					<input class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" style="border-color: #730e74;">
				</div>
				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="content" name="content" rows="10" placeholder="내용을 입력해주세요" style="resize: none; border-color: #730e74;"></textarea>
				</div>
				<div class="form-group">
					<label for="writer">작성자</label>
					<input class="form-control" id="writer" name="writer" style="border-color: #730e74;">
				</div>
			</div>
			<div class="card-footer">
				<button type="button" class="btn-primary"  style="margin: 0 0 0 180px;"><i class="fa fa-list"></i> 목록</button>
				<div class="float-right">
					<button type="reset" class="btn-warning"><i class="fa fa-reply"></i> 초기화</button>
					<button type="submit" class="btn-success" style="margin: 0 180px 0 0;"><i class="fa fa-save"></i> 저장</button>
				</div>
			</div>
		</div>
	</form>
</body>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>