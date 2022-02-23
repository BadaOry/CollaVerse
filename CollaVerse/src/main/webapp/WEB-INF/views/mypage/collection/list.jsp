<%@ page language="java"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>

<head>
	<meta charset="UTF-8">
	<title>CollaVerse</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/style.css">
	    <style>
        .mypage_mycollection_title {
            width: 100%;
            height: 80px;
            border: 1px solid black;
            text-align: left;
            font-size:30px;
            padding: 20px 0 20px 30px ;
            margin: 0 0 50px 0;
            box-sizing: border-box;
        }

        .mypage_mycollection_list_container {
            width: 80%;
            margin: auto;

        }

        .mypage_mycollection_list tr td {
            border: 20px solid rgb(89, 22, 145);
            width: 300px;
            height: 300px;
            margin-right: 100px;
            background-color: aquamarine;
        }
        
        .mypage_mycollection_insertCollection_btn {
            width: 70%;
            height: 80px;
            border: 1px solid black;
            text-align: center;
            font-size:30px;
            padding: 20px 0 20px 30px ;
            box-sizing: border-box;
            background-color: rgb(89, 22, 145);
            color: white;
            margin: 50px 0 50px 170px;
        }
    </style>
</head>
<body class="box" style=" overflow-y: scroll;">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="mypage_mycollection_title">My 컬렉션</div>
	
	<!--  <c:if test="${ !empty loginMember }"> -->	
		<button type="button" id="btn-add"
			onclick="location.href='${ path }/mypage/collection/write'">글쓰기</button>	
	<!-- </c:if> -->

	<table id="tbl-board">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>첨부파일</th>
			<th>조회수</th>
		</tr>
		<c:if test="${ empty list }">			
			<tr>
				<td colspan="6">
					조회된 게시글이 없습니다.
				</td>
			</tr>	
		</c:if>
		<c:if test="${ !empty list }">
			<c:forEach var="board" items="${ list }">
				<tr>
					<td>${ board.no }</td>
					<td>
						<a href="${ path }/board/view?no=${ board.no }">
							${ board.title }
						</a>
					</td>
					<td>${ board.writerId }</td>
					<td><fmt:formatDate type="date" value="${ board.createDate }"/></td>
					<td>
						<c:if test="${ empty board.originalFileName }">
							<span> - </span>
						</c:if>
						<c:if test="${ !empty board.originalFileName }">
							<img src="${ path }/resources/images/file.png" width="20" height="20"/>
						</c:if>
					</td>
					<td>${ board.readCount }</td>
				</tr>
			</c:forEach>

		</c:if>			
	</table>
	<div id="pageBar">
		<!-- 맨 처음으로 -->
		<button onclick="location.href='${ path }/board/list?page=1'">&lt;&lt;</button>

		<!-- 이전 페이지로 -->
		<button onclick="location.href='${ path }/board/list?page=${ pageInfo.prevPage }'">&lt;</button>

		<!--  10개 페이지 목록 -->
		<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
			<c:if test="${ status.current == pageInfo.currentPage }">				
				<button disabled>${ status.current }</button>
			</c:if>
			
			<c:if test="${ status.current != pageInfo.currentPage }">				
				<button onclick="location.href='${ path }/board/list?page=${ status.current }&count=${ pageInfo.listLimit }'">${ status.current }</button>
			</c:if>
		</c:forEach>

		<!-- 다음 페이지로 -->
		<button onclick="location.href='${ path }/board/list?page=${ pageInfo.nextPage }'">&gt;</button>

		<!-- 맨 끝으로 -->
		<button onclick="location.href='${ path }/board/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
	</div>

    <!--  내가 쓴거  
        
    <div class="mypage_mycollection_list_container">
        <table class="mypage_mycollection_list">
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
            </tr>
            <c:if test="${ empty list }">
            	<tr>
            		<td colspan="3">
            			아직 컬렉션이 비어있어요.<br>
            			여러분의 특별한 컬렉션으로 채워주세요 !
            		</td>
            	</tr>
            </c:if>
            <c:if test="${ !empty list }">
            
            </c:if>
        </table>
    </div>
	
	<c:if test="${ !empty loginMember }">
		<form>
			<button class="mypage_mycollection_insertCollection_btn"
				onclick="location.href='${ path }/mypage/collection/write'">글쓰기</button>
		</form>
	</c:if>
	
	
	-->

	
	<!-- 인터넷에서 긁어온 인피니트 스크롤
	
	<form action="${ path }/mypage/mycollection/list" method="get">
		<section id="card-list" class="card-list">
			<div class="container">
				<div class="row card-list-container thumbnails"></div>
	
			</div>
			
			<div class="back-drop">
				<img src="${ path }/resources/images/loading_icon.png"/>
			</div>
		</section>
	</form>
	
	 -->

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<script src="${ path }/resources/js/mypage_p_collection_list_infinite.js"></script>
	<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
</body>
</html>