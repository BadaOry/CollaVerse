<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CollaVerse</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.0/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<style>
	#cu {
		width: 798.68px;
		margin-bottom: 30px;
		font-family: 'Sam3KRFont';
		background-color: #faae22;
		
	}
	#cu .active {
		color: #faae22;
		background-color: #730e74;
	}
	p { 
		margin:20px 0px; 
	}
	a { 
		color: #730e74;
		font-size: 30px;
	}
	.container {
	  width: 800px;
	  height: 600px;
	}
	</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col">
        <ul class="nav nav-tabs" id="cu">
          <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#followerCount">연령대 비율</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#genderPercent">성별 비율</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#peopleCount">회원수 수치</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#agePercent">연령대 비율</a>
          </li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane fade show active" id="followerCount">
            
            <canvas id="followerCountChart"></canvas> 
          </div>
          <div class="tab-pane fade" id="genderPercent">
            
            <canvas id="genderPercentChart"></canvas> 
          </div>
          <div class="tab-pane fade" id="peopleCount">
            
            <canvas id="genderCountChart"></canvas> 
          </div>
          <div class="tab-pane fade" id="agePercent">
            
            <canvas id="agePercentChart"></canvas> 
          </div>
        </div>
    </div>
  </div>
</div>
</body>
<script>
var canvas;
var cts;
var myChart;

//최근 1주간 팔로워 증감량
canvas = document.getElementById('followerCountChart');
ctx = canvas.getContext('2d');
myChart = new Chart(ctx, {
    type: 'line',
    plugins:[ChartDataLabels],
    data: {
        labels: ['10대', '20대', '30대', '40대', '50대', '그 외'],
        datasets: [
            {
                label: '연령 분포 비율',
                type : 'line',
                fill : false,
                lineTension : 0.2,  // 0이면 꺾은선 그래프, 숫자가 높을수록 둥글해짐
                pointRadius : 6,    // 각 지점에 포인트 설정 (0 이면 일자선)                            
                backgroundColor: '#730e74',
                borderColor: '#730e74',
                data: [18, 13, 18, 3, 1, 2, 40],
                borderWidth: 1,
                datalabels:{
                    color:'#faae22',                                 
                    font:{
                        size:15
                    } 
                }
            }            
        ]
    },
    options: {
        plugins: {
            datalabels: {
                anchor :'end',
                align :'top',
                formatter: function (value, ctx) {
                    return value + '명';
                }
            },
            legend: {
                display: true,
                labels: {
                    color: 'rgb(0, 0, 0)',
                    font: { // [폰트 스타일 변경]
                        //family: 'Comic Sans MS',
                        family: 'Helvetica Neue',
                        //family: 'Helvetica',
                        size: 15,
                        weight: 'bold',
                        //weight: 'normal',
                        lineHeight: 1.2,   
                    } 
                }
            }
        },
        scales: {
            y: {
                min: 0,
                max: 50,
                grid: { // [y 축 데이터 시트 배경 선색 표시]
                    drawBorder: false,
                    color: function(context) {
                        // y 축 값별로 그리드 선색 변경 실시
                        if (context.tick.value >= 0) {
                            return 'rgba(0, 0, 0, 0.1)'; 
                        }
                        else {
                            return 'rgba(255, 0, 0, 0.1)';
                        }                                 
                    }
                },
                ticks: {
                    beginAtZero: true,
                    color: '#000',
                    font: {
                        family: 'Helvetica Neue',
                        size: 15,
                        weight: 'bold',
                        lineHeight: 1.2,   
                    } 
                }
            },
            x: { 
                ticks: {
                    color: '#000',
                    font: { 
                        family: 'Helvetica Neue',
                        size: 15,
                        weight: 'bold',
                        lineHeight: 1.2,   
                    } 
                }
            }
        }                 
    }
});


//남녀 성별 비율
canvas = document.getElementById('genderPercentChart');
ctx = canvas.getContext('2d');
myChart = new Chart(ctx, {
    type: 'bar', 
    plugins:[ChartDataLabels],
    data: {
        labels: ['남성 비율', '여성 비율'], // [X 축 데이터 라벨 (제목)]
        datasets: [{
                  label: '남녀 비율',
                  // barPercentage: 0.2,
                  barThickness: 100,
                  data:[60, 40],
                  backgroundColor: [
                    'rgba(54, 162, 235, 0.5)',
                    'rgba(255, 99, 132, 0.5)'
                      
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
            legend: {
                display: false,
                position: 'bottom'
            }
        },
        scales: {
                  y: { // [y 축 관련 설정] 
                      ticks: {
                        stepSize: 10, //y축 간격 
                        min: 0
                      }
                  }
              }     
    }
});

// 팔로워 성별 상세 수치
canvas = document.getElementById('genderCountChart');
ctx = canvas.getContext('2d');
myChart = new Chart(ctx, {
    type: 'bar', 
    plugins:[ChartDataLabels],
    data: {
        labels: ['남성 비율', '여성 비율'], // [X 축 데이터 라벨 (제목)]
        datasets: [{
                  axis: 'y',
                  label: '남녀 비율',
                  // barPercentage: 0.2,
                  barThickness: 100,
                  data:[60, 40],
                  backgroundColor: [
                    'rgba(54, 162, 235, 0.5)',
                    'rgba(255, 99, 132, 0.5)'
                      
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
                  return value + '명';
              }
            },
            legend: {
                display: false,
                position: 'bottom'
            }
        },
        indexAxis: 'y',
        scales: {
                  x: { // [y 축 관련 설정] 
                    ticks: {
                      stepSize: 5, //y축 간격 
                      min: 0
                    }
                  }
        }   
    }
});

// 연령 분포 비율
canvas = document.getElementById('agePercentChart');
ctx = canvas.getContext('2d');
myChart = new Chart(ctx, {
    type: 'bar', 
    plugins:[ChartDataLabels],
    data: {
        labels: ['10대', '20대', '30대', '40대', '50대', '그 외'], // [X 축 데이터 라벨 (제목)]
        datasets: [{
                  axis: 'y',
                  label: '연령 분포',
                  // barPercentage: 0.2,
                  barThickness: 30,
                  data:[20, 20, 30, 20, 9, 1],
                  backgroundColor: [
                  'rgba(255, 99, 132, 0.5)',
                  'rgba(54, 162, 235, 0.5)',
                  'rgba(255, 206, 86, 0.5)',
                  'rgba(75, 192, 192, 0.5)',
                  'rgba(153, 102, 255, 0.5)',
                  'rgba(255, 159, 64, 0.5)'
                      
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
            legend: {
                display: false,
                position: 'bottom'
            }
        },
        indexAxis: 'y',
        scales: {
                  x: { // [y 축 관련 설정] 
                    ticks: {
                      stepSize: 10, //y축 간격 
                      min: 0
                    }
                  }
        }   
    }
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>