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
<link rel="stylesheet" type="text/css" href="${path}/resources/css/collabo.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    

    

    <div class="brand_list">
  
	<p>BRAND</p>
		
	<div class="brand_logo">
    		<div class=area1>
    		<c:forEach var="blist" items="${ blist }" begin="0" end="2">
    			<table>
    			<tr>
    			<td>
    				<a href="${ path }/collabo/promotion/detail?pmtNo=${ blist.brPmtNo }">
    				<img src="${ path }${ blist.brImgPath }${ blist.brMemberNo }.jpg" alt="" width="250px" height="150px">
    				</a>
    			</td>
    			</tr>
    			</table>
    		</c:forEach>
    		</div>
    		
    		<div class=area2>
    		<c:forEach var="blist" items="${ blist }" begin="3" end="5">
    			<table>
    			<tr>
    			<td>
    				<a href="${ path }/collabo/promotion/detail?pmtNo=${ blist.brPmtNo }">
    				<img src="${ path }${ blist.brImgPath }${ blist.brMemberNo }.jpg" alt="" width="250px" height="150px">
    				</a>
    			</td>
    			</tr>
    			</table>
    		</c:forEach>
    		</div> 
    		
    		<div class=area3>
    		<c:forEach var="blist" items="${ blist }" begin="6" end="8">
    			<table>
    			<tr>
    			<td>
    				<a href="${ path }/collabo/promotion/detail?pmtNo=${ blist.brPmtNo }">
    				<img src="${ path }${ blist.brImgPath }${ blist.brMemberNo }.jpg" alt="" width="250px" height="150px">
    				</a>
    			</td>
    			</tr>
    			</table>
    		</c:forEach>
    		</div>
    		
    		<div class=area4>
    		<c:forEach var="blist" items="${ blist }" begin="9" end="11">
    			<table>
    			<tr>
    			<td>
    				<a href="${ path }/collabo/promotion/detail?pmtNo=${ blist.brPmtNo }">
    				<img src="${ path }${ blist.brImgPath }${ blist.brMemberNo }.jpg" alt="" width="250px" height="150px">
    				</a>
    			</td>
    			</tr>
    			</table>
    		</c:forEach>
    		</div>
    		
    		<div class=area5>
    		<c:forEach var="blist" items="${ blist }" begin="12" end="14">
    			<table>
    			<tr>
    			<td>
    				<a href="${ path }/collabo/promotion/detail?pmtNo=${ blist.brPmtNo }">
    				<img src="${ path }${ blist.brImgPath }${ blist.brMemberNo }.jpg" alt="" width="250px" height="150px">
    				</a>
    			</td>
    			</tr>
    			</table>
    		</c:forEach>
    		</div>    	
    					    		    		   		
    </div>
		
			<div class="brand_array">
			<p>ABC</p>			 
								
			</div>
			
			<div class="brand_englist">
			<ul>
			
			<li>A</li>			
			<li>B</li>			
			<li>C</li>
			<li>D</li>
			<li>E</li>
			<li>F</li>
			<li>G</li>
			<li>H</li>
			<li>I</li>
			<li>J</li>
			<li>K</li>
			<li>L</li>
			<li>M</li>
			<li>N</li>
			<li>O</li>
			<li>Q</li>
			<li>R</li>
			<li>S</li>
			<li>T</li>
			<li>U</li>
			<li>V</li>
			<li>W</li>
			<li>X</li>
			<li>Y</li>
			<li>Z</li>			
			</ul>
			</div>
						
	</div>
	
	
	<div>
	<c:forEach var="blistc" items="${ blistc}">
	<c:out value="${blistc.brName }"></c:out>
	<button type="button" id="btnC" onclick="${blistc.brName }">C</button>
	</c:forEach>	
		
	</div>
	
	<div>
	<c:forEach var="blistk" items="${ blistk }">
	<p>${ blistk.brName }</p>
	</c:forEach>
	</div>	
	

    	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
    <script>
	$(document).ready(() => {
		$("#btnC").on("click", () => {

		});
	});
    </script>	

    	
</body>
</html>