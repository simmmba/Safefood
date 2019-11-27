<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="com.safe.vo.Member" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Rapid Bootstrap Template</title>
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
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

부가적인 테마
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> -->
</head>

<body>
	
	<jsp:include page="nav.jsp"></jsp:include>

	<section id="services" class="section-bg">
		<div class="container">
			<header class="section-header">
				<h3>공지 사항 수정</h3>
				<form class="form-horizontal" action="noticeEdit.food" method="post">
					<div class="form-group has-feedback row">
						<label for="inputName"
							class="col-md-3 control-label text-md-right col-form-label">제목
							<span class="text-danger small">*</span>
						</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="inputName"
								placeholder="" required name="title" value = "${b.title}">
								<!-- <i class="fa fa-pencil form-control-feedback pr-4"></i> -->
						</div>
					</div>

					
					<div class="form-group has-feedback row">
						<label 
							class="col-md-3 control-label text-md-right col-form-label">내용
							<span class="text-danger small">*</span>
						</label>
						<div class="col-md-8">
							<textarea cols = "50" rows = "10" class="form-control" required="required" name="content" >${b.content}</textarea> 
							<input type="hidden" name = "num" value = "${b.num}">
						</div>
					</div>
					
					
					<div class="form-group row">
						<div class="ml-md-auto col-md-9">
							<button type="submit" class="btn btn-secondary">
								등록 <i class="fa fa-check"></i>
							</button>
						</div>
					</div>
				</form>
			</header>

			<div class="row"></div>

		</div>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- #services -->
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
