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

	<h1>개인 회원 가입</h1>
	<div id="enroll-container">	
	<div>
	 	<form name="memberEnrollFrm" action="${ path }/member/enroll" method="post">
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
					<th>이름 *</th>
					<td>
						<input type="text" id="userName" size="25" required>				
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
						<input type="text" name="age" id="age" size="25" placeholder="14~100까지 입력 가능" maxlength="100" required>
					</td>
				</tr>
	 			<tr>
	 				<th>성별 *</th>
	 				<td>
						<input type="radio" name="gender" value="woman" checked>여자
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
					  <input type="checkbox" name="agree" value="2" id="agree2">(필수) 14세 이상입니다.<br>
				</label>
				<label for="agree">
					  <input type="checkbox" name="agree" value="3" id="agree3">(선택) 이메일 및 SMS 마케팅 정보 수신에 동의합니다.<br>
				</label>
		 	</div>
			<br>
			<div class="btnAll" align="center">
 				<button type="submit" id="enrollSubmit" onclick="enroll()" value="가입">가입</button>
 				<input type="reset" id="reset" value="취소" onclick="location.href='${ path }'">
			</div>
		</form>
		</div>
	</div>
</div>

<script>
// 아이디 중복검사
$(document).ready(() => {
	$("#checkDuplicate").on("click", () => {

	      let newId = $("#newId").val().trim();
			
	      // 아이디 조건 검사
	      if(!newId.match(/^[a-z][a-z\d]{3,11}$/)) {
	        
	        alert("영문, 숫자를 포함한 4~12자리 아이디를 입력해주세요.");
	      } else if (newId.match(/^[a-z][a-z\d]{3,11}$/)) {
			
	    	  $.ajax({
					type: "post",
					url: "${ path }/member/idCheck",
					dataType: "json",
					data: {
						newId
					},
					success: (data) => {
						console.log(data);
						
						if(data.duplicate === true) {
							alert("이미 사용중인 아이디 입니다. 다른 아이디를 입력해주세요.");
							$("#newId").val('');
							$("#newId").focus();
						}else {
						
							alert("사용 가능한 아이디 입니다.");
						}
					},
					error: (error) => {
						console.log(error);
					}
	  			});  
	    	  
			//
	      }	
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
// 체크박스 필수 미선택 시 가입 불가 & 비밀번호 조건 체크
function enroll(){
	// 1. 체크박스 확인여부 
	if((document.getElementById("agree1").checked == false)
				|| (document.getElementById("agree2").checked == false)) {
	  alert("필수 약관 선택이 되지 않았습니다");
	  return false;
	  	  
	  } else {
		  location.href='${ path }/member/enroll';
	  }
	
	// 2. 비밀번호 조건확인
		var p1 = document.getElementById('pass1');
		if (!p1.value.match(/^[\w\d]{4,12}$/)) {
			alert('비밀번호는 영문, 숫자를 포함한 4~12자리 비밀번호를 입력해주세요.');
	    	return false;
	 	}
	}
</script>

<script>
	// 나이 범위 입력
	$(document).on("keyup", "input[name^=age]", function() {
    	var val= $(this).val();

    	if(val.replace(/[0-9]/g, "").length > 0) {
        	alert("숫자만 입력해 주십시오.");
        	$(this).val('');
   		}

    	if(val < 14 || val > 100) {
        	alert("14~100 범위로 입력해 주십시오.");
        	$(this).val('');
    	}
});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>	
</body>
</html>