<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<%-- <jsp:include page="/views/collabo/common/header.jsp" /> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COLLABO</title>
<script src="${ path }/js/jquery-3.6.0.js"></script>
</head>
<body>

<div class="container">    
    <div class="contents">

        <div class="list_living">
           <ul>
		      	<c:forEach var="" items="" begin="" end="">
			        <li>
			          <a href="${ pageContext.request.contextPath }//">
			            <div class="img_living">
			              <img src="${ pageContext.request.contextPath }" alt="">
			            </div>
			            <strong></strong>
			            <p></p>
			          </a>
			        </li>
		        </c:forEach>
      		</ul>
        </div>

        <div class="list_culture">
            <ul>
		      	<c:forEach var="" items="" begin="" end="">
			        <li>
			          <a href="${ pageContext.request.contextPath }//">
			            <div class="img_culture">
			              <img src="${ pageContext.request.contextPath }" alt="">
			            </div>
			            <strong></strong>
			            <p></p>
			          </a>
			        </li>
		        </c:forEach>
      		</ul>
        </div>

        <div class="list_food">
             <ul>
		      	<c:forEach var="" items="" begin="" end="">
			        <li>
			          <a href="${ pageContext.request.contextPath }//">
			            <div class="img_food">
			              <img src="${ pageContext.request.contextPath }" alt="">
			            </div>
			            <strong></strong>
			            <p></p>
			          </a>
			        </li>
		        </c:forEach>
      		</ul>
        </div>    
        
        <div class="list_fashion">
           <ul>
		      	<c:forEach var="" items="" begin="" end="">
			        <li>
			          <a href="${ pageContext.request.contextPath }//">
			            <div class="img_fashion">
			              <img src="${ pageContext.request.contextPath }" alt="">
			            </div>
			            <strong></strong>
			            <p></p>
			          </a>
			        </li>
		        </c:forEach>
      		</ul>
        </div>    
        
        <div class="list_tech">
            <ul>
		      	<c:forEach var="" items="" begin="" end="">
			        <li>
			          <a href="${ pageContext.request.contextPath }//">
			            <div class="img_tech">
			              <img src="${ pageContext.request.contextPath }" alt="">
			            </div>
			            <strong></strong>
			            <p></p>
			          </a>
			        </li>
		        </c:forEach>
      		</ul>
        </div>

    </div>
</div>

</body>
</html>