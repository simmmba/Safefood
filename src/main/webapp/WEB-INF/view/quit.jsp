<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,500,600,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

  <!-- bootswatch lib -->
  <link rel="stylesheet" href="https://bootswatch.com/4/minty/bootstrap.css" media="screen">
  <link rel="stylesheet" href="https://bootswatch.com/_assets/css/custom.min.css">
  
  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">
  <link href="css/mycss.css" rel="stylesheet">
  <style type="text/css">
  body{
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

  <header id="header">
    <div id="topbar">
			<div class="container">
				<div class="social-links">
					<a class="member_join_login" href="memberinfo.food" role="button">회원정보</a>
					<a class="member_join_login" href="logout.food" role="button">logout</a>
				</div>
			</div>
		</div>

    <div class="container">

      <div class="logo float-left">
        <!-- Uncomment below if you prefer to use an image logo -->
        			<h1><a href="main.food"><img
					src="http://edu.ssafy.com/asset/images/header-logo.jpg" alt="로고"
					height="400"> SAFE FOOD</a></h1>
        <!-- <a href="#header" class="scrollto"><img src="img/logo.png" alt="" class="img-fluid"></a> -->
      </div>

      <nav class="main-nav float-right d-none d-lg-block navbar navbar-fixed-top">
        <ul>
          <li><a href="notice.food">공지 사항</a></li>
          <li><a href="read.food">상품 정보</a></li>
          <li><a href="#about">베스트 섭취 정보</a></li>
          <li><a href="#portfolio">내 섭취 정보</a></li>
          <li><a href="#team">예상 섭취 정보</a></li>

        </ul>
      </nav><!-- .main-nav -->
      </div>
    
  </header><!-- #header -->
  <section id="services" class="section-bg">
  
  	  <blockquote class="blockquote container">
		  <p class="mb-0">정말 탈퇴하시겠습니까?</p>
		  <footer class="blockquote-footer"> 회원 정보는 삭제됩니다.</footer>
	  </blockquote>
	  <div class="container">

	  <div>
		<button type="button" class="btn btn-danger" onclick="location.href='quit.food?id=${id}'">확인</button>
		<button type="button" class="btn btn-outline-danger"  onclick="location.href='memberinfo.food'">취소</button>
  	  </div>
	  </div>
	  
  </section>
  
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