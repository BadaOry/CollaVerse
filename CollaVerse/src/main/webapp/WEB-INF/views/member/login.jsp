<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/login.css">
	
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="login">
	<h1>로그인</h1>
		<c:if test="${ empty loginMember }">
			<form action="login" method="post">
			<div class="id">
				<label>아이디</label><br>
				<input type="text" name="id" required/><br><br>
			</div>
			<div class="pw">
				<label>비밀번호</label><br>
				<input type="password" name="password" required/>
			</div>
	
		<br>
		<br>

		<div class="findAll">
			<button id="findid" onclick="window.open('${ path }/member/findId','id_popup','width=350, height=190, location=no, status=no, left=-700, top=-200');">아이디 찾기</button>
			<button id="findpw" onclick="window.open('${ path }/member/findPw','pw_popup','width=350, height=190, location=no, status=no, left=-700, top=-200');">비밀번호 찾기</button>
		</div>
		
		<br>
		<br>
		
		<div class="btnAll" align="center">
			<input type="submit" id="btn1" value="로그인"><br><br>
			<input type="button" id="btn2" onclick="location.href='${ path }/member/enroll'" value="개인 회원가입"><br><br>
			<input type="button" id="btn3" onclick="location.href='${ path }/member/enroll_business'" value="사업자 회원가입"><br><br>
		</div>
		
	</form>
</c:if>
	</div>	
<c:if test="${ !empty loginMember && loginMember.role == '관리자'}">
	<table>
	   <tr>

	     <td colspan="2">
	        ${ loginMember.nickname } 관리자님 환영합니다.
	     </td>
	   </tr>
	   <tr>
	      <td>
	     <button onclick="location.href='${ path }/member/myinfo'">내 정보</button>
	  </td>
	  <td>
	     <button onclick="location.replace('${ path }/logout')">로그아웃</button>
	  </td>
	   </tr>
	</table>
</c:if>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
