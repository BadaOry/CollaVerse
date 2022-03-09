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
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/myPage.css">
<script src="${ path }/js/jquery-3.6.0.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="myPage">
<h1 class="mini_title">개인 회원정보 수정</h1>
<div id="view-container">
	<div align="center">
	<form id="memberFrm" action="${ path }/member/update" method="post">	
		<table>
			  <tr>
                <th>아이디</th>
            <td>
               <input type="text" name="id" id="newId" 
                  value="${ loginMember.id }" readonly required >
            </td>    
            </tr>
         <tr>
                <th>비밀번호</th>
            <td>
               <input type="password" name="password" id="pass1" 
                  value="${ loginMember.password }" required >
            </td>    
            </tr>
            <tr>
                <th>휴대폰번호</th>
                <td>
                    <input type="tel" name="phone" id="phone" value="${ loginMember.phone }" maxlength="13">
                </td>
            </tr>
            <tr>
            <th>닉네임</th>
            <td>
               <input type="text" name="nickname" id="nickname" value="${ loginMember.nickname }" required>            
            </td>          
          </tr>    
            <tr>
                <th>이메일</th>
            <td>
               <input type="email" name="email" id="email" maxlength="25" value="${ loginMember.email }">                                    
            </td>    
            </tr>
            <tr>
                <th>프로필사진</th>
				<td>
					<input type="file" name="profile_img" id="profile_img"><span style="color: red">&nbsp; png, jpg만 첨부 가능</span>
				</td> 	
            </tr>
        </table>
            <br>
        <div class="btnAll" align="center">
        	<input type="submit" id="btn1" value="정보 수정">
        	<input type="button" id="btnDelete" value="탈퇴">
        	<input type="reset" id="btn2" value="취소" onclick="location.href='${ path }'">
        </div>
 	</form>
    </div>
 	</div>
</div>

<script>
      $("#btnDelete").on("click", () => {
         if(confirm("정말로 탈퇴하시겠습니까?")) {
            location.replace("${ pageContext.request.contextPath }/member/delete");
         }
      });

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>	
</body>
</html>