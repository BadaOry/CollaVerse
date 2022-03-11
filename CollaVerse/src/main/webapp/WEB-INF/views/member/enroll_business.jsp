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
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/enroll.css">
<script src="${ path }/js/jquery-3.6.0.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="enroll">

	<h1>사업자 회원 가입</h1>
	<div id="enroll-container">	
	<div>
	 	<form name="memberEnrollFrm" action="${ path }/member/enroll_business" method="post">
	 	<div align="center">
	 		<table>
	 			<tr>
					<th>아이디 *</th>
					<td>
						<input type="text" name="id" id="newId" placeholder="4-12자 이내 영문, 숫자 사용 가능" size="25" required>
						<input type="button" id="checkDuplicate" value="중복검사" >
					</td> 			
	 			</tr>
	 			<tr>
					<th>비밀번호 *</th>
					<td>
						<input type="password" name="password" id="pass1" placeholder="4-12자 이내 영문, 숫자 사용 가능" size="25" required>
					</td> 			
	 			</tr>

	 			<tr>
					<th>기업명 *</th>
					<td>
						<input type="text" name="business_name" id="business_name" size="25" required>				
					</td> 			
 				</tr>
 				<tr>
					<th>닉네임 *</th>
					<td>
						<input type="text" name="nickname" id="nickname" size="25" required>
						<input type="button" id="checkDuplicateNickname" value="중복검사" >				
					</td> 			
 				</tr> 
 				<tr>
					<th>사업자등록번호 *</th>
					<td>
						<input type="text" placeholder="숫자만 입력하세요" name="business_no" id="newbusiness_no" maxlength="10" size="25" required>								
						<input type="button" id="businessNoCheck" value="번호확인" >
					</td> 			
	 			</tr>			
	 			<tr>
					<th>이메일 *</th>
					<td>
						<input type="email" placeholder="abc@abc.com" name="email" id="email" size="25" required>												
					</td> 			
	 			</tr>
	 			<tr>
					<th>휴대폰번호 *</th>
					<td>
						<input type="tel" placeholder="010-1234-5678" name="phone" id="phone" maxlength="13" size="25" required>								
					</td> 			
	 			</tr>			
	 			<tr>
	 				<th>나이 *</th>
	 				<td>
						<select name="age" id="age" required>
							<option>나이</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
						</select>
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
	 	</div>
	 		<br>
	 	<div class="labelAll">
	 		<label for="agree_all">
				<input type="checkbox" name="agree_all" id="agree_all"><b>모두 동의합니다</b><br>
			</label>
			<label for="agree">
				  <input type="checkbox" name="agree" value="1" id="agree1">(필수) 이용약관과 개인정보 수집 및 이용에 동의합니다.<br>
			</label>
			<label for="agree">
				  <input type="checkbox" name="agree" value="2" id="agree2">(필수) 만 14세 이상입니다.<br>
			</label>
			<label for="agree">
				  <input type="checkbox" name="agree" value="3" id="agree3">(선택) 이메일 및 SMS 마케팅 정보 수신에 동의합니다.<br>
			</label>
		</div>
		<br>
		<div class="btnAll" align="center">
 			<input type="submit" id="enrollSubmit" value="가입" onclick="checkbox()">	
 			<input type="reset" id="reset" value="취소" onclick="location.href='${ path }'">
 		</div>
 	</form>
 	</div>
</div>
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

<script>
	// 닉네임 중복 확인
	$(document).ready(() => {
		$("#checkDuplicateNickname").on("click", () => {
			let nickname = $("#nickname").val().trim();
			
			$.ajax({
				type: "post",
				url: "${ pageContext.request.contextPath }/member/nicknameCheck",
				dataType: "json",
				data: {
					nickname
				},
				success: (data) => {
					console.log(data);
					
					if(data.duplicate === true) {
						alert("이미 사용중인 닉네임 입니다.");
					} else {
						alert("사용 가능한 닉네임 입니다.");						
					}
				},
				error: (error) => {
					console.log(error);
				}
			});
		});		
	});
</script>

<script>
	// 사업자번호 중복확인
	$(document).ready(() => {
		$("#businessNoCheck").on("click", () => {
			let business_no = $("#newbusiness_no").val();
			
			$.ajax({
				type: "post",
				url: "${ pageContext.request.contextPath }/member/businessNoCheck",
				dataType: "json",
				data: {
					business_no
				},
				success: (data) => {
					console.log(data);
					
					if(data.duplicate === true) {
						alert("중복된 사업자등록번호 입니다.");
					} else {
						alert("사용 가능합니다.");						
					}
				},
				error: (error) => {
					console.log(error);
				}
			});
		});		
	});
</script>

<script>
	// 약관 전체선택, 해제
	const agreeChkAll = document.querySelector('input[name=agree_all]');
	    agreeChkAll.addEventListener('change', (e) => {
	    	let agreeChk = document.querySelectorAll('input[name=agree]');
	    		for(let i = 0; i < agreeChk.length; i++){
	    			agreeChk[i].checked = e.target.checked;
	    }
});
</script>

<script>
// 체크박스 필수 미선택 시 가입 불가
function checkbox(){

	if(document.getElementById("agree1", "agree2").checked == false) {
	  alert("필수 약관 선택이 되지 않았습니다");
	  	  
	  } else {
		  location.href='${ path }/member/enroll_business';
	  }
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>