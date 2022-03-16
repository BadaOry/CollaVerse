<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.collaverse.mvc.schedule.model.ScheduleVO" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<%
	List<ScheduleVO> list = (ArrayList<ScheduleVO>)request.getAttribute("showSchedule");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CollaVerse</title>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- fullcalendar -->
	<link href='${ path }/resources/fullcalendar/packages/core/main.css' rel='stylesheet' />
	<link href='${ path }/resources/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
	<link href='${ path }/resources/fullcalendar/packages/timegrid/main.css' rel='stylesheet' />
	<link href='${ path }/resources/fullcalendar/packages/list/main.css' rel='stylesheet' />
	<script src='${ path }/resources/fullcalendar/packages/core/main.js'></script>
	<script src='${ path }/resources/fullcalendar/packages/interaction/main.js'></script>
	<script src='${ path }/resources/fullcalendar/packages/daygrid/main.js'></script>
	<script src='${ path }/resources/fullcalendar/packages/timegrid/main.js'></script>
	<script src='${ path }/resources/fullcalendar/packages/list/main.js'></script>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="${ path }/resources/css/mypage/business_mypage.css">

<style>
	#follower-result {
		right: 100px;
	}
</style>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<body>

  <main id="business">
    <section class="mypage">
      <div id="brand-photo">
        <img src="${ path }/resources/upload/profile/${ loginMember.profile_img }">
      </div>
      <div id="brand-name"><strong>${ loginMember.nickname } <span id="col">브</span><span id="la">랜</span><span id="ver">드</span><span id="se"> 페이지</span></strong></div>
    </section>


    <section id="brand-calendar">
      <p class="mini_title">브랜드 캘린더</p>
      <a href="${ path }/mypage/calendar/scheduleDetail">
      	<div id='calendar' style="position : relative;"></div>
      </a>
    </section>

    <section id="brand-follower">
	    <p class="mini_title">브랜드 팔로워 - ${ followerCount } 명</p>
	    <div id="follower">
	    
	    	<c:choose>
				
					<c:when test="${ !empty followerList }">
					
						<c:forEach var="followerList" items="${ followerList }"  begin="0" end="6">
								
							<div class="member_info_container">
								<img id="profile_image" src="${ path }/resources/upload/profile/${ followerList.profileImg }"					
									 onclick="location.href='${ path }/mypage/collection/list/${ followerList.toMemId }'" />
									 
								<p id="member_nickname">${ followerList.toMemNick }</p>	
							</div>
							
						</c:forEach>

						
					</c:when>
					
					<c:otherwise>
					
						<p id="no_followernList">팔로워가 존재하지 않습니다.</p>
						
					</c:otherwise>
					
				</c:choose>

        
        <article class="more">
        
	        <a href="${ path }/mypage/myFollow/main">
	        	<div class="material-icons arrow_right">arrow_right</div>
	        </a>
         
        </article>
        
    	</div>
    </section>

    <section id="statistics">
      <p class="mini_title">통계</p>
      <div id="follower-statistic">
        <p>총 팔로워 ${ followerCount } 명</p>
        <div> 금일 ${ todayCount } 명</div>
        <ul id="follower-result">
            <li>남녀 성비 : 남성 - ${ Math.round(menCount / totalCount*100) }%, 여성 - ${ Math.round(womenCount / totalCount*100) }%</li>
            <c:if test="${ thismonthCount - lastmonthCount > '0'}">
				<li>직전 주 대비 ${ thismonthCount - lastmonthCount } 명 증가</li>
			</c:if>
			<c:if test="${ thismonthCount - lastmonthCount < '0'}">
				<li>직전 주 대비 ${ thismonthCount - lastmonthCount } 명 감소</li>
			</c:if>
            <c:if test="${ thisweekCount - lastweekCount > '0'}">
				<li>직전 주 대비 ${ thisweekCount - lastweekCount } 명 증가</li>
			</c:if>
			<c:if test="${ thisweekCount - lastweekCount < '0'}">
				<li>직전 주 대비 ${ thisweekCount - lastweekCount } 명 감소</li>
			</c:if>
			<c:if test="${ todayCount - yesterdayCount > '0'}">
				<li>작일 대비 ${ todayCount - yesterdayCount } 명 증가</li>
			</c:if>
			<c:if test="${ todayCount - yesterdayCount < '0'}">
				<li>작일 대비 ${ todayCount - yesterdayCount } 명 감소</li>
			</c:if>
        </ul>
      </div>
    </section>



    <section id="brand-collection" style="margin-bottom: 40px;">
    	<p class="mini_title">마이 컬렉션</p>
    	<div id="collection">
	    	<c:choose>
					
						<c:when test="${ !empty collectionList }">
						
							<c:forEach var="collectionList" items="${ collectionList }" begin="0" end="6">
									
								<div class="member_info_container">
									<img id="profile_image" src="${ path }/resources/upload/collection/${ collectionList.renamedFileName01 }" />
								</div>
								
							</c:forEach>
						
							<div class="plus_container">
								<span onclick="location.href='${ path }/mypage/myFollow/follower'"> ▶ 더보기 </span>
							</div>
							
						</c:when>
						
						<c:otherwise>
						
							<p id="no_followernList">컬렉션이 존재하지 않습니다.</p>
							
						</c:otherwise>
						
					</c:choose>
      
        
        <article class="more"  style="width: 60px; display:inline-block; margin: 0 0 0 30px;">
          
	        <a href="${ path }/mypage/collection/list/${ loginMember.id }">
	        	<div class="material-icons arrow_right">arrow_right</div>
	        </a>
        
        </article>
        
      </div>
    </section>

  </main>



</body>

<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
      header: {
        left: '',
        center: 'title',
        right: ''
      },
      locale : "ko",
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      eventColor : '#669900',
      nextDayThreshold: '24:00:00',
      displayEventTime: true,
      
      events: [
    <% 
      	  for (int i = 0; i < list.size(); i++) {
      	  	ScheduleVO vo = (ScheduleVO)list.get(i);
    %>	
      	  {
      	   id : '<%= vo.getNo() %>',
      	   title : '<%= vo.getSubject() %>',
      	   start : '<%= vo.getStartDate()  %>',
      	   end : '<%= vo.getEndDate() %>',
      	   color : '<%= vo.getColor() %>'
      	  },
    <%
    	}
    %>
    	  {
    	  	start : '2022-01-31',
    	  	end : '2022-02-02',
    	  	color : '#FFCCE5',
    	  	rendering : "background"
    	  },
    	  {
      	  	start : '2022-05-05',
      	  	end : '2022-05-05',
      	  	color : '#FFCCE5',
      	  	rendering : "background"
      	  }
      ]
 
    });

    calendar.render();
  });
  

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</html>