<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.safe.vo.Food, com.safe.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
  -->
</head>

<body>
	
	<jsp:include page="nav.jsp"></jsp:include>

	<section id="services" class="section-bg">
		<div class="container">
			
			<header class="section-header">
				<h3>회원 가입</h3>
			</header>
			
			<form class="form-horizontal" action="join.food" method="post">
				<div class="form-group has-feedback row">
					<label for="inputName" class="col-md-3 control-label text-md-right col-form-label">아이디
						<span class="text-danger small">*</span>
					</label>
					<div class="col-md-8">
						<input type="text" class="form-control" id="inputName" placeholder="" required name="id">
					</div>
				</div>
				<div class="form-group has-feedback row">
					<label for="inputLastName" class="col-md-3 control-label text-md-right col-form-label">비밀번호
						<span class="text-danger small">*</span>
					</label>
					<div class="col-md-8">
						<input type="password" class="form-control" id="inputLastName"
							placeholder="영문 숫자 포함 6자리 이상" required="required" name="pass">
					</div>
				</div>
				<div class="form-group has-feedback row">
					<label for="inputUserName"
						class="col-md-3 control-label text-md-right col-form-label">이름
						<span class="text-danger small">*</span>
					</label>
					<div class="col-md-8">
						<input type="text" class="form-control" id="inputUserName"
							placeholder="" required="required" name="name">
					</div>
				</div>
				<div class="form-group has-feedback row">
					<label for="inputEmail"
						class="col-md-3 control-label text-md-right col-form-label">주소
						<span class="text-danger small">*</span>
					</label>
					<div class="col-md-8">
						<input type="text" class="form-control" id="inputEmail"
							placeholder="" required="required" name="address">
					</div>
				</div>
				<div class="form-group has-feedback row">
					<label for="inputPassword"
						class="col-md-3 control-label text-md-right col-form-label">전화번호
						<span class="text-danger small">*</span>
					</label>
					<div class="col-md-8">
						<input type="tel" class="form-control" id="inputPassword" pattern="(010)-\d{3,4}-\d{4}"
							placeholder="010-xxxx-xxxx" required="required" name="callnum">
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
								<div class="col-sm-8">
									<div class="form-check form-check-inline">
										<input name="allergy" class="form-check-input"
											id='inlineCheckbox1' type="checkbox" value="대두"> <label
											class="form-check-label" for ='inlineCheckbox1'>대두 </label>
									</div>
									<div class="form-check form-check-inline">
										<input name="allergy" class="form-check-input"
											id='inlineCheckbox2' type="checkbox" value="땅콩"> <label
											class="form-check-label" for ='inlineCheckbox2'>땅콩 </label>
									</div>
									<div class="form-check form-check-inline">
										<input name="allergy" class="form-check-input"
											id='inlineCheckbox3' type="checkbox" value="우유">
											<label class="form-check-label" for ='inlineCheckbox3'>우유 </label>
									</div>
									<div class="form-check form-check-inline">
										<input name="allergy" class="form-check-input"
											id='inlineCheckbox4' type="checkbox" value="게"> <label
											class="form-check-label"for ='inlineCheckbox4'>게</label>
									</div>
									<div class="form-check form-check-inline">
										<input name="allergy" class="form-check-input"
											id='inlineCheckbox5' type="checkbox" value="새우"> <label
											class="form-check-label"for ='inlineCheckbox5'>새우</label>
									</div>
									<div class="form-check form-check-inline">
										<input name="allergy" class="form-check-input"
											id='inlineCheckbox6' type="checkbox" value="참치"> <label
											class="form-check-label" for ='inlineCheckbox6'>참치</label>
									</div>
									<div class="form-check form-check-inline">
										<input name="allergy" class="form-check-input"
											id='inlineCheckbox7' type="checkbox" value="연어"> <label
											class="form-check-label" for ='inlineCheckbox7'>연어</label>
									</div>
									<div class="form-check form-check-inline">
										<input name="allergy" class="form-check-input"
											id='inlineCheckbox8' type="checkbox" value="쑥"> <label
											class="form-check-label" for ='inlineCheckbox8'>쑥 </label>
									</div>
									<div class="form-check form-check-inline">
										<input name="allergy" class="form-check-input"
											id='inlineCheckbox9' type="checkbox" value="소고기"> <label
											class="form-check-label" for ='inlineCheckbox9'>소고기</label>
									</div>
									<div class="form-check form-check-inline">
										<input name="allergy" class="form-check-input"
											id='inlineCheckbox10' type="checkbox" value="닭고기"> <label
											class="form-check-label" for ='inlineCheckbox10'>닭고기 </label>
									</div>
									<div class="form-check form-check-inline">
										<input name="allergy" class="form-check-input"
											id='inlineCheckbox11' type="checkbox" value="돼지고기"> <label
											class="form-check-label" for ='inlineCheckbox11'>돼지고기</label>
									</div>
									<div class="form-check form-check-inline">
										<input name="allergy" class="form-check-input"
											id='inlineCheckbox12' type="checkbox" value="복숭아"> <label
											class="form-check-label" for ='inlineCheckbox12'>복숭아 </label>
									</div>
									<div class="form-check form-check-inline">
										<input name="allergy" class="form-check-input"
											id='inlineCheckbox13' type="checkbox" value="민들레"> <label
											class="form-check-label" for ='inlineCheckbox13'>민들레</label>
									</div>
	
									<div class="form-check form-check-inline">
										<input name="allergy" class="form-check-input"
											id='inlineCheckbox14' type="checkbox" value="계란흰자"> <label
											class="form-check-label" for ='inlineCheckbox14'>계란흰자 </label>
									</div>
								</div>
							</div>
						</fieldset>
					</div>
				</div>
				<div class="form-group row">
					<div class="ml-md-auto col-md-9">
						<button type="submit" class="btn btn-secondary">
							등록 &nbsp;&nbsp;<i class="fa fa-check"></i>
						</button>
					</div>
				</div>
			</form>

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
