<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="com.safe.vo.Member" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<title>Personal information</title>
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

<!-- bootswatch lib -->
<!-- <link rel="stylesheet"
	href="https://bootswatch.com/4/minty/bootstrap.css" media="screen">
<link rel="stylesheet"
	href="https://bootswatch.com/_assets/css/custom.min.css"> -->

<!-- Main Stylesheet File -->
<link href="css/style.css" rel="stylesheet">
<link href="css/mycss.css" rel="stylesheet">
<style type="text/css">
body {
	background-color: white;
}
.t th{
	text-align: right;
	color: gray;
}
.t td{
	padding-left: 50px;
	color: gray;
}
</style>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>
	
	<section id="services" class="section-bg">
		<div class="container">
			<header class="section-header">
				<h3>회원정보</h3>
			</header>
		</div>
		<div class="container">
			<center>
				<table class="t table table-hover" style="width: 50%">
					<tr>
						<th>ID</th>
						<td>${member.id }</td>
					</tr>
					<tr>
						<th>name</th>
						<td>${member.name }</td>
					</tr>
					<tr>
						<th>address</th>
						<td>${member.address }</td>
					</tr>
					<tr>
						<th>phone</th>
						<td>${member.callnum}</td>
					</tr>
					<tr>
						<th>allergy</th>
						<td>${member.allergy}</td>
					</tr>
				</table>
			</center>
		</div>
		<div id="button_" class="container">
			<button type="button" class="btn btn-secondary" 
				onclick="location.href='editForm.food'"><i class="fa fa-paperclip"></i>&nbsp;&nbsp;수정</button>
			<button type="button" class="btn btn-secondary"
				onclick="location.href='quitConfirm.food?id=${member.id}'"><i class="fa fa-times-circle"></i>&nbsp;&nbsp;탈퇴</button>
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

</body>
</html>