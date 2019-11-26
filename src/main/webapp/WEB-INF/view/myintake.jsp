<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.safe.vo.Food, com.safe.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Notice</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicons -->
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,500,600,700,700i|Montserrat:300,400,500,600,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="css/style.css" rel="stylesheet">

<link href="css/mycss.css" rel="stylesheet">

<style type="text/css">
body {
	background-color: white;
}
</style>
<!-- =======================================================
    Theme Name: Rapid
    Theme URL: https://bootstrapmade.com/rapid-multipurpose-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->


  
  
  
  
</head>

<body>
	<jsp:include page="nav.jsp"></jsp:include>

	<section id="services" class="section-bg">
		<div class="container">

			<header class="section-header">
				<h3>내 섭취 정보</h3>
			</header>

			<div class="container">
				<button class="btn btn-warning statebtn" value = "day">일간</button>
				<button class="btn btn-success statebtn" value = "week">주간</button>
				<button class="btn btn-primary statebtn" value = "month">월간</button>
			</div>
			<table id = "intakeTable">

			</table>
			<h5 id = "intakeinfo">영양 정보</h5>
				<center>
					<div id="piechart" style="width: 900px; height: 500px;"></div>
				</center>
		</div>
	</section>
	
	<div class = "floating">
		<label>인기 검색어</label>
		<%@ include file="trends.jsp"%>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<!-- Uncomment below i you want to use a preloader -->
	<!-- <div id="preloader"></div> -->

	<!-- JavaScript Libraries -->
	<script src="lib/jquery/jquery.min.js"></script>
	<script src="lib/jquery/jquery-migrate.min.js"></script>
	<script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/mobile-nav/mobile-nav.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/counterup/counterup.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/isotope/isotope.pkgd.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>
	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<!--검색 -->
	
	<script type="text/javascript">
	var state = "day";
	
	$(document).ready(function(){
 		intakeList("day");
 		intakeState();
 		intakeDel();
 		intakeAdd();
	});
	 

	

	//모든 사용자 목록 조회 요청
	function intakeList(state) {//REST 서버에 모든 고객정보 ajax 요청 보내기
			$.ajax({
				url : 'myintake.food?state='+state,
				type : 'get',
				dataType : 'json', //서버가 보내주는 데이터 타입
				success : function(data){
					intakeListResult(data);
				},
				error : function(xhr, status, msg){
					alert("상태값 : " + status + "http 에러 메세지 : " + msg);
				}
				
			});
	}//customerList
	
	function intakeListResult(data){
		$('#intakeTable').empty();
		$('#piechart').empty();
		$('#intakeinfo').empty();
		
		
		if(data == ""){
			$('<h2>').html("해당 기간에 섭취한 식품이 없습니다.")
					 .appendTo('#intakeTable');
		
		}else{
			$('#intakeinfo').html("영양정보");
		
			$('<tr>').append($('<th>').html("섭취일자"))
					 .append($('<th>').html("제품명"))
					 .append($('<th>').html("섭취 칼로리"))
				     .append($('<th>').html("섭취 갯수"))
				     .appendTo('#intakeTable');
			
			var temp2 = 0;
	     	var temp3 = 0;
			var temp4 = 0;
			var temp5 = 0;
			var temp6 = 0;
			var temp7 = 0;
			var temp8 = 0;
			var temp9 = 0;
			var temp10 = 0;
			
			
			$.each(data, function(idx,item){
				$('<tr>').append($('<td>').html(item.idate))
						 .append($('<td>').html(item.name))
						 .append($('<td>').html(item.calory))
						 .append($('<td>').html(item.count))
						 .append($('<td>').html('<button id = "btnAdd">+</buttton>'))
						 .append($('<td>').html('<button id = "btnDel">-</buttton>'))
						 .append($('<input type="hidden" id ="hidden_code">').val(item.code))
						 .append($('<input type="hidden" id ="hidden_date">').val(item.idate))
						 .appendTo('#intakeTable');
		     	
				temp2 += item.calory
				temp3 += item.carbo * item.count;
				temp4 += item.protein * item.count;
				temp5 += item.fat * item.count;
				temp6 += item.sugar * item.count;
				temp7 += item.natrium * item.count;
				temp8 += item.getchole * item.count;
				temp9 += item.fattyacid * item.count;
				temp10 += item.transfat * item.count;
			});
			
			temp2 = temp2.toFixed(2);
			temp3 = temp3.toFixed(2);
			temp4 = temp4.toFixed(2);
			temp5 = temp5.toFixed(2);
			temp6 = temp6.toFixed(2);
			temp7 = temp7.toFixed(2);
			temp8 = temp8.toFixed(2);
			temp9 = temp9.toFixed(2);
			temp10 = temp10.toFixed(2);
			
		    google.charts.load('current', {'packages':['corechart']});
		    google.charts.setOnLoadCallback(drawChart);
			
			function drawChart() {
		        var data = google.visualization.arrayToDataTable([
		          ['Kind', 'Value'],
		          ['탄수화물 : ' + temp3, temp3 * 1],
		          ['단백질 : ' + temp4, temp4 * 1],
		          ['지방 : ' + temp5, temp5 * 1],
		          ['당류 : ' + temp6, temp6 * 1],
		          ['나트륨 : ' + temp7, temp7 * 1],
		          ['콜레스테롤 : ' + temp8, temp8 * 1],
		          ['포화지방산 : ' + temp9, temp9 * 1],
		          ['트랜스지방 : ' + temp10, temp10 * 1]
		        ]);
	
		        var options = {
		          title: '총 섭취 칼로리 : ' + temp2
		        };
	
		        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
			 		chart.draw(data, options);
				}
		}
	}
	
	//섭취 빼기 요청
	 function intakeDel() {
		$('body').on('click', '#btnDel', function(){
			var code = $(this).closest('tr').find('#hidden_code').val();
			var date = $(this).closest('tr').find('#hidden_date').val();
			$.ajax({
				url:'intakeDel.food?code='+code +'&date='+date,
				type:'get',
				success: function(){
					intakeList(state);
				},
				error : function(xhr, status, msg){
					alert("상태값 : " + status + "http 에러 메세지 : " + msg);
				}
			});
		});
	}
	
	//섭취 추가 요청
	function intakeAdd() {
		$('body').on('click', '#btnAdd', function(){
			var code = $(this).closest('tr').find('#hidden_code').val();
			var date = $(this).closest('tr').find('#hidden_date').val();
			$.ajax({
				url:'intakeAdd.food?code='+code +'&date='+date,
				type:'get',
				success: function(){
					intakeList(state); 
				},
				error : function(xhr, status, msg){
					alert("상태값 : " + status + "http 에러 메세지 : " + msg);
				}
			});
		});
	}//customerDelete
	
	function intakeState() {
		$('body').on('click', '.statebtn', function(){
			var val = $(this).val();
			state = val;
			intakeList(val);
		});
	}

	

	
</script>

</body>
</html>
