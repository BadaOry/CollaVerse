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
<style>
  html, body{
      width : 100%;
      height : 100%;
      margin : 0;
      padding : 0;
      border : none;  
      /* 배경 색상 지정 */
      /*background-color: #171e38;*/            
      overflow : auto;                    
  }      
  #myBarHeightChart {
  	margin-bottom: 80px;
  }                 
</style> 
<%@ include file="/WEB-INF/views/common/header.jsp" %>
</head>
<body>
<div style="width: 80%; height: 10%; margin: 0 auto; padding: 0; border: 1px solid #000;
float: top; position: relative; top: 5%; left: 0;">

  <div id="gender_percentage_container"
  style="width: 25%; height: 100%; margin: 0 auto; padding: 0; border: none; cursor: pointer; background: #999;
      float: left; position: relative; top: 0; left: 0; display: table; table-layout: fixed;"
  onclick="canvasSizeCheck(1);">
  <p style="display: table-cell; vertical-align: middle; text-align: center; color: #fff; font-weight: bold;">
      성별 비율
  </p>
  </div>

  <div id="gender_count_container"
  style="width: 25%; height: 100%; margin: 0 auto; padding: 0; border: none; cursor: pointer; background: #222;
      float: left; position: relative; top: 0; left: 0; display: table; table-layout: fixed;"
  onclick="canvasSizeCheck(2);">
  <p style="display: table-cell; vertical-align: middle; text-align: center; color: #fff; font-weight: bold;">
      회원수 수치
  </p>
  </div>

  <div id="age_percentage_container"
  style="width: 25%; height: 100%; margin: 0 auto; padding: 0; border: none; cursor: pointer; background: #666;
      float: left; position: relative; top: 0; left: 0; display: table; table-layout: fixed;"
  onclick="canvasSizeCheck(3);">
  <p style="display: table-cell; vertical-align: middle; text-align: center; color: #fff; font-weight: bold;">
      연령대 분포 비율
  </p>
  </div>

  <div id="age_count_container"
  style="width: 25%; height: 100%; margin: 0 auto; padding: 0; border: none; cursor: pointer; background: #444;
      float: left; position: relative; top: 0; left: 0; display: table; table-layout: fixed;"
  onclick="canvasSizeCheck(4);">
  <p style="display: table-cell; vertical-align: middle; text-align: center; color: #fff; font-weight: bold;">
      연령대 분포 수치
  </p>
  </div>
</div>

  <div id="canvas_container" 
    style="width: 80%; height: 80%; margin: 0 auto; padding: 0; border: 1px solid #000;
        float: top; position: relative; top: 5%; left: 0;">    
    <!-- canvas에 실제로 차트가 그려진다 -->
    <canvas id="myBarHeightChart"></canvas> 
  </div>
</body>
<script>
	var canvas;
	var ctx;
	var height = "";
	var width = "";
	var myChart;
	
	// 선택시 그래프 보여주는 펑션
	function canvasSizeCheck(type){

	      // [캔버스를 포함하고 있는 상위 부모 컨테이너 id 지정 >> 부모 컨테이너 크기에 맞춰서 캔버스 리사이즈]
	      var tagId = document.getElementById("canvas_container");

	      height = window.getComputedStyle(tagId).height;
	      width = window.getComputedStyle(tagId).width;

	      // [화면 사이즈가 변경된 경우 기존 차트 삭제 실시]
	      if(ctx != null){ 
	          canvas.getContext("2d").clearRect(0, 0, canvas.width, canvas.height);
	          ctx.beginPath();
	          myChart.destroy();
	      }

	      if(type == 1){ 
	          createCheartGenderPercentage();
	      }
	      if(type == 2){ 
	          createCheartGenderCount();
	      }
	      if(type == 3){ 
	          createCheartAgePercentage();
	      }
	      if(type == 4){ 
	          createCheartAgeCount();
	      }
	};
	
	// 성별 비율 차트
	function createCheartGenderPercentage(){
	      canvas = document.getElementById('myBarHeightChart');
	      ctx = canvas.getContext('2d');

	      canvas.height = height;
	      canvas.width = width;

	      myChart = new Chart(ctx, {
	          type: 'bar', 
	          plugins:[ChartDataLabels],
	          data: {
	              labels: ['남성 비율', '여성 비율'], // [X 축 데이터 라벨 (제목)]
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
	                  legend: {
	                      display: false,
	                      position: 'bottom'
	                  }
	              }    
	          }
	      });
	 };
	 
	 // 회원수 수치 차트
  function createCheartGenderCount(){
            canvas = document.getElementById('myBarHeightChart');
            ctx = canvas.getContext('2d');            

            canvas.height = height;
            canvas.width = width;

            myChart = new Chart(ctx, {
                type: 'bar', 
                plugins:[ChartDataLabels],
                data: {
                    labels: ['남성 회원', '여성 회원', '합계'], // [X 축 데이터 라벨 (제목)]
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
                        legend: {
                          display: false,
                          position: 'bottom' 
                        }
                    },
                    scales: {
                        y: { // [y 축 관련 설정] 
                          ticks: {
                            stepSize: 5, //y축 간격 
                            min: 0
                          }
                        }
                    }  
                }
           });
      };
      
      // 연령배 분포 비율
        function createCheartAgePercentage(){
            canvas = document.getElementById('myBarHeightChart');
            ctx = canvas.getContext('2d');

            canvas.height = height;
            canvas.width = width;

            myChart = new Chart(ctx, {
                type: 'bar', 
                plugins:[ChartDataLabels],
                data: {
                    labels: ['10대', '20대', '30대', '40대', '50대', '그 외'], // [X 축 데이터 라벨 (제목)]
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
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
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
                              stepSize: 5, //y축 간격 
                              min: 0
                            }
                        }
                    }     
                }
            });
        };
      
      // 연령배 분포 수치
        function createCheartAgeCount(){
            canvas = document.getElementById('myBarHeightChart');
            ctx = canvas.getContext('2d');

            canvas.height = height;
            canvas.width = width;

            myChart = new Chart(ctx, {
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
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                          'rgba(255, 206, 86, 1)',
                          'rgba(75, 192, 192, 1)',
                          'rgba(153, 102, 255, 1)',
                          'rgba(255, 159, 64, 1)'
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
                    scales: {
                        y: { // [y 축 관련 설정] 
                          ticks: {
                            stepSize: 5, //y축 간격 
                            min: 0
                          }
                        }
                    }
                }
            });
        };
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>