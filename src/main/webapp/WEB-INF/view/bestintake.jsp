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
				<h3>베스트 섭취 정보</h3>
			</header>

			<div class="container">
				<button class="btn btn-warning statebtn" value = "intake">섭취량</button>
				<button class="btn btn-success statebtn" value = "maker">제조사</button>
				<button class="btn btn-primary statebtn" value = "calory">칼로리</button>
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
				$('#intakeinfo').html("섭취 정보");
			
				$('<tr>').append($('<th>').html("순위"))
						 .append($('<th>').html("제품명"))
						 .append($('<th>').html("섭취 칼로리"))
					     .append($('<th>').html("섭취량"))
					     .appendTo('#intakeTable');
				var cnt = 0;
				$.each(data, function(idx,item){
					cnt +=item.count;
					list[idx+1] = [item.name+' : ' + item.count, item.count* 1];
					$('<tr>').append($('<td>').html(idx+1))
							 .append($('<td>').html(item.name))
							 .append($('<td>').html(item.calory))
							 .append($('<td>').html(item.count))
							 .appendTo('#intakeTable');
					
				})
				opt = {title : "총 섭취량 :  " + cnt}
				
			}else if(state == "maker"){
				$('#intakeinfo').html("섭취 정보");
			
				$('<tr>').append($('<th>').html("순위"))
						 .append($('<th>').html("제조사"))
						 .append($('<th>').html("섭취 칼로리"))
					     .append($('<th>').html("섭취량"))
					     .appendTo('#intakeTable');
				var cnt = 0;
				$.each(data, function(idx,item){
					cnt +=item.count;
					list[idx+1] = [item.maker+' : ' + item.count, item.count* 1];
					$('<tr>').append($('<td>').html(idx+1))
							 .append($('<td>').html(item.maker))
							 .append($('<td>').html(item.calory))
							 .append($('<td>').html(item.count))
							 .appendTo('#intakeTable');
				})
				opt = {title : "총 섭취량 :  " + cnt};
				
			}else{
				$('#intakeinfo').html("섭취 정보");
			
				$('<tr>').append($('<th>').html("순위"))
						 .append($('<th>').html("제품명"))
						 .append($('<th>').html("섭취량"))
					     .append($('<th>').html("섭취 칼로리"))
					     .appendTo('#intakeTable');
				
				var cnt=0;
				$.each(data, function(idx,item){
					cnt +=item.calory;
					list[idx+1] = [item.name+' : ' + item.calory, item.calory* 1];
					$('<tr>').append($('<td>').html(idx+1))
							 .append($('<td>').html(item.name))
							 .append($('<td>').html(item.count))
							 .append($('<td>').html(item.calory))
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
