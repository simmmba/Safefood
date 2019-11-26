<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.safe.vo.Food, com.safe.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,500,600,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">

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
.jumbotron {
	width: 100%;
	height: 350px;
	background-image: url("https://cdn.pixabay.com/photo/2017/01/26/02/06/platter-2009590_960_720.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	color: white;
}
</style>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	
	<section id="services" class="section-bg">
		<div class="container">
			<header class="section-header">
				<div class="jumbotron">
					<div class="container text-center">
						<br><br>
						<h1><b>WHAT WE PROVIDE</b></h1>
						<br>
						<p style="color:white;">건강한 삶을 위한 먹거리 프로젝트</p>
					</div>
				</div>
			</header>

			<div class="container">
				<div class="col-lg-6 search_input">
					<form action="search.food" id="target" class="form-inline">
						<div class="form-group">
							<select class="form-control" id="key" name="key">
								<option value="상품명" selected="selected">상품명</option>
								<option value="제조사">제조사</option>
								<option value="재료명">재료명</option>
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="word" name="word"
								placeholder="검색어를 입력하세요">
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-secondary">검색</button>
						</div>
					</form>
					<!-- /input-group -->
				</div>
				<!-- /.col-lg-6 -->
			</div>

			<div id=div_main class="row">
				<c:forEach items="${list}" var="f">
					<div class="col-md-6 col-lg-4 wow bounceInUp"
						data-wow-duration="1.4s" onclick="location.href='detail.food?code=${f.code}';">
						<div class="box">
							<div>
								<img src="${f.getImg()}" alt="로고" height="200">
							</div>
							<p></p>
							<h4 class="title">
								<a href="detail.food?code=${f.getCode()}">${f.getName()}</a>
							</h4>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>

	</section>
	
	<%-- <div class = "floating">
		<label>인기 검색어</label>
		<%@ include file="trends.jsp"%>
	</div>  --%>
	<jsp:include page="trends.jsp"></jsp:include>

	<jsp:include page="footer.jsp"></jsp:include>

	<a href="#" class="back-to-top"><i
		class="fa fa-chevron-up"></i></a> <!-- Uncomment below i you want to use a preloader -->
	<!-- <div id="preloader"></div> --> <!-- JavaScript Libraries --> <script
		src="lib/jquery/jquery.min.js"></script> <script
		src="lib/jquery/jquery-migrate.min.js"></script> <script
		src="lib/bootstrap/js/bootstrap.bundle.min.js"></script> <script
		src="lib/easing/easing.min.js"></script> <script
		src="lib/mobile-nav/mobile-nav.js"></script> <script
		src="lib/wow/wow.min.js"></script> <script
		src="lib/waypoints/waypoints.min.js"></script> <script
		src="lib/counterup/counterup.min.js"></script> <script
		src="lib/owlcarousel/owl.carousel.min.js"></script> <script
		src="lib/isotope/isotope.pkgd.min.js"></script> <script
		src="lib/lightbox/js/lightbox.min.js"></script> <!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script> <!-- Template Main Javascript File -->
	<script src="js/main.js"></script>
</body>
</html>