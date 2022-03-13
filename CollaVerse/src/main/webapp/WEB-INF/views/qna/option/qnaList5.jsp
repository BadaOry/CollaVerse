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
<title>Collaverse</title>
<!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="${ path }/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${ path }/dist/css/adminlte.min.css">
  <link rel="stylesheet" href="${ path }/css/bootstrap.min.css">
<script src="${ path }/js/jquery-3.6.0.js"></script>
<style>
h2 {
	text-align: center;
	font-size: 100px;
}
div {
	width: 1200px;
	margin: auto;
}
#writeButton {
	text-align: right;
}
.form-group {
	margin-top: 15px;
	margin-bottom: -5px;
	margin-right: 25px;
	text-align: right;
}
.pageInfo{
	list-style : none;
	display: inline-block;
	margin: 50px 0 0 100px;
 }
.pageInfo li{
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
}
.search_area {
	text-align: center;
}
</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
</head>
<body>
<%
	response.setHeader("pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>

	<div class="col-lg-12">
		<div class="card">
			<div class="card-header with-border">
				<h3 class="card-title">게시글 목록</h3>
			</div>
			<span class="form-group">
		    	<select id="counts" name="pageUnit" onchange="Change(1)">   
		        	<option value="5" <c:if test="${ pageMaker.cri.amount == 5 }">selected="selected"</c:if>>5개씩 보기</option>
			        <option value="10" <c:if test="${ pageMaker.cri.amount == 10 }">selected="selected"</c:if>>10개씩 보기</option>
			        <option value="20" <c:if test="${ pageMaker.cri.amount == 20 }">selected="selected"</c:if>>20개씩 보기</option>
			        <option value="30" <c:if test="${ pageMaker.cri.amount == 30 }">selected="selected"</c:if>>30개씩 보기</option>
			        <option value="40" <c:if test="${ pageMaker.cri.amount == 40 }">selected="selected"</c:if>>40개씩 보기</option>
	    		</select>
			</span>

			<div class="card-body">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th style="width: 30px">#</th>
							<th>제목</th>
							<th style="width: 150px">작성자</th>
							<th style="width: 300px">작성시간</th>
							<th style="width: 60px">조회수</th>
						</tr>
					<c:if test="${ empty qlist }">			
						<tr>
							<td colspan="5">
								등록된 게시글이 없습니다.
							</td>
						</tr>	
					</c:if>
					<c:if test="${ !empty qlist }">
						<c:forEach items="${ qlist }" var="list">
							<tr>
								<td><c:out value="${list.bno}"/></td>
								<td>
				                	<a class="move" href='<c:out value="${list.bno}"/>'>
				                        <c:out value="${list.title}"/>
				                	</a>
	               				 </td>
								<td><c:out value="${list.writer}"/></td>
								<td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.modifyDate}"/></td>
								<td><c:out value="${list.readCount}"/></td>
							</tr>
						</c:forEach>
					</c:if>
					</tbody>
				</table>
			</div>
			<div id="writeButton">
				<div class="card-footer">
					<div class="float-right">
						<button type="button" onclick="location.href='${ path }/qna/enroll'" class="btn-success" id="writeBtn">
							<i class="fa fa-pencil"></i> 글쓰기
						</button>
					</div>
				</div>
			</div>
		</div>
   	</div>
    
    <nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	    <!-- 이전페이지 버튼 -->
        <c:if test="${pageMaker.prev}">
            <li class="pageInfo_btn previous"><a class="page-link" href="${pageMaker.startPage-1}">Previous</a></li>
        </c:if>
	    <!-- 각 번호 페이지 버튼 -->
	    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	        <li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }"><a class="page-link" href="${num}">${num}</a></li>
	    </c:forEach>
	    <!-- 다음페이지 버튼 -->
	    <c:if test="${pageMaker.next}">
	        <li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
	    </c:if>
	  </ul>
	</nav>
    
    <div class="search_wrap">
        <div class="search_area">
        	<select name="type">
                <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>옵션을 선택해주세요</option>
                <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
                <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
                <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
                <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
                <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
                <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option>
            </select>
            <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
            <button>Search</button>
        </div>
    </div>   
	
	<form id="moveForm" method="get">
		<input type="text" name="pageNum" value="${pageMaker.cri.pageNum }" style='display:none;'>
        <input type="text" name="amount" value="${pageMaker.cri.amount }" style='display:none;'>
        <input type="text" name="keyword" value="${pageMaker.cri.keyword }" style='display:none;'>
        <input type="text" name="type" value="${pageMaker.cri.type }" style='display:none;'>
    </form>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script>
function Change(idx){
    var pagenum = idx;
    var nowPaging = $("#counts option:selected").val();
    
    if(nowPaging == 5){
        location.href="${path}/qnatest/optionList/qnatestList5";    
    }else if(nowPaging == 10){
        location.href="${path}/qnatest/optionList/qnatestList10";    
    }else if(nowPaging == 20){
        location.href="${path}/qnatest/optionList/qnatestList20";    
    }else if(nowPaging == 30){
        location.href="${path}/qnatest/optionList/qnatestList30";    
    }else if(nowPaging == 40){
        location.href="${path}/qnatest/optionList/qnatestList40";    
    }
}

$(document).ready(function(){
	
	let result = '<c:out value="${result}"/>';
	
	checkAlert(result);
	console.log(result);
	
	function checkAlert(result){
		
		if(result === ''){
			return;
		}
		
		if(result === "enroll success"){
			alert("등록이 완료되었습니다.");
		}
		
		if(result === "modify success"){
			alert("수정이 완료되었습니다.");
		}
		
		if(result === "delete success"){
			alert("삭제가 완료되었습니다.");
		}
	}	
});

let moveForm = $("#moveForm");

$(".move").on("click", function(e){
	e.preventDefault();

	moveForm.append("<input type= 'hidden' name='bno' value= '"+$(this).attr("href")+"'>");
	moveForm.attr("action", "${ path }/qna/read");
	moveForm.submit();
});

$(".page-link").on("click", function(e){
	 
	e.preventDefault();
    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
    moveForm.attr("action", "${ path }/qna/qnaList");
    moveForm.submit();
	
});

$(".search_area button").on("click", function(e){
    e.preventDefault();
    
    let type = $(".search_area select").val();
    let keyword = $(".search_area input[name='keyword']").val();
    
    if(!type){
        alert("검색 종류를 선택하세요.");
        return false;
    }
    
    if(!keyword){
        alert("키워드를 입력하세요.");
        return false;
    }        
    
    moveForm.find("input[name='type']").val(type);
    moveForm.find("input[name='keyword']").val(keyword);
    moveForm.find("input[name='pageNum']").val(1);
    moveForm.submit();
});
</script>
</html>