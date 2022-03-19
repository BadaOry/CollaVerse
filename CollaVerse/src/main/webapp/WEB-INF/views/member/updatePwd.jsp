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
	<link rel="stylesheet" type="text/css" href="${ path }/resources/css/updatePwd.css">
</head>
<body>

<h2>비밀번호 변경</h2>
<div class="updatePwd" align="center">
	<form action="${ path }/member/updatePwd" method="post">
	<table>
		<tr>
			<th align="right">현재 비밀번호 : </th>
			<td><input type="password" name="originalPw" id="originalPw" value="${ loginMember.password }" required/></td>
		</tr>
		<tr>
			<th align="right">새 비밀번호 : </th>
			<td><input type="password" name="newPw" id="newPw" required/></td>
		</tr>
		<tr>
			<th align="right">새 비밀번호 확인 : </th>
			<td><input type="password" name="newPwCheck" id="newPwCheck" required/></td>
		</tr>
	</table>
	<br>
		<div class="btnAll" align="center">
		     <input type="submit" id="btn1" value="수정" onclick="validate()">
		     <button id="btn2" onclick="window.close();">취소</button>
		</div>
	</form>
</div>

<!-- 
<script>
// 비밀번호 변경
$(document).ready(() =>{
		
		$('#change').on('click', function(e){
			var p1 = document.getElementById('newPw');
			var p2 = document.getElementById('newPwCheck');
			
			if (!p1.value.match(/^[\w\d]{4,12}$/)) {
				alert('영문, 숫자 4~12자리 비밀번호를 입력해주세요.');
				p1.value = '';
				p1.focus();
				
				e.preventDefault();
				
				return false;
	        }
			
			// ▼ 비밀번호 일치 확인
			if(p1.value != p2.value) {
				alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
				p2.value = '';
				p2.focus();
				
				e.preventDefault();
				
				return;
				
			} else {
				alert("비밀번호가 일치합니다.");
				
				return true;
			}
		});
		
	});
</script>
 -->

<script>
// 비밀번호 변경
		function validate() {
			let newPw = $("#newPw").val();
			let newPwCheck = $("#newPwCheck").val();
			
			if(newPw.trim() != newPwCheck.trim()){
				alert("비밀번호가 일치하지 않습니다.");
				$("#newPw").val("");
				$("#newPwCheck").val("");
				$("#newPw").focus();
				
				return false;
			}
		}
</script>

</body>
</html>