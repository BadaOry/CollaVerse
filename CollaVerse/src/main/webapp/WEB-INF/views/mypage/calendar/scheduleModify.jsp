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

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- custom -->
<link href="${ path }/resources/custom/css/schedule.css" rel="stylesheet" />	
<script src="${ path }/resources/custom/js/schedule.js" type="text/javascript"></script>

<!-- fullcalendar -->
	<link href='${ path }/resources/fullcalendar/packages/core/main.css' rel='stylesheet' />
	<link href='${ path }/resources/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
	<link href='${ path }/resources/fullcalendar/packages/timegrid/main.css' rel='stylesheet' />
	<link href='${ path }/resources/fullcalendar/packages/list/main.css' rel='stylesheet' />
	<script src='${ path }/resources/fullcalendar/packages/core/main.js'></script>
	<script src='${ path }/resources/fullcalendar/packages/interaction/main.js'></script>
	<script src='${ path }/resources/fullcalendar/packages/daygrid/main.js'></script>
	<script src='${ path }/resources/fullcalendar/packages/timegrid/main.js'></script>
	<script src='${ path }/resources/fullcalendar/packages/list/main.js'></script>

</head>
<body>
	<form id = "scheduleData" action="${ path }/mypage/schedule/scheduleModify" method="post">
<div class = "group" id = "popupGroup">	
	<div class = "group-head">
		<h1 class = "zTree-h1"> 일정 수정 </h1>
	</div>
	<div class = "group-body">
		<div class = "top">
			<input class = "subject" id = "subject" type = "text" readonly="readonly" name = "subject" value='<c:out value="${vo.subject}"/>' >
		</div>
		<div class = "domain">
			<h3 class = "zTree-h3"> 시작 </h3>
		</div>
		<div class = "domain">
			<input class = "date"  type = "text" name = "startDate" value='<c:out value="${vo.startDate}"/>' >
		</div>
		<div class = "domain">
			<h3 class = "zTree-h3"> 종료 </h3>
		</div>
		<div class = "domain">
			<input class = "date"  type = "text" name = "endDate" value='<c:out value="${vo.endDate}"/>' >
		</div>
		<div class = "domain">
			<h3 class = "zTree-h3"> 메모 </h3>
		</div>
		<div class = "domain">
			<textarea class = "memo" id = "memo" name = "memo" rows = "5" cols = "20"><c:out value="${vo.memo}"/> </textarea> 
		</div>
		<div class = "domain">
			<label class = "zTree-h3"> 카테고리 </label>
			<select class="inputModal" name="color" id="edit-color"  onchange="alert(this.color)">
			   <option value="#000000" style="color:#000000;">------</option>
		       <option value="#D25565" style="color:#D25565;">리빙</option>
		       <option value="#ffa94d" style="color:#ffa94d;">문화</option>
		       <option value="#9775fa" style="color:#9775fa;">식품</option>
		       <option value="#74c0fc" style="color:#74c0fc;">테크</option>
		       <option value="#4d638c" style="color:#4d638c;">패션</option>
		   </select>
		</div>
		<button class = "ok-button" type= "button" onclick="click_confirm();">확인</button>
	</div>	
	
</div>
	</form>
</body>
<script>

function click_modify(){


};

function click_confirm(){

	window.close();
};

function click_delete(){

	var scheduleData = JSON.stringify($('form#scheduleData').serializeObject());
	
	$.ajax({
		data : "",
		url : "/calendar/scheduleModify",
		type : "DELETE",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			opener.parent.location.reload();
			window.close();
		}
	});
};
</script>

</html>