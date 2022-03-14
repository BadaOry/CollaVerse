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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CollaVerse</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<link rel="stylesheet" href="${ path }/resources/css/mypage/business_mypage.css">
<style>
	#chart {
	margin-top: 50px;
	display: flex;
	}
</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
</head>
<body>


	<div id="chart" style="width: 600px; height: 600px;">
	    <!--차트가 그려질 부분-->
	    <canvas id="genderChart"></canvas>

  	</div>
 
  
</body>


<script>

var ctx = document.getElementById('genderChart').getContext('2d');
var myChart = new Chart(ctx, {
type: 'pie',
data: {
    labels: ['여성 비율', '남성 비율'],
    datasets: [{
        label: '남녀 비율',
        data:[Math.round(${womenCount}/(${menCount}+${womenCount})*100),Math.round(${menCount}/(${menCount}+${womenCount})*100)],
        backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)'
        ],
        borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)'
        ],
        borderWidth: 1
    }]
},
options: {
    //그래프의 제목 옵션
    title: {
        display: true,
        text: '자사 팔로워 남녀 비율',
        fontSize: 20
    },
    //그래프의 항목 옵션
    legend: {
        display: true,
        position: 'bottom',
    },

    /*
    scales: {
        yAxes: [{
            ticks: {
                beginAtZero: true
            }
        }]
    }
    */
}
});



</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>