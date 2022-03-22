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

#list_btn {
	font-family: 'Sam3KRFont';
	font-size: 15px;
	color: white;
	/* 변경값 */
	width: 80px;
	background-color : #730e74;
	border-color: #faae22;	
}

#modify_btn {
	font-family: 'Sam3KRFont';
	font-size: 15px;
	color: white;
	/* 변경값 */
	width: 130px;
	background-color : #730e74;
	border-color: #faae22;	
}

#cancel_btn {
	font-family: 'Sam3KRFont';
	font-size: 15px;
	color: #730e74;
	/* 변경값 */
	width: 80px;
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
<body>
	<form id="modifyForm" action="${ path }/notice/modify" method="post">
		<div class="col-lg-12">
			<div class="cardd">
				<div class="card-headerr">
					<h3 class="card-title">게시글 수정</h3>
				</div>
				<div class="card-body">
					<div class="form-group">
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
					<button type="button" class="btn-primary" id="list_btn" style="margin: 0 0 0 180px;"><i class="fa fa-list"></i> 목록</button>
					<div class="float-right">
						<button type="button" class="btn-warning cancelBtn" id="cancel_btn"><i class="fa fa-trash"></i> 취소</button>
						<button type="submit" class="btn-success modBtn" id="modify_btn" style="margin: 0 180px 0 0;"><i class="fa fa-save"></i> 수정 저장</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<form id="infoForm" action="${ path }/notice/modify" method="get">
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
    form.attr("action", "${ paht }/notice/noticeList");
    form.submit();
});

/* 수정 하기 버튼 */
$("#modify_btn").on("click", function(e){
    mForm.submit();
});

/* 취소 버튼 */
$("#cancel_btn").on("click", function(e){
    form.attr("action", "${ path }/notice/read");
    form.submit();
});

/* 삭제 버튼 */
$("#delete_btn").on("click", function(e){
    form.attr("action", "${ path }/notice/delete");
    form.attr("method", "post");
    form.submit();
});
</script>	
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>