<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.safe.vo.Food, com.safe.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Main Page</title>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!-- pie chart -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>

<body>
	
	<jsp:include page="nav.jsp"></jsp:include>

	<section id="services" class="section-bg">
		<div class="container">

			<header class="section-header">
				<h3>식품 상세 정보</h3>
			</header>

			<div class="container">
				<div class="box">
					<br>
					<img id="image" src="${f.img}" alt="" width="200px" height="200px">
					<div class="col-md-12">
						<h3><b>${f.name}</b></h3>
						<div class="btn-group" role="group">
							<button class="btn btn-secondary btn-md active" role="button" id="intakebtn" value = "${f.code}">추가&nbsp;&nbsp;&nbsp;<i class="fa fa-plus pr-2 text-default"></i></button>
							<button class="btn btn-secondary btn-md active" role="button" id = "expectedintakebtn" value = "${f.code}">찜&nbsp;&nbsp;&nbsp;<i class="fa fa-cart-plus pr-2 text-default"></i></button>
						</div>
						<br>
						<br>
						<hr>
						<h5><b>원재료</b></h5>
						<p id="material">${f.material}</p>
						<hr>
						<c:if test="${a != ''}">
							<h5><b>알레르기</b></h5>
							<p id="allergy">${a}</p>
							<hr>
						</c:if>
							
						<h5><b>영양 정보</b></h5>
						<center>
							<div id="piechart" style="width: 900px; height: 500px;"></div>
						</center>
					</div>
				</div>
			</div>
		</div>
	</section>
		
	
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
	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>
	<script type="text/javascript">
	    google.charts.load('current', {'packages':['corechart']});
	    google.charts.setOnLoadCallback(drawChart);
	
	    var temp3 = ${f.getCarbo()};
		if (temp3 == 'N/A')temp3 = 0;
		
		var temp4 = ${f.getProtein()};
		if (temp4 == 'N/A')temp4 = 0;
		
		var temp5 = ${f.getFat()};
		if (temp5 == 'N/A')temp5 = 0;
		
		var temp6 = ${f.getSugar()};
		if (temp6 == 'N/A')temp6 = 0;
		
		var temp7 = ${f.getNatrium()};
		if (temp7 == 'N/A')temp7 = 0;
		
		var temp8 = ${f.getChole()};
		if (temp8 == 'N/A')temp8 = 0;
		
		var temp9 = ${f.getFattyacid()};
		if (temp9 == 'N/A')temp9 = 0;
		
		var temp10 = ${f.getTransfat()};
		if (temp10 == 'N/A')temp10 = 0;
		
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
	          title: '일일 제공량 : ' + ${f.getSupportpereat()} + '\n칼로리 : ' + ${f.getCalory()}
	        };
	
	        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
	
		 	chart.draw(data, options);
      	}
    </script>
	

<script type="text/javascript">
	$(document).ready(function(){

 		intake();
 		expectedintake();
	});

	
	//섭취요청
	function intake() {

		$('body').on('click', '#intakebtn', function(){
			var code = $(this).val();
			//ajax 요청
			$.ajax({
				url:'intake.food?code='+code,
				type:'get',
				success:function(){
					alert("내 섭취 정보에 추가했습니다.")
				},
				error : function(xhr, status, msg){
					alert("상태값 : " + status + "http 에러 메세지 : " + msg);
				}
			});
		}); 
	}
	//예상 섭취 정보 추가
	function expectedintake() {
		$('body').on('click', '#expectedintakebtn', function(){
			var code = $(this).val();
			//ajax 요청
			$.ajax({
				url:'expectedintake.food?code='+code,
				type:'get',
				success:function(){
					alert("예상 섭취 정보에 추가했습니다.")
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
