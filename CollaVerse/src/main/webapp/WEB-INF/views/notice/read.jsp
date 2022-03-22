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

.mini-title {
	/* 고정값 */
	font-family: 'Sam3KRFont';
	font-size: 40px;
	color: #730e74;
	position: relative;
	left: -40px;
	/* 변경값 */
	text-align: left;
	margin: 50px 0 30px 50px; /* 위아래 마진은 고정, 왼쪽 마진만 변경하여 사용*/
}

.card-title {
	/* 고정값 */
	font-family: 'Sam3KRFont';
	font-size: 23px;
	color: white;
	/* 변경값 */
	text-align: left;
	margin: 10px 0 10px 50px; /* 위아래 마진은 고정, 왼쪽 마진만 변경하여 사용*/
	width: 60%;
}

.card-body{
	height: auto;
	padding: 60px 0 60px 80px;
	text-align: left;
}

.card-header{
	background-color: #730e74;
	border-bottom : 0px solid rgba(0,0,0);
}

.card-body{
	height: 300px;
	font-family: 'DOSGothic';
}

.card-footer {
	height: 50px;
	background-color: #ececec;
}

.user-block {
	font-family : 'DOSGothic';
}

.user-block .username{
	font-size: 20px;
}

a {
	color: #730e74;
}

#list_btn, #modify_btn, .replyWriteBtn {
	font-family: 'Sam3KRFont';
	font-size: 15px;
	color: white;
	/* 변경값 */
	margin: 0px 0 0px 30px; /* 위아래 마진은 고정, 왼쪽 마진만 변경하여 사용*/
	width: 80px;
	background-color : #730e74;
	border-color: #faae22;	
}

#delete_btn {
	font-family: 'Sam3KRFont';
	font-size: 15px;
	color: #730e74;
	/* 변경값 */
	margin: 0px 0 0px 0px; /* 위아래 마진은 고정, 왼쪽 마진만 변경하여 사용*/
	width: 80px;
	background-color : #faae22;
	border-color: #730e74;
}

#reply_title {
	font-family: 'Sam3KRFont';
	font-size: 30px;
	color: #730e74;
	margin: 20px 0 0 150px;
}

form {
	margin: 20px 0 0 150px;
	font-family: 'DOSGothic';
}

input, textarea{
	border-color:  #730e74;
	font-family: 'DOSGothic';
	height: auto;
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
	<div class="col-lg-12" style="padding: 0 130px 0 130px;">
		<h3 class="mini-title">공지사항</h3>
   		<div class="cardd">
   			<div class="card-header">
   				<h3 class="card-title"><c:out value="${pageInfo.title}"/></h3>
  			</div>
   			<div class="card-body">
   				<c:out value="${pageInfo.content}"/>
   			</div>
   			<div class="card-footer">
   				<div class="user-block">
   					<%--
   					 <img class="img-circle img-bordered-sm" src="${path}/dist/img/user1-128x128.jpg" alt="user image">
   					 --%>
   					<span class="username"> <a href="#"><c:out value="${pageInfo.writer}"/></a></span>
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
   	
	<form id="infoForm" action="${ path }/notice/modify" method="get">
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
	form.attr("action", "${ path }/notice/noticeList");
	form.submit();
});

/* 수정 버튼 */
$("#modify_btn").on("click", function(e){
	form.attr("action", "${ path }/notice/modify");
	form.submit();
});

/* 삭제 버튼 */
$("#delete_btn").on("click", function(e){
    form.attr("action", "${ path }/notice/delete");
    form.attr("method", "post");
    form.submit();
});

</script>	
</html>