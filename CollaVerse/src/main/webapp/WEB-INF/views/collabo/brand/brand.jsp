<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    

    <div class="frame">

    <div class="brand_list">
  
	<p>브랜드<p>
		
	<div class="brand_logo">
    		<div class=area1>
    		<c:forEach var="blist" items="${ blist }" begin="0" end="2">
    			<table>
    			<tr>
    			<td>
    				<a href="${ path }/collabo/promotion/detail?pmtNo=${ blist.brPmtNo }">
    				<img src="${ path }${ blist.brImgPath }${ blist.brMemberNo }.jpg" alt="" width="190px" height="100px">
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
    				<img src="${ path }${ blist.brImgPath }${ blist.brMemberNo }.jpg" alt="" width="190px" height="100px">
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
    				<img src="${ path }${ blist.brImgPath }${ blist.brMemberNo }.jpg" alt="" width="190px" height="100px">
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
    				<img src="${ path }${ blist.brImgPath }${ blist.brMemberNo }.jpg" alt="" width="190px" height="100px">
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
    				<img src="${ path }${ blist.brImgPath }${ blist.brMemberNo }.jpg" alt="" width="190px" height="100px">
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
			
			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=A">
			A
			</a>
			</li>	
					
			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=B">
			B
			</a>
			</li>
					
			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=C">
			C
			</a>
			</li>
						
			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=D">
			D
			</a>
			</li>

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=E">
			E
			</a>
			</li>
			
			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=F">
			F
			</a>
			</li>

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=G">
			G
			</a>
			</li>

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=H">
			H
			</a>
			</li>

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=I">
			I
			</a>
			</li>

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=J">
			J
			</a>
			</li>

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=K">
			K
			</a>
			</li>

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=L">
			L
			</a>
			</li>
			
			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=M">
			M
			</a>
			</li>

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=N">
			N
			</a>
			</li>

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=O">
			O
			</a>
			</li>
			
			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=P">
			P
			</a>
			</li>			

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=Q">
			Q
			</a>
			</li>

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=R">
			R
			</a>
			</li>

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=S">
			S
			</a>
			</li>

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=T">
			T
			</a>
			</li>

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=U">
			U
			</a>
			</li>

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=V">
			V
			</a>
			</li>

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=W">
			W
			</a>
			</li>

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=X">
			X
			</a>
			</li>

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=Y">
			Y
			</a>
			</li>

			<li>
			<a href="${ path }/collabo/brand/brandDetail?startWith=Z">
			Z
			</a>
			</li>		
			</ul>
			</div>
						
	</div>	
	</div>
	

    	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
	

    	
</body>
</html>