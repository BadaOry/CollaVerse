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
<title>20개씩 보이는 곳 아직 테스트</title>
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
	 
</style>
</head>
<body>
<h2>게시판</h2>
<div>
      	<div class="col-lg-12">
   			<div class="card">
   				<div class="card-header with-border">
   					<h3 class="card-title">게시글 목록</h3>
   				</div>
				<span class="form-group">
				    <select id="counts" name="pageUnit" onchange="Change(1)">   
				        <option value="5" <c:if test="${pageInfo.listLimit == 5}">selected="selected"</c:if>>5개씩 보기</option>
				        <option value="10" <c:if test="${pageInfo.listLimit == 10}">selected="selected"</c:if>>10개씩 보기</option>
				        <option value="20" <c:if test="${pageInfo.listLimit == 20}">selected="selected"</c:if>>20개씩 보기</option>
				        <option value="30" <c:if test="${pageInfo.listLimit == 30}">selected="selected"</c:if>>30개씩 보기</option>
				        <option value="40" <c:if test="${pageInfo.listLimit == 40}">selected="selected"</c:if>>40개씩 보기</option>
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
   							<th style="width: 60px">조회</th>
   						</tr>
   						<c:if test="${ empty boardList }">			
							<tr>
								<td colspan="5">
									등록된 게시글이 없습니다.
								</td>
							</tr>	
						</c:if>
						<c:if test="${ !empty boardList }">
	   						<c:forEach items="${ boardList }" var="board">
		   						<tr>
		   							<td>${ board.no }</td>
		   							<td><a href="${ path }/board/read?no=${board.no}">${ board.title }</a></td>
		   							<td>${ board.writer }</td>
		   							<td> <fmt:formatDate type="date" value="${ board.createDate }" pattern="yyyy-MM-dd a HH:mm"/></td>
		   							<td><span class="badge bg-red">${ board.readCount }</span></td>
		   						</tr>
	   						</c:forEach>
   						</c:if>
   						</tbody>
   					</table>
   				</div>
   				<div id="writeButton">
   				<div class="card-footer">
   					<div class="float-right">
   						<button type="button" onclick="location.href='${ path }/board/enroll'" class="btn btn-success btn-flat" id="writeBtn">
   							<i class="fa fa-pencil"></i> 글쓰기
   						</button>
   					</div>
   				</div>
   				</div>
   			</div>
      	</div>

	<nav aria-label="...">	
	  <ul class="pagination justify-content-center">
	  	<li class="page-item">
	      <a href="${ path }/board/optionList/boardList20?page=1" class="page-link">&lt;&lt;</a>
	    </li>
	    <li class="page-item">
	      <a href="${ path }/board/optionList/boardList20?page=${ pageInfo.prevPage }" class="page-link">&lt;</a>
	    </li>
	    
	    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">	
					<li class="page-item active" aria-current="page" ><a disabled class="page-link">${ status.current }</a></li>			
				</c:if>
				
				<c:if test="${ status.current != pageInfo.currentPage }">
					<li class="page-item" ><a class="page-link" href="${ path }/board/optionList/boardList20?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a></li>				
				</c:if>
		</c:forEach>
	    
	    <li class="page-item">
	      <a href="${ path }/board/optionList/boardList20?page=${ pageInfo.nextPage }" class="page-link" >&gt;</a>
	    </li>
	    <li class="page-item">
	      <a href="${ path }/board/optionList/boardList20?page=${ pageInfo.maxPage }" class="page-link" >&gt;&gt;</a>
	    </li>
	  </ul>
	</nav>
	

	
	<p>
		<a href="${ path }">홈</a>
	</p>
	


</body>
<script>
function Change(idx){
    var pagenum = idx;
    var nowPaging = $("#counts option:selected").val();
    
    if(nowPaging == 5){
        location.href="${path}/board/optionList/boardList5";
    }else if(nowPaging == 10){
        location.href="${path}/board/optionList/boardList10";    
    }else if(nowPaging == 20){
        location.href="${path}/board/optionList/boardList20";    
    }else if(nowPaging == 30){
        location.href="${path}/board/optionList/boardList30";    
    }else if(nowPaging == 40){
        location.href="${path}/board/optionList/boardList40";    
    }
}

</script>


</html>