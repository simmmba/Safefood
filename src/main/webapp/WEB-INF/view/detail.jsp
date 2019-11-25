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
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="css/style.css" rel="stylesheet">
<link href="css/mycss.css" rel="stylesheet">
<style type="text/css">
body {
	background-color: white;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js">
	
	
	
	</script>
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
				<h3>Detail</h3>
			</header>

			<div class="container">
				<div class="box">
					<img id="image" src="${f.img}" alt="" width="200px" height="200px">
					<div class="col-md-12">
						<h3 id="name">${f.name}</h3>
						<hr>
						<h5>원재료</h5>
						<p id="material">${f.material}</p>
						<hr>
						<h5>알레르기</h5>
						<p id="allergy">${a}</p>
						<hr>
						
						<div class="btn-group" role="group">
							<a href="intake.food?code=${f.code}" class="btn btn-primary btn-md active" role="button">추가</a>
							<a href="#" class="btn btn-primary btn-md active" role="button">찜</a>
						</div>
					</div>
				</div>
			</div>

			<div class="container">
				<h3>영양 정보</h3>
				<div class="pie_chart">
					<canvas id="chartcanvas" width="500" height="300"></canvas>
				</div>

				<div>
					<table id="table_nutrition">
						<tbody>
							<tr>
								<td>일일 제공량</td>
								<td id = 'td1'>${f.getSupportpereat()}</td>
							</tr>
							<tr>
								<td style="background-color: #ffe6e6">칼로리</td>
								<td id = 'td2'>${f.getCalory()}</td>
							</tr>
							<tr>
								<td style="background-color: #ffe6cc">탄수화물</td>
								<td id = 'td3'>${f.getCarbo()}</td>
							</tr>
							<tr>
								<td style="background-color: #ffffb3">단백질</td>
								<td id = 'td4'>${f.getProtein()}</td>
							</tr>
							<tr>
								<td style="background-color: #ecffb3">지방</td>
								<td id = 'td5'>${f.getFat()}</td>
							</tr>
							<tr>
								<td style="background-color: #b3ecff">당류</td>
								<td id = 'td6'>${f.getSugar()}</td>
							</tr>
							<tr>
								<td style="background-color: #d9b3ff">나트륨</td>
								<td id = 'td7'>${f.getNatrium()}</td>
							</tr>
							<tr>
								<td style="background-color: #ffb3c6">콜레스테롤</td>
								<td id = 'td8'>${f.getChole()}</td>
							</tr>
							<tr>
								<td style="background-color: #b3ffec">포화 지방산</td>
								<td id = 'td9'>${f.getFattyacid()}</td>
							</tr>
							<tr>
								<td style="background-color: #ffd966">트랜스지방</td>
								<td id = 'td10'>${f.getTransfat()}</td>
							</tr>
						</tbody>
					</table>
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
	
		var canvas = document.getElementById("chartcanvas");
		var context = canvas.getContext("2d");
		var sw = canvas.width;
		var sh = canvas.height;
		var PADDING = 50;
		
		var temp6 = $('#td6').text();
		if (temp6 == 'N/A')temp6 = 0;
		
		var temp8 = $('#td8').text();
		if (temp8 == 'N/A')temp8 = 0;
		
		var temp9 = $('#td9').text();
		if (temp9 == 'N/A')temp9 = 0;
		
		var temp10 = $('#td10').text();
		if (temp10 == 'N/A')temp10 = 0;
		
		var data = [
		$('#td2').text() * 1,
		$('#td3').text() * 1,
		$('#td4').text() * 1,
		$('#td5').text() * 1,
		temp6 * 1,
		$('#td7').text() * 1,
		temp8 * 1,
		temp9 * 1,
		temp10 * 1 ];
		for ( var i in data)
		console.log(data[i]);
		
		var colors=["#ffe6e6","#ffe6cc","#ffffb3","#ecffb3","#b3ecff","#d9b3ff", "#ffb3c6","#b3ffec","#ffd966"];
		
		var center_X = sw / 2;
		var center_Y = sh / 2;
		
		var radius = Math.min(sw- (PADDING * 2), sh- (PADDING * 2)) / 2;
		var angle = 0;
		var total = 0;
		for ( var i in data) {
			total += data[i];
		}
		
		function AddText(context,strN, strR, colors,text_xcoord,text_ycoord) {
			context.textAlign = "left";
			context.fillStyle = colors;
			context.font = "12pt Century Gothic";
			context.fillText(strN,text_xcoord,text_ycoord);
			context.fillText(strR,text_xcoord,text_ycoord + 20);
		};
		
		for (var i = 0; i < data.length; i++) {
		context.fillStyle = colors[i];
		context.beginPath();
		context.moveTo(center_X,center_Y);
		context.arc(center_X,center_Y,radius,angle,angle+ (Math.PI * 2 * (data[i] / total)));
		context.lineTo(center_X,center_Y);
		context.fill();
		angle += Math.PI* 2* (data[i] / total);}
		
	
	</script>
</body>
</html>
