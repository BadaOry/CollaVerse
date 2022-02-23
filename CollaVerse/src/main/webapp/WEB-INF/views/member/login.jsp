<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>
<head>
	<title>Login</title>
</head>
<body>
<h1>
	로그인
</h1>
<c:if test="${ empty loginMember }">
	<form action="login" method="post">
		<label>아이디 : <input type="text" name="id" required/></label><br>
		<label>비밀번호 : <input type="password" name="password" required/></label>
	
		<br>
		<br>
		
		<input type="button" onclick="location.href='${ path }/member/enroll'" value="아이디 찾기">
		<input type="button" onclick="location.href='${ path }/member/enroll'" value="비밀번호 찾기">
		
		<br>
		<br>
		
		<input type="submit" value="로그인">
		<input type="button" onclick="location.href='${ path }/member/enroll'" value="개인 회원가입">
		<input type="button" onclick="location.href='${ path }/member/enroll_business'" value="사업자 회원가입">
		
	</form>
</c:if>
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

</body>
</html>
