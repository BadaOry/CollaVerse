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

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.0/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<link rel="stylesheet" href="${ path }/resources/css/mypage/business_mypage.css">
<style>
	#chart1 {
	margin-top: 50px;
	margin-bottom: 50px;
	display: flex;
	}
	#ctitle {
		font-size: 50px;
		right: 500px;
	}
</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
</head>
<body>

<p id="ctitle">${ loginMember.nickname } 팔로워 남녀 비율</p>

	<!-- 파이 그래프(성별 - %) -->
	<div id="chart1" style="width: 300px; height: 300px;">
	    <!--차트가 그려질 부분-->
	    <canvas id="genderPieChart"></canvas>
  	</div>
  	
 	<!-- 막대 그래프(성별 - 명) -->
	<div id="chart1" style="width: 550px; height: 550px;">
	    <!--차트가 그려질 부분-->
	    <canvas id="genderBarChart"></canvas>
  	</div>
  	
<p id="ctitle">${ loginMember.nickname } 팔로워 연령 분포</p>
  	<!-- 파이 그래프(연령 - %) -->
  	<div id="chart1" style="width: 300px; height: 300px;">
	    <!--차트가 그려질 부분-->
	    <canvas id="agePieChart"></canvas>
  	</div>
  	
	<!-- 막대 그래프(연령 - 명) -->
	<div id="chart1" style="width: 550px; height: 550px;">
	    <!--차트가 그려질 부분-->
	    <canvas id="ageBarChart"></canvas>
  	</div>
</body>

<script>
var ctx = document.getElementById('genderPieChart').getContext('2d');
var myChart = new Chart(ctx, {
type: 'pie',
plugins:[ChartDataLabels],
data: {
    labels: ['남성 비율', '여성 비율'],
    datasets: [{
        label: '남녀 비율',
        data:[Math.round(${menCount}/${totalCount}*100), Math.round(${womenCount}/${totalCount}*100)],
        backgroundColor: [
        	'rgba(54, 162, 235, 0.2)',
            'rgba(255, 99, 132, 0.2)'
            
        ],
        borderColor: [
        	'rgba(54, 162, 235, 1)',
            'rgba(255, 99, 132, 1)'
        ],
        borderWidth: 1
    }]
},
options: {
    plugins: {
    	datalabels: {
    	    formatter: function (value, ctx) {
    	        return value + '%';
    	    }
    	},
    	//그래프의 제목 옵션
    	/*
        title: {
            display: true,
            text: '자사 팔로워 남녀 비율',
            fontSize: 20
        },
        */
        //그래프의 항목 옵션
        legend: {
            display: true,
            position: 'bottom'
        }
    }
}
});


var ctx = document.getElementById('genderBarChart').getContext('2d');
var myChart = new Chart(ctx, {
type: 'bar',
plugins:[ChartDataLabels],
data: {
    labels: ['남성 회원', '여성 회원', '합계'],
    datasets: [{
        label: '남녀 비율',
        data:[${menCount}, ${womenCount}, ${totalCount}],
        backgroundColor: [
        	'rgba(54, 162, 235, 0.2)',
        	'rgba(255, 99, 132, 0.2)',
        	'rgba(153, 102, 255, 0.2)'
            
        ],
        borderColor: [
        	'rgba(54, 162, 235, 1)',
            'rgba(255, 99, 132, 1)',
        	'rgba(153, 102, 255, 1)'
        ],
        borderWidth: 1
    }]
},
options: {
    plugins: {
    	datalabels: {
    	    formatter: function (value, ctx) {
    	        return value + '명';
    	    }
    	},
    	//그래프의 제목 옵션
    	/*
        title: {
            display: true,
            text: '자사 팔로워 남녀 비율',
            fontSize: 20
        },
        */
        //그래프의 항목 옵션
        legend: {
            display: false,
            position: 'bottom'
        }
    },
    scales: {
        y: {
            ticks: {
            	stepSize: 1, //y축 간격 
            	min: 0
            }
        }
    }
}
});


var ctx = document.getElementById('agePieChart').getContext('2d');
var myChart = new Chart(ctx, {
type: 'pie',
plugins:[ChartDataLabels],
data: {
    labels: ['10대', '20대', '30대', '40대', '50대', '그 외'],
    datasets: [{
        label: '연령 분포',
        data:[20, 20, 30, 20, 9, 1],// 인원수가 적어서 일단 데이터 하드 코딩 박음 -> 인원 추가 후 수정예정(기능구현은 완료 3명으로 확인해봄)
        backgroundColor: [
        	'rgba(255, 99, 132, 0.2)',
        	'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)'
        ],
        borderColor: [
        	'rgba(255, 99, 132, 0.2)',
        	'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)'
        ],
        borderWidth: 1
    }]
},
options: {
    plugins: {
    	datalabels: {
    	    formatter: function (value, ctx) {
    	        return value + '%';
    	    }
    	},
    	//그래프의 제목 옵션
    	/*
        title: {
            display: true,
            text: '자사 팔로워 남녀 비율',
            fontSize: 20
        },
        */
        //그래프의 항목 옵션
        legend: {
            display: true,
            position: 'bottom'
        }
    }
}
});

var ctx = document.getElementById('ageBarChart').getContext('2d');
var myChart = new Chart(ctx, {
type: 'bar',
plugins:[ChartDataLabels],
data: {
    labels: ['10대', '20대', '30대', '40대', '50대', '그 외'],
    datasets: [{
        label: '연령 분포',
        data:[20, 20, 30, 20, 9, 1],// 인원수가 적어서 일단 데이터 하드 코딩 박음 -> 인원 추가 후 수정예정(기능구현은 완료 3명으로 확인해봄)
        backgroundColor: [
        	'rgba(255, 99, 132, 0.2)',
        	'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)'
            
        ],
        borderColor: [
        	'rgba(255, 99, 132, 0.2)',
        	'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)'
        ],
        borderWidth: 1
    }]
},
options: {
    plugins: {
    	datalabels: {

    	    formatter: function (value, ctx) {
    	        return value + '명';
    	    }
    	},
    	//그래프의 제목 옵션
    	/*
        title: {
            display: true,
            text: '자사 팔로워 남녀 비율',
            fontSize: 20
        },
        */
        //그래프의 항목 옵션
        legend: {
            display: false,
            position: 'bottom'
        }
    },
    scales: {
        y: {
            ticks: {
            	stepSize: 1, //y축 간격 
            	min: 0
            }
        }
    }
}
});

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>