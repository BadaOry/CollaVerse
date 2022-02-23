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
<title>개인 회원가입</title>
<script src="${ path }/js/jquery-3.6.0.js"></script>
</head>
<body>
	<h2>개인 회원 가입</h2>
	<div id="enroll-container">	 	
	 	<form name="memberEnrollFrm" action="${ path }/member/enroll" method="post">
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

				<!-- 생년월일의 년, 월, 일 코드
	 			<tr>
	 				<th>생년월일 *</th>
	 				<td>
                    <span class="box">
                        <input type="text" id="age" class="int" maxlength="4" placeholder="년(4자)" size="4" required>
                    </span>

                    <span class="box">
                        <select id="age" style="width:65px; height:22px;" required>
                            <option>월</option>
                            <option value="01">1</option>
                            <option value="02">2</option>
                            <option value="03">3</option>
                            <option value="04">4</option>
                            <option value="05">5</option>
                            <option value="06">6</option>
                            <option value="07">7</option>
                            <option value="08">8</option>
                            <option value="09">9</option>                                    
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                    </span>
                    <span class="box">
                        <input type="text" id="age" class="int" maxlength="2" placeholder="일" size="4" required>
                    </span>
	 				</td>
	 			</tr>
                     -->
	 			
	 			<tr>
	 				<th>생년월일 *</th>
	 				<td>
						<select name="yy" id="year"></select>년
						<select name="mm" id="month"></select>월
						<select name="dd" id="day"></select>일
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
	 		<label for="agree_all">
				<input type="checkbox" name="agree_all" id="agree_all"><b>모두 동의합니다</b><br>
			</label>
			<label for="agree">
				  <input type="checkbox" name="agree" value="1">(필수) 이용약관과 개인정보 수집 및 이용에 동의합니다.<br>
			</label>
			<label for="agree">
				  <input type="checkbox" name="agree" value="2">(필수) 만 14세 이상입니다.<br>
			</label>
			<label for="agree">
				  <input type="checkbox" name="agree" value="3">(선택) 이메일 및 SMS 마케팅 정보 수신에 동의합니다.<br>
			</label>
			<br>
 		<input type="submit" id="enrollSubmit" value="가입">	
 		<input type="reset" value="취소" onclick="location.href='${ path }'">
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
	// 생년월일
	$(document).ready(function(){            
	    var now = new Date();
	    var year = now.getFullYear();
	    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
	    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
	    
	    //년도 selectbox만들기               
	    for(var i = 1900 ; i <= year ; i++) {
	        $('#year').append('<option value="' + i + '">' + i + '</option>');    
	    }
	
	    // 월별 selectbox 만들기            
	    for(var i=1; i <= 12; i++) {
	        var mm = i > 9 ? i : "0"+i ;            
	        $('#month').append('<option value="' + mm + '">' + mm + '</option>');    
	    }
	    
	    // 일별 selectbox 만들기
	    for(var i=1; i <= 31; i++) {
	        var dd = i > 9 ? i : "0"+i ;            
	        $('#day').append('<option value="' + dd + '">' + dd+ '</option>');    
	    }
	    $("#year  > option[value="+year+"]").attr("selected", "true");        
	    $("#month  > option[value="+mon+"]").attr("selected", "true");    
	    $("#day  > option[value="+day+"]").attr("selected", "true");       
	})
</script>
	
</body>
</html>