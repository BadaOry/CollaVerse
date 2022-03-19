<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CollaVerse</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/collabo.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    
    <div class="frame">
    
    <div id="promotion">
    <c:if test="${ loginMember.role == '관리자'}">
    		<button id="write_pro" onclick="location.href='${ path }/collabo/promotion/writing_promotion'">프로모션 작성하기</button></c:if>
        <h3 class="mini_title">최신 프로모션</h3>    		
    </div>
        
    <div class="p_new">
    

    		 <!-- 새로 추가되는 프로모션 등록 -->

    		<div class="p_list6">
             <c:forEach var="list" items="${ list }" begin="15">
            <table>
            <tr>
            <td>

            		<a href="${ path }/collabo/promotion/detail?pmtNo=${ list.no }">                               
                    <img src="${ path }${ list.imgPath }${ list.no }.jpg" alt="" width="250px" height="250px">
                    </a> 
            </td>
            </tr>         
                <tr>
                <td>
                <a href="${ path }/collabo/promotion/detail?pmtNo=${ list.no }">                  
                ${ list.title }
                </a>
                </td>
                </tr>
                <tr>
				<td><fmt:formatDate value="${ list.startDate }" pattern="yyyy-MM-dd ~"/></td>
				</tr>
				</table>
 			</c:forEach>
            </div>

    
            <div class="p_list1">
            <c:forEach var="list" items="${ list }" begin="0" end="2">
            <table>
            <tr>
            <td>
            		<a href="${ path }/collabo/promotion/detail?pmtNo=${ list.no }">               
                    <img src="${ path }${ list.imgPath }${ list.no }.jpg" alt="" width="250px" height="250px">
                    </a> 
            </td>
            </tr>         
                <tr>
                <td>
                <a href="${ path }/collabo/promotion/detail?pmtNo=${ list.no }">   
                ${ list.title }
                </a>
                </td>
                </tr>
                <tr>
				<td><fmt:formatDate value="${ list.startDate }" pattern="yyyy-MM-dd ~"/></td>
				</tr>
				</table>
 			</c:forEach>
            </div>
 
            <div class="p_list2">
            <c:forEach var="list" items="${ list }" begin="3" end="5">
            <table>
            <tr>
            <td>    
            		<a href="${ path }/collabo/promotion/detail?pmtNo=${ list.no }">                            
                    <img src="${ path }${ list.imgPath }${ list.no }.jpg" alt="" width="250px" height="250px">
                    </a> 
            </td>
            </tr>         
                <tr>
                <td>
                <a href="${ path }/collabo/promotion/detail?pmtNo=${ list.no }">                  
                ${ list.title }
                </a>
                </td>
                </tr>
                <tr>
				<td><fmt:formatDate value="${ list.startDate }" pattern="yyyy-MM-dd ~"/></td>
				</tr>
				</table>
 			</c:forEach>
            </div>

            <div class="p_list3">
             <c:forEach var="list" items="${ list }" begin="6" end="8">
            <table>
            <tr>
            <td>      
            		<a href="${ path }/collabo/promotion/detail?pmtNo=${ list.no }">                          
                    <img src="${ path }${ list.imgPath }${ list.no }.jpg" alt="" width="250px" height="250px">
                    </a> 
            </td>
            </tr>    
                <tr>
                <td>
                <a href="${ path }/collabo/promotion/detail?pmtNo=${ list.no }">                  
                ${ list.title }
                </a>
                </td>
                </tr>
                <tr>
				<td><fmt:formatDate value="${ list.startDate }" pattern="yyyy-MM-dd ~"/></td>
				</tr>
				</table>
 			</c:forEach>
            </div>         
            
            <div class="p_list4">
              <c:forEach var="list" items="${ list }" begin="9" end="11">
            <table>
            <tr>
            <td>    
            		<a href="${ path }/collabo/promotion/detail?pmtNo=${ list.no }">                		            
                    <img src="${ path }${ list.imgPath }${ list.no }.jpg" alt="" width="250px" height="250px">
                    </a> 
            </td>
            </tr>         
                <tr>
                <td>
                <a href="${ path }/collabo/promotion/detail?pmtNo=${ list.no }">                  
                ${ list.title }
                </a>
                </td>
                </tr>
                <tr>
				<td><fmt:formatDate value="${ list.startDate }" pattern="yyyy-MM-dd ~"/></td>
				</tr>
				</table>
 			</c:forEach>
            </div>
            
      
            <div class="p_list5">
             <c:forEach var="list" items="${ list }" begin="12" end="14">
            <table>
            <tr>
            <td> 
            		<a href="${ path }/collabo/promotion/detail?pmtNo=${ list.no }">                               
                    <img src="${ path }${ list.imgPath }${ list.no }.jpg" alt="" width="250px" height="250px">
                    </a> 
            </td>
            </tr>         
                <tr>
                <td>
                <a href="${ path }/collabo/promotion/detail?pmtNo=${ list.no }">                  
                ${ list.title }
                </a>
                </td>
                </tr>
                <tr>
				<td><fmt:formatDate value="${ list.startDate }" pattern="yyyy-MM-dd ~"/></td>
				</tr>
				</table>
 			</c:forEach>
            </div>
            
    </div>
</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
	
</body>
</html>