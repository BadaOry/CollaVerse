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
<title>회원가입</title>
<script src="${ path }/js/jquery-3.6.0.js"></script>
</head>
<body>
	<h2>회원 가입</h2>
	<div id="enroll-container">	 	
	 	<form name="memberEnrollFrm" action="${ path }/member/enroll" method="post">
	 		<table>
	 			<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id" id="newId" placeholder="숫자영문(소문자)혼용 10글자" size="25" required>
						<input type="button" id="checkDuplicate" value="중복검사" >
					</td> 			
	 			</tr>
	 			<tr>
					<th>이메일</th>
					<td>
						<input type="email" placeholder="abc@abc.com" name="email" id="email" size="25">												
					</td> 			
	 			</tr>
	 			<tr>
					<th>이름 *</th>
					<td>
						<input type="text" name="name" id="userName" size="25" required>				
					</td> 			
	 			</tr>
	 			<tr>
					<th>비밀번호 *</th>
					<td>
						<input type="password" name="password" id="pass1" placeholder="숫자영문(소문자)혼용 10글자" size="25" required>
					</td> 			
	 			</tr>
	 			<tr>
					<th>비밀번호 확인 *</th>
					<td>
						<input type="password" id="pass2" placeholder="숫자영문(소문자)혼용 10글자" size="25">
					</td> 			
	 			</tr>	 			
	 			<tr>
					<th>휴대폰번호 *</th>
					<td>
						<input type="tel" placeholder="010-1234-5678" name="phone" id="phone" maxlength="13" size="25">								
					</td> 			
	 			</tr>
	 			<tr>
	 			<!-- 년도 jQeury로 수정할 것 -->
	 				<th>생년월일 *</th>
	 				<td>
	 					<select name="year" id="year" title="년도">년도</select>
	 				</td>
	 			</tr>
	 			<tr>
	 				<th>성별 *</th>
	 				<td>
						<input type="radio" name="gender" value="woman">여자
	 					<input type="radio" name="gender" value="man">남자
	 				</td>
	 				</tr>
	
	 		</table>
	 		<br>
	 		<input type="submit" id="enrollSubmit" value="가입">	
	 		<input type="reset" value="취소">	
	 	</form>
	 	<form name="checkIdForm">
	 		<input type="hidden" name="userId">
	 	</form>
 	</div>
 	<script>
	// 아이디 중복 확인
	$(document).ready(() => {
		$("#checkDuplicate").on("click", () => {
			let userId = $("#newId").val().trim();
			
			$.ajax({
				type: "post",
				url: "${ pageContext.request.contextPath }/member/idCheck",
				dataType: "json",
				data: {
					userId
				},
				success: (data) => {
					console.log(data);
					
					if(data.duplicate === true) {
						alert("이미 사용중인 아이디 입니다.");
					} else {
						alert("사용 가능한 아이디 입니다.");						
					}

				},
				error: (error) => {
					console.log(error);
				}
			});
		});		
	});
</script>

</body>
</html>