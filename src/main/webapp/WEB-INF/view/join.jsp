<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
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
					<a class="member_join_login" href="joinForm.food" role="button">회원가입</a>
					<a class="member_join_login" href="loginForm.food" role="button">로그인</a>
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

			<nav class="main-nav float-right d-none d-lg-block">
				<ul>
					<li class="active"><a href="#intro">공지 사항</a></li>
					<li><a href="#about">상품 정보</a></li>
					<li><a href="#services">베스트 섭취 정보</a></li>
					<li><a href="#portfolio">내 섭취 정보</a></li>
					<li><a href="#team">예상 섭취 정보</a></li>

				</ul>
			</nav>
			<!-- .main-nav -->
		</div>

	</header>
	<!-- #header -->

	<section id="services" class="section-bg">
		<div class="container">
			
			<header class="section-header">
				<h3>회원 가입</h3>
				<form class="form-horizontal" action="join.food" method="post">
					<div class="form-group has-feedback row">
						<label for="inputName"
							class="col-md-3 control-label text-md-right col-form-label">아이디
							<span class="text-danger small">*</span>
						</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="inputName"
								placeholder="" required name="id"> <i
								class="fa fa-pencil form-control-feedback pr-4"></i>
						</div>
					</div>
					<div class="form-group has-feedback row">
						<label for="inputLastName"
							class="col-md-3 control-label text-md-right col-form-label">비밀번호
							<span class="text-danger small">*</span>
						</label>
						<div class="col-md-8">
							<input type="password" class="form-control" id="inputLastName"
								placeholder="영문 숫자 포함 6자리 이상" required="required" name="pass"> <i
								class="fa fa-pencil form-control-feedback pr-4"></i>
						</div>
					</div>
					<div class="form-group has-feedback row">
						<label for="inputUserName"
							class="col-md-3 control-label text-md-right col-form-label">이름
							<span class="text-danger small">*</span>
						</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="inputUserName"
								placeholder="User Name" required="required" name="name"> <i
								class="fa fa-user form-control-feedback pr-4"></i>
						</div>
					</div>
					<div class="form-group has-feedback row">
						<label for="inputEmail"
							class="col-md-3 control-label text-md-right col-form-label">주소
							<span class="text-danger small">*</span>
						</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="inputEmail"
								placeholder="address" required="required" name="address"> <i
								class="fa fa-envelope form-control-feedback pr-4"></i>
						</div>
					</div>
					<div class="form-group has-feedback row">
						<label for="inputPassword"
							class="col-md-3 control-label text-md-right col-form-label">전화번호
							<span class="text-danger small">*</span>
						</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="inputPassword"
								placeholder="010-xxx-xxxx" required="required" name="callnum"> <i
								class="fa fa-lock form-control-feedback pr-4"></i>
						</div>
					</div>
					<div class="form-group has-feedback row">
						<label for="inputPassword"
							class="col-md-3 control-label text-md-right col-form-label">알레르기
							<span class="text-danger small">*</span>
						</label>
						<div class="col-md-8">
							<fieldset class="form-group">
								<div class="row">
									<div class="col-sm-4">
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input"
												id='inlineCheckbox2' type="checkbox" value="대두"> <label
												class="form-check-label">대두 </label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input"
												id='inlineCheckbox2' type="checkbox" value="땅콩"> <label
												class="form-check-label">땅콩 </label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input"
												id='inlineCheckbox2' type="checkbox" value="우유"> <label
												class="form-check-label">우유 </label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input"
												id='inlineCheckbox2' type="checkbox" value="게"> <label
												class="form-check-label">게</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input"
												id='inlineCheckbox2' type="checkbox" value="새우"> <label
												class="form-check-label">새우</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input"
												id='inlineCheckbox2' type="checkbox" value="참치"> <label
												class="form-check-label">참치</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input"
												id='inlineCheckbox2' type="checkbox" value="연어"> <label
												class="form-check-label">연어</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input"
												id='inlineCheckbox2' type="checkbox" value="쑥"> <label
												class="form-check-label">쑥 </label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input"
												id='inlineCheckbox2' type="checkbox" value="소고기"> <label
												class="form-check-label">소고기</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input"
												id='inlineCheckbox2' type="checkbox" value="닭고기"> <label
												class="form-check-label">닭고기 </label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input"
												id='inlineCheckbox2' type="checkbox" value="돼지고기"> <label
												class="form-check-label">돼지고기</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input"
												id='inlineCheckbox2' type="checkbox" value="복숭아"> <label
												class="form-check-label">복숭아 </label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input"
												id='inlineCheckbox2' type="checkbox" value="민들레"> <label
												class="form-check-label">민들레</label>
										</div>

										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input"
												id='inlineCheckbox2' type="checkbox" value="계란흰자"> <label
												class="form-check-label">계란흰자 </label>
										</div>
									</div>
								</div>
							</fieldset>
						</div>
					</div>
					<div class="form-group row">
						<div class="ml-md-auto col-md-9">
							<button type="submit"
								class="btn btn-group btn-default btn-animated">
								등록 <i class="fa fa-check"></i>
							</button>
						</div>
					</div>
				</form>
			</header>

			<div class="row"></div>

		</div>
	</section>
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
