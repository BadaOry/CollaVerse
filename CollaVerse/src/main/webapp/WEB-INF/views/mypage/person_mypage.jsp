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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="${ path }/resources/css/mypage/person_mypage.css">

</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<main id="person">
    <section class="mypage">
      <div id="person-photo">
        <img src="${ loginMember.profile_img }" alt="">
      </div>
      <div id="person-name"><strong><span id="memebr_nickname">${ loginMember.nickname }</span> 님의 
			<span id="col">콜</span><span id="la">라</span><span id="ver">버</span><span id="se">스</span></strong>
	  </div>
    </section>


    <section id="person-calendar" 	>
      <p class="mini_title">My 콜라보 캘린더</p>
      <a href="${ path }/mypage/calendar/calendar_detail">
      	<div id='calendar'></div>
      </a>
    </section>

    <section id="person-follow">
      <p class="mini_title">팔로우</p>
      <div id="follow">
        <article>
          <a href="javascript:void(0)"><img src="${ path }/resources/images/mypage_test/아이슬란드 링로드.PNG" alt=""></a>
          <div>dd</div>
        </article>
        <article>
          <a href="javascript:void(0)"><img src="${ path }/resources/images/mypage_test/아이슬란드 링로드.PNG" alt=""></a>
          <div>dd</div>
        </article>
        <article>
          <a href="javascript:void(0)"><img src="${ path }/resources/images/mypage_test/아이슬란드 링로드.PNG" alt=""></a>
          <div>dd</div>
        </article>
        <article>
          <a href="javascript:void(0)"><img src="${ path }/resources/images/mypage_test/아이슬란드 링로드.PNG" alt=""></a>
          <div>dd</div>
        </article>
        <article>
          <a href="javascript:void(0)"><img src="${ path }/resources/images/mypage_test/아이슬란드 링로드.PNG" alt=""></a>
          <div>dd</div>
        </article>
        <article>
          <a href="javascript:void(0)"><img src="${ path }/resources/images/mypage_test/아이슬란드 링로드.PNG" alt=""></a>
          <div>dd</div>
        </article>
        <article class="more">
          <a href="####"><div class="material-icons arrow_right">arrow_right</div></a>
          <%-- <a href="####"><div class="text">더보기</div></a> --%>
        </article>
      </div>
    </section>

    <section id="person-collection" style="margin-bottom: 40px;">
      <p class="mini_title">마이 컬렉션</p>
      <div id="collection">
        <article>
          <a href="javascript:void(0)"><img src="${ path }/resources/images/mypage_test/아이슬란드 링로드.PNG" alt=""></a>
          <div>dd</div>
        </article>
        <article>
          <a href="javascript:void(0)"><img src="${ path }/resources/images/mypage_test/아이슬란드 링로드.PNG" alt=""></a>
          <div>dd</div>
        </article>
        <article>
          <a href="javascript:void(0)"><img src="${ path }/resources/images/mypage_test/아이슬란드 링로드.PNG" alt=""></a>
          <div>dd</div>
        </article>
        <article>
          <a href="javascript:void(0)"><img src="${ path }/resources/images/mypage_test/아이슬란드 링로드.PNG" alt=""></a>
          <div>dd</div>
        </article>
        <article>
          <a href="javascript:void(0)"><img src="${ path }/resources/images/mypage_test/아이슬란드 링로드.PNG" alt=""></a>
          <div>dd</div>
        </article>
        <article>
          <a href="javascript:void(0)"><img src="${ path }/resources/images/mypage_test/아이슬란드 링로드.PNG" alt=""></a>
          <div>dd</div>
        </article>
        <article class="more">
          <a href="####"><div class="material-icons arrow_right">arrow_right</div></a>
          <%-- <a href="####"><div class="text">더보기</div></a> --%>
        </article>
      </div>
    </section>

  </main>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			headerToolbar : { // 헤더에 표시할 툴 바
				start : '',
				center : 'title',
				end : ''
			},
			titleFormat : function(date) {
				return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			},
			//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
			selectable : true, // 달력 일자 드래그 설정가능
			droppable : true,
			editable : true,
			nowIndicator: true, // 현재 시간 마크
			locale: 'ko' // 한국어 설정
		});
		calendar.render();
	});
	</script>

</html>