<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.Date" %>
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
#header1 {
	height: 80px;
	margin: -20px 0 0 0; 
}

#header3 {
	margin: 35px 0 0 0;
}


body {
	margin: 8px;
}
	.container #cu {
		width: 886px;
		margin-bottom: 30px;
		font-family: 'Sam3KRFont';
		background-color: #fff;
		
	}
	.container #cu .active {
		color: #fff;
		background-color: #730e74;
	}
	.container p { 
		margin:20px 0px; 
	}
	.container a { 
		color: #730e74;
		font-size: 30px;
	}
	.container a:hover {
		background-color: #faae22;
		color: #730e74;
	}
	.container {
	  width: 900px;
	  height: 600px;
	}
	#info_container #serviceInfo {
	margin-top: 12px;
	}
	#info_container #gitHub {
		margin-top: 11px;
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
            <a class="nav-link active" data-toggle="tab" href="#followerCount">1주간 팔로워 증감량</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#genderPercentPie">성별 비율</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#peopleCount">팔로워 수치</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#agePercent">연령대 비율</a>
          </li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane fade show active" id="followerCount">
            
            <canvas id="followerCountChart"></canvas> 
          </div>
          <div class="tab-pane fade" id="genderPercentPie">
            
            <canvas width="850vw" height="450vh" id="genderPercentPieChart"></canvas> 
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

<c:set var="weekAgo" value="<%=new Date(new Date().getTime() - 60*60*24*1000*7)%>"/>
<fmt:formatDate value="${weekAgo}" pattern="yyyy.MM.dd" var="weekAgo"/>
<c:set var="sixdaysAgo" value="<%=new Date(new Date().getTime() - 60*60*24*1000*6)%>"/>
<fmt:formatDate value="${sixdaysAgo}" pattern="yyyy.MM.dd" var="sixdaysAgo"/>
<c:set var="fivedaysAgo" value="<%=new Date(new Date().getTime() - 60*60*24*1000*5)%>"/>
<fmt:formatDate value="${fivedaysAgo}" pattern="yyyy.MM.dd" var="fivedaysAgo"/>
<c:set var="fourdaysAgo" value="<%=new Date(new Date().getTime() - 60*60*24*1000*4)%>"/>
<fmt:formatDate value="${fourdaysAgo}" pattern="yyyy.MM.dd" var="fourdaysAgo"/>
<c:set var="threedaysAgo" value="<%=new Date(new Date().getTime() - 60*60*24*1000*3)%>"/>
<fmt:formatDate value="${threedaysAgo}" pattern="yyyy.MM.dd" var="threedaysAgo"/>
<c:set var="twodaysAgo" value="<%=new Date(new Date().getTime() - 60*60*24*1000*2)%>"/>
<fmt:formatDate value="${twodaysAgo}" pattern="yyyy.MM.dd" var="twodaysAgo"/>
<c:set var="yesterday" value="<%=new Date(new Date().getTime() - 60*60*24*1000*1)%>"/>
<fmt:formatDate value="${yesterday}" pattern="yyyy.MM.dd" var="yesterday"/>



<jsp:useBean id="referDate" class="java.util.Date" />
<jsp:setProperty name="referDate" property="time" value="${referDate.time - 60*60*24*1000*30}"/>
<fmt:formatDate var="lastMonthDate" value="${referDate}" pattern="yyyy-MM-dd"/>

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
        labels: ['${weekAgo}', '${sixdaysAgo}', '${fivedaysAgo}', '${fourdaysAgo}', '${threedaysAgo}', '${twodaysAgo}', '${yesterday}'],
        datasets: [
            {
                label: '팔로워 증감량',
                type : 'line',
                fill : false,
                lineTension : 0.2,  // 0이면 꺾은선 그래프, 숫자가 높을수록 둥글해짐
                pointRadius : 6,    // 각 지점에 포인트 설정 (0 이면 일자선)                            
                backgroundColor: '#730e74',
                borderColor: '#730e74',
                data: [${yesterday7Count}, ${yesterday6Count}, ${yesterday5Count}, ${yesterday4Count}, ${yesterday3Count}, ${yesterday2Count}, ${yesterday1Count}],
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
                max: 30,
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
canvas = document.getElementById('genderPercentPieChart');
ctx = canvas.getContext('2d');
myChart = new Chart(ctx, {
    type: 'pie', 
    plugins:[ChartDataLabels],
    data: {
        labels: ['남성', '여성'], // [X 축 데이터 라벨 (제목)]
        datasets: [{
                  label: '남녀 비율',
                  // barPercentage: 0.2,
                  barThickness: 100,
                  data:[Math.round(${menCount}/${totalCount}*100), Math.round(${womenCount}/${totalCount}*100)],
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
                display: true,
                position: 'bottom'
            }
        },
        responsive: false  
    }
});

// 팔로워 성별 상세 수치
canvas = document.getElementById('genderCountChart');
ctx = canvas.getContext('2d');
myChart = new Chart(ctx, {
    type: 'bar', 
    plugins:[ChartDataLabels],
    data: {
        labels: ['남성', '여성', '총원'], // [X 축 데이터 라벨 (제목)]
        datasets: [{
                  axis: 'x',
                  label: '남녀 수치',
                  // barPercentage: 0.2,
                  barThickness: 100,
                  data:[${menCount}, ${womenCount}, ${totalCount}],
                  backgroundColor: [
                    'rgba(54, 162, 235, 0.5)',
                    'rgba(255, 99, 132, 0.5)',
                    'rgba(153, 102, 255, 0.5)'
                      
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
            legend: {
                display: false,
                position: 'bottom'
            }
        },
        indexAxis: 'x',
        scales: {
        		  y: {
        			ticks: {
        				stepSize: 5, 
                        min: 0,
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
                  data:[Math.round(${teenagerCount}/${totalCount}*100), Math.round(${twentiesCount}/${totalCount}*100), 
                	  Math.round(${thirtiesCount}/${totalCount}*100), Math.round(${fortiesCount}/${totalCount}*100), 
                	  Math.round(${fiftiesCount}/${totalCount}*100), Math.round(${etcCount}/${totalCount}*100)],
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
        		  y: {
        			  ticks: {
        				  font: { 
                              family: 'Helvetica Neue',
                              size: 15,
                              weight: 'bold',
                              lineHeight: 1.2,   
                          } 
        			  }
        		  },
                  x: { // [y 축 관련 설정] 
                    ticks: {
                      stepSize: 10, //y축 간격 
                      min: 0,
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
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>