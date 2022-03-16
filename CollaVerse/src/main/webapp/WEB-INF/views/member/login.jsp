<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>
<head>
	<title>CollaVerse</title>
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/login.css">
	
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<c:if test="${ empty loginMember }">
			<form action="login" method="post">
			  <table class="login">
			    <tr>
			      <td colspan="2"><p class="mini-title">로그인</p></td>
			    </tr>
			    <tr>
			      <td class="id"><p class="title-text">아이디</p>
			        <input type="text" name="id" required/><br><br>
			      </td>
			      <td rowspan="2" class="btnAll" align="center">
			        <input type="submit" id="btn1" value="로그인"><br><br>
			        <button id="findid" onclick="window.open('${ path }/member/findId','id_popup','width=350, height=190, location=no, status=no, left=-700, top=-200');">아이디 찾기</button>
			        <button id="findpw" onclick="window.open('${ path }/member/findPw','pw_popup','width=350, height=190, location=no, status=no, left=-700, top=-200');">비밀번호 찾기</button>    
			      </td>
			    </tr>
			    <tr>
			      <td class="pw"><p class="title-text">비밀번호</p>
			        <input type="password" name="password" required/>
			      </td>
			    </tr>
			  </table>
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



<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
