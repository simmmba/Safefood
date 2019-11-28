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
		border: solid #85684b 2px;
	}
	.it td{
		text-align: center;
		padding: 8px;
	}
	.it th{
		text-align: center;
		padding: 12px;
		font-size: 17px;
		/* background-color: #000; */
	}
	.it tr { 
		background-color: #fff;
		color: #85684b; 
	}
	.it tr:nth-child(1) { 
		background-color: #85684b;
		color: white; 
	}
	.it td:nth-child(1){
		text-align: left;
		padding: 8px;
		padding-left: 40px;
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
				<h3>예상 섭취 정보</h3>
			</header>
			<center>
				<div class="container" style="background-color: white; border-radius: 2em;">
					<br><br><br>
					<div class="btn-group" >
						<button id = "intakebtn" class="button">섭취하기</button>
					</div>
					<br><br>
					<table id = "intakeTable" class="it" border="1"></table>
					<div id = "nothing"></div>
					<br>
					<!-- <h5 id = "intakeinfo"><b>영양 정보</b></h5> -->
					<!-- <h5 id = "intakeinfo"></h5> -->
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
	
	$(document).ready(function(){
		expectedintakeList();
		expectedintakeRemove()
		expectedintakeDel();
		expectedintakeAdd();
		dointake()
	});
	 

	

	//모든 사용자 목록 조회 요청
	function expectedintakeList() {//REST 서버에 모든 고객정보 ajax 요청 보내기
			$.ajax({
				url : 'expectedIntakeList.food',
				type : 'get',
				dataType : 'json', //서버가 보내주는 데이터 타입
				success : function(data){
					expectedintakeListResult(data);
				},
				error : function(xhr, status, msg){
					alert("상태값 : " + status + "http 에러 메세지 : " + msg);
				}
				
			});
	}
	
	function expectedintakeListResult(data){
		$('#intakeTable').empty();
		$('#piechart').empty();
		$('#intakeinfo').empty();
		$("#intakebtn").hide();
		
		
		if(data == ""){
			$('<h2>').html("예상 섭취 정보가 없습니다.")
					 .appendTo('#nothing');
		
		}else{
			/* $('#intakeinfo').html("영양정보"); */
			$("#intakebtn").show();
		
			$('<tr>').append($('<th width="45%">').html("제품명"))
					 .append($('<th width="15%">').html("예상 칼로리"))
				     .append($('<th width="20%">').html("담은 갯수"))
				     /* .append($('<th width="10%" style="background-color: white;">').html(" ")) */
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
				$('<tr>').append($('<td>').html('<img id="image" src="' + item.img + '" alt="" width="50px" height="50px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + item.name))
						 .append($('<td>').html(item.calory))
						 .append($('<td>').html('<button class="btn btn-default" id = "btnDel">&nbsp;&nbsp;<i class="fa fa-minus pr-2 text-default"></i></button>' 
							 							+ '<span style="width: 20px; display: inline-block;">' + item.count + '</span>'
							 							+ '<button class="btn btn-default" id = "btnAdd">&nbsp;&nbsp;<i class="fa fa-plus pr-2 text-default"></i></button>'))
 						 /* .append($('<td style="background-color: white;">').html('<button class="btn btn-default" id="btnRemove">&nbsp;<i class="fa fa-trash pr-2 text-default"></i></buttton>')) */
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
		          title: '예상 섭취 칼로리(cal) : ' + temp2
		        };
	
		        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
			 		chart.draw(data, options);
				}
		}
	}
	
	//섭취 삭제 요청
	 function expectedintakeRemove() {
		$('body').on('click', '#btnRemove', function(){
			var code = $(this).closest('tr').find('#hidden_code').val();
			$.ajax({
				url:'expectedintakeRemove.food?code='+code,
				type:'get',
				success: function(){
					expectedintakeList();
				},
				error : function(xhr, status, msg){
					alert("상태값 : " + status + "http 에러 메세지 : " + msg);
				}
			});
		});
	}
	//섭취 빼기 요청
	 function expectedintakeDel() {
		$('body').on('click', '#btnDel', function(){
			var code = $(this).closest('tr').find('#hidden_code').val();
			$.ajax({
				url:'expectedintakeDel.food?code='+code,
				type:'get',
				success: function(){
					expectedintakeList();
				},
				error : function(xhr, status, msg){
					alert("상태값 : " + status + "http 에러 메세지 : " + msg);
				}
			});
		});
	}
	
	//섭취 추가 요청
	function expectedintakeAdd() {
		$('body').on('click', '#btnAdd', function(){
			var code = $(this).closest('tr').find('#hidden_code').val();
			$.ajax({
				url:'expectedintakeAdd.food?code='+code,
				type:'get',
				success: function(){
					expectedintakeList(); 
				},
				error : function(xhr, status, msg){
					alert("상태값 : " + status + "http 에러 메세지 : " + msg);
				}
			});
		});
	}
	//섭취
	function dointake() {
		$('body').on('click', '#intakebtn', function(){
			$.ajax({
				url:'dointake.food',
				type:'get',
				success: function(){
					alert("내 섭취 정보에 추가했습니다.")
					expectedintakeList(); 
				},
				error : function(xhr, status, msg){
					alert("상태값 : " + status + "http 에러 메세지 : " + msg);
				}
			});
		});
	}
	


	

	
</script>

</body>
</html>
