<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CollaVerse</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/enroll.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<h2>프로모션 작성</h2>
		<form action="${ pageContext.request.contextPath }/collabo/promotion/writing_promotion" method="post"
				enctype="multipart/form-data">
			<table>
				<tr>
					<th>프로모션 이름</th>
					<td><input type="text" name="promName" id="title"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writerId" value="${ loginMember.id }" readonly></td>
				</tr>
				<tr>
					<th>대표 프로모션 이미지</th>
					<td><input type="file" name="promImg"></td>
				</tr>
				<tr>
					<th>제품1 이미지</th>
					<td><input type="file" name="prodImg"></td>
				</tr>
				<tr>
					<th>제품1 이름</th>
					<td><textarea name="prodName1" cols="30" rows="1" ></textarea></td>
				</tr>
				<tr>
					<th>제품1 가격</th>
					<td><textarea name="prodPrice1" cols="30" rows="1" ></textarea></td>
				</tr>
				<tr>
					<th>제품1 설명 / 획득 조건</th>
					<td><textarea name="prodContent1" cols="50" rows="15" ></textarea></td>
				</tr>
				<tr>
					<th>제품2 이미지</th>
					<td><input type="file" name="prodImg"></td>
				</tr>
				<tr>
					<th>제품2 이름</th>
					<td><textarea name="prodName2" cols="30" rows="1" ></textarea></td>
				</tr>
				<tr>
					<th>제품2 가격</th>
					<td><textarea name="prodPrice2" cols="30" rows="1" ></textarea></td>
				</tr>
				<tr>
					<th>제품2 설명 / 획득 조건</th>
					<td><textarea name="prodContent2" cols="50" rows="15" ></textarea></td>
				</tr>
				<tr>
					<th>제품3 이미지</th>
					<td><input type="file" name="prodImg"></td>
				</tr>
				<tr>
					<th>제품3 이름</th>
					<td><textarea name="prodName3" cols="30" rows="1" ></textarea></td>
				</tr>
				<tr>
					<th>제품3 가격</th>
					<td><textarea name="prodPrice3" cols="30" rows="1" ></textarea></td>
				</tr>
				<tr>
					<th>제품3 설명 / 획득 조건</th>
					<td><textarea name="prodContent3" cols="50" rows="15" ></textarea></td>
				</tr>
				<tr>
					<th>프로모션 설명</th>
					<td><textarea name="promContent" cols="100" rows="15" ></textarea></td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="등록">
						<input type="reset" value="취소">
					</th>
				</tr>
			</table>
		</form>

	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>