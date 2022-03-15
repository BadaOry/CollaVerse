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
<!-- custom -->
<link href="${ path }/resources/custom/css/schedule.css" rel="stylesheet" />	
<script src="${ path }/resources/custom/js/schedule.js" type="text/javascript"></script>

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

<style>
	.fc-sat { color:#0000FF; }     /* 토요일 */
    .fc-sun { color:#FF0000; }    /* 일요일 */
    
    .add-button {
    	right: 110px;
    }
</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
</head>
<body>
<div id='calendar' style="position : relative; margin: 100px 100px 100px 100px;">
	<div>
		<button class = "add-button" type = "button" 
        	onclick="click_add();">일정 추가</button>
	</div>

</div>

</body>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,listMonth'
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
      ],
      
     
      
      eventClick: function(info) {
    	    // 저희가 클릭한 놈의 Schedule VO 에 담긴 내용을 
    	    // 컨트롤러로 받아서 , 거기서 PK값을 요기 펑션으로 땡겨오고 
    	    // 문제점 : 클릭한 놈의 pk 를 어케가져오냐?
    	    		// > 뿌려는 방식을 모르니까 모른다..
    	    
    		var url = "scheduleModify?no="+info.event.id
       		var name = "scheduleDetail";
       		var option = "width = 700px,height=800px,left=100px,top=50px,location=no";
       		window.open(url,name,option)

  	  }
 
    });


    
    calendar.render();
  });
  
  function click_add() {
		var url = "scheduleAdd";
		var name = "scheduleAdd";
		var option = "width = 700px,height=800px,left=100px,top=50px,location=no";
		window.open(url,name,option)
	};
	
	$(function() {
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd',
			showOtherMonths : true,
			showMonthAfterYear : true,
			changeYear : true,
			changeMonth : true,          
	       yearSuffix: "년",
	      	monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	      	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	       dayNamesMin: ['일','월','화','수','목','금','토'],
	       dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']	
		});
		$("#startDate").datepicker();
		$("#endDate").datepicker();
		
		$("#startDate").datepicker('setDate', 'today');
		$("#endDate").datepicker('setDate', 'today');
	});

	$.fn.serializeObject = function(){
	    var o = {};
	    var a = this.serializeArray();
	    $.each(a, function() {
	    	var name = $.trim(this.name),
	    		value = $.trim(this.value);
	    	
	        if (o[name]) {
	            if (!o[name].push) {
	                o[name] = [o[name]];
	            }
	            o[name].push(value || '');
	        } else {
	            o[name] = value || '';
	        }
	    });
	    return o;
	};
	
	function click_ok(){

		var scheduleData = JSON.stringify($('form#scheduleData').serializeObject());
		
		$.ajax({
			data : scheduleData,
			url : "addSchedule",
			type : "POST",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				opener.parent.location.reload();
				window.close();
			}
		});
	};
	
	function click_confirm(){

		var scheduleData = JSON.stringify($('form#scheduleData').serializeObject());
		
		$.ajax({
			data : scheduleData,
			url : "addSchedule",
			type : "POST",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				opener.parent.location.reload();
				window.close();
			}
		});
	};
	
	function click_ddelete(){

		var scheduleData = JSON.stringify($('form#scheduleData').serializeObject());
		
		$.ajax({
			data : scheduleData,
			url : "deleteSchedule",
			type : "GET",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				opener.parent.location.reload();
				window.close();
			}
		});
	};
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>