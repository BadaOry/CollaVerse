<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PROMOTION</title>
</head>
<body>
        <div class="promotion_list">
            <ul>
		      	<c:forEach var="" items="" begin="" end="">
			        <li>
			          <a href="${ pageContext.request.contextPath }//">
			            <div class="promotion_img">
			              <img src="${ pageContext.request.contextPath }" alt="">
			            </div>
			            <strong>프로모션 제목</strong>
			            <p>기간</p>
			          </a>
			        </li>
		        </c:forEach>
      		</ul>
        </div>
</body>
</html>