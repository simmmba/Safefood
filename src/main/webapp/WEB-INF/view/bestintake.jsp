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
	table {
		width: 70%;
		border: solid white;
	}
	.it td{
		text-align: center;
		padding: 8px;
	}
	.it th{
		text-align: center;
		padding: 15px;
		font-size: 17px;
		/* background-color: #000; */
	}
	.it tr:nth-child(odd) { 
		background-color: #ece6df; 
	}
	.it tr:nth-child(even) { 
		background-color: #dbcdc1; 
	}
	.it tr:nth-child(1) { 
		background-color: #ac8d71;
		color: white; 
	}
	.btn-group .button {
		border: 1.5px solid #604937;
		background-color: #604937;
		color: white;
		padding: 9px 20px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 17px;
		cursor: pointer;
		float: left;
		border-radius: 10px;
	}
	
	.btn-group .button:not(:last-child) {
		border-right: none; /* Prevent double borders */
	}
	
	.btn-group .button:hover {
		background-color: #fff;
		color: #604937;
		font-weight: bold;
	}
</style>
</head>

<body>
	<jsp:include page="nav.jsp"></jsp:include>

	<section id="services" class="section-bg">
		<div class="container">

			<header class="section-header">
				<h3>베스트 섭취 정보</h3>
			</header>
			<center>
				<div class="container" style="background-color: white; border-radius: 2em;">
					<br>
					<div class="btn-group" >
						<button class="button statebtn" value = "intake">섭취 갯수</button>
						<button class="button statebtn" value = "maker">제조사</button>
						<button class="button statebtn" value = "calory">칼로리</button>
					</div>
					<br><br>
					<table id = "intakeTable" class="it" border="1"></table>
					<br>
					<!-- <h5 id = "intakeinfo">영양 정보</h5> -->
					<div id="piechart" style="width: 900px; height: 500px;"></div>
				</div>
			</center>
		</div>
	</section>
	
	
	<jsp:include page="trends.jsp"></jsp:include>
	
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
	var state = "intake";
	
	$(document).ready(function(){
		bestintakeList("intake");
		bestintakeState();
		bestintakeDel();
		bestintakeAdd();
	});

	//모든 섭취 정보 중 10개
	function bestintakeList(state) {//REST 서버에 모든 고객정보 ajax 요청 보내기
			$.ajax({
				url : 'bestintake.food?state='+state,
				type : 'get',
				dataType : 'json', //서버가 보내주는 데이터 타입
				success : function(data){
					bestintakeListResult(data);
				},
				error : function(xhr, status, msg){
					alert("상태값 : " + status + "http 에러 메세지 : " + msg);
				}
			});
	}
	
	function bestintakeListResult(data){
		$('#intakeTable').empty();
		$('#piechart').empty();
		$('#intakeinfo').empty();
		
		
		if(data == ""){
			$('<h2>').html("해당 기간에 섭취한 식품이 없습니다.")
					 .appendTo('#intakeTable');
		
		}else{
			
			var list = new Array();
			var opt = {};
			list[0] = ['Kind', 'Value'];
			
			if(state == "intake"){
				/* $('#intakeinfo').html("섭취 정보"); */
			
				$('<tr>').append($('<th width="10%">').html(" "))
						 .append($('<th width="40%">').html("제품명"))
						 .append($('<th width="25%">').html("섭취 칼로리"))
					     .append($('<th width="25%" style="text-decoration: underline;">').html("섭취 갯수"))
					     .appendTo('#intakeTable');
				var cnt = 0;
				$.each(data, function(idx,item){
					cnt +=item.count;
					list[idx+1] = [item.name+' : ' + item.count, item.count* 1];
					$('<tr>').append($('<td>').html(idx+1))
							 .append($('<td>').html(item.name))
							 .append($('<td>').html(item.calory))
							 .append($('<td style="font-weight: bold;">').html(item.count))
							 .appendTo('#intakeTable');
					
				})
				opt = {title : "총 섭취 갯수 :  " + cnt}
				
			}else if(state == "maker"){
				/* $('#intakeinfo').html("섭취 정보"); */
			
				$('<tr>').append($('<th width="10%">').html(" "))
						 .append($('<th width="40%" style="text-decoration: underline;">').html("제조사"))
						 .append($('<th width="25%">').html("섭취 칼로리"))
					     .append($('<th width="25%">').html("섭취 갯수"))
					     .appendTo('#intakeTable');
				var cnt = 0;
				$.each(data, function(idx,item){
					cnt +=item.count;
					list[idx+1] = [item.maker+' : ' + item.count, item.count* 1];
					$('<tr>').append($('<td>').html(idx+1))
							 .append($('<td style="font-weight: bold;">').html(item.maker))
							 .append($('<td>').html(item.calory))
							 .append($('<td>').html(item.count))
							 .appendTo('#intakeTable');
				})
				opt = {title : "총 섭취 갯수 :  " + cnt};
				
			}else{
				/* $('#intakeinfo').html("섭취 정보"); */
			
				$('<tr>').append($('<th width="10%">').html(" "))
						 .append($('<th width="40%">').html("제품명"))
						 .append($('<th width="25%">').html("섭취 갯수"))
					     .append($('<th width="25%" style="text-decoration: underline;">').html("섭취 칼로리"))
					     .appendTo('#intakeTable');
				
				var cnt=0;
				$.each(data, function(idx,item){
					cnt +=item.calory;
					list[idx+1] = [item.name+' : ' + item.calory, item.calory* 1];
					$('<tr>').append($('<td>').html(idx+1))
							 .append($('<td>').html(item.name))
							 .append($('<td>').html(item.count))
							 .append($('<td style="font-weight: bold;">').html(item.calory))
							 .appendTo('#intakeTable');
				})
				opt = {title : "총 칼로리 :  " + cnt}
			}
			
		    google.charts.load('current', {'packages':['corechart']});
		    google.charts.setOnLoadCallback(drawChart);
			
			function drawChart() {
				console.log(list);
		        var data = google.visualization.arrayToDataTable(list);
	
		        var options = opt;
	
		        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
			 	chart.draw(data, options);
			} 
		}
		
	}
	
	//섭취 빼기 요청
	 function bestintakeDel() {
		$('body').on('click', '#btnDel', function(){
			var code = $(this).closest('tr').find('#hidden_code').val();
			var date = $(this).closest('tr').find('#hidden_date').val();
			$.ajax({
				url:'bestintakeDel.food?code='+code + '&date='+date,
				type:'get',
				success: function(){
					bestintakeList(state);
				},
				error : function(xhr, status, msg){
					alert("상태값 : " + status + "http 에러 메세지 : " + msg);
				}
			});
		});
	}
	
	//섭취 추가 요청
	function bestintakeAdd() {
		$('body').on('click', '#btnAdd', function(){
			var code = $(this).closest('tr').find('#hidden_code').val();
			var date = $(this).closest('tr').find('#hidden_date').val();
			$.ajax({
				url:'bestintakeAdd.food?code='+code + '&date='+date,
				type:'get',
				success: function(){
					bestintakeList(state); 
				},
				error : function(xhr, status, msg){
					alert("상태값 : " + status + "http 에러 메세지 : " + msg);
				}
			});
		});
	}
	
	function bestintakeState() {
		$('body').on('click', '.statebtn', function(){
			var val = $(this).val();
			state = val;
			bestintakeList(val);
		});
	}
	
</script>

</body>
</html>
