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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<!--==========================
  Header
  ============================-->
	<header id="header">
		<div id="topbar">
			<div class="container">
				<div class="social-links">

					<c:if test="${empty member}">
						<a class="member_join_login" href="joinForm.food" role="button">회원가입</a>
						<a class="member_join_login" href="loginForm.food" role="button">로그인</a>
					</c:if>

					<c:if test="${not empty member}">
						<a class="member_join_login" href="memberinfo.food" role="button">회원정보</a>
						<a class="member_join_login" href="logout.food" role="button">로그아웃</a>
					</c:if>
				</div>
			</div>
		</div>

		<div class="container">

			<div class="logo float-left">
				<!-- Uncomment below if you prefer to use an image logo -->
				<h1>
					<a href="main.food"><img
						src="http://edu.ssafy.com/asset/images/header-logo.jpg" alt="로고"
						height="400"> SAFE FOOD</a>
				</h1>
			</div>

			<nav
				class="main-nav float-right d-none d-lg-block navbar navbar-fixed-top">
				<ul>
					<!-- <li class="active"><a href="#intro">공지 사항</a></li> -->
					<li><a href="notice.food">공지 사항</a></li>
					<li><a href="read.food">상품 정보</a></li>
					<li><a href="#about">베스트 섭취 정보</a></li>
					<li><a href="#portfolio">내 섭취 정보</a></li>
					<li><a href="#team">예상 섭취 정보</a></li>

				</ul>
			</nav>
			<!-- .main-nav -->
		</div>

	</header>
	<!-- #header -->

	<main id="main">
	<section id="services" class="section-bg">
		<div class="container">

			<header class="section-header">
				<h3>Main Page</h3>
			</header>

			<div class="container">
				<div class="col-lg-6">
					<form action="search.food" id="target" class="form-inline">
						<div class="form-group">
							<select class="form-control" id="key" name="key">
								<option value="상품명" selected="selected">상품명</option>
								<option value="제조사">제조사</option>
								<option value="재료명">재료명</option>
								<option value="칼로리">칼로리</option>
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="word" name="word"
								placeholder="검색어를 입력하세요">
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary">검색</button>
						</div>
					</form>
					<!-- /input-group -->
				</div>
				<!-- /.col-lg-6 -->
			</div>



			<div id=div_main class="row">
				<c:forEach items="${list}" var="f">
					<div class="col-md-6 col-lg-4 wow bounceInUp"
						data-wow-duration="1.4s">
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

			<div class = "floating">
				<label>인기 검색어</label>
				<%@ include file="trends.jsp"%>
			</div>

	</section>


	<!-- #services --> <!-- footer start (Add "dark" class to #footer in order to enable dark footer) -->
	<!-- ================ --> <footer id="footer" class="clearfix ">

		<!-- .footer start -->
		<!-- ================ -->
		<div class="footer">
			<div class="container">
				<div class="footer-inner">
					<div class="row">
						<div class="col-lg-10">
							<div class="footer-content">
								<h2 class="title">Find Us</h2>
								<div class="separator-2"></div>
								<ul class="list-icons">
									<li><i class="fa fa-map-marker pr-2 text-default"></i>(SSAFY)
										서울시 강남구 테헤란로 멀티스퀘어</li>
									<li><i class="fa fa-phone pr-2 text-default"></i>
										1544-9001</li>
									<li><a href="#"><i class="fa fa-envelope-o pr-2"></i>admin@ssafy.com</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- .footer end -->

		<!-- .subfooter start -->
		<!-- ================ -->
		<div class="subfooter">
			<div class="container">
				<div class="subfooter-inner">
					<div class="row">
						<div class="col-md-12">
							<p class="text-center">Copyright by SSAFY. All rights
								reserved.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- .subfooter end -->

	</footer> <!-- footer end --> <a href="#" class="back-to-top"><i
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