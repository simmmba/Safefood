<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.safe.vo.Food, com.safe.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Food List</title>
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
</head>

<body>

	<jsp:include page="nav.jsp"></jsp:include>

	<section id="services" class="section-bg">
		<div class="container">

			<header class="section-header">
				<h3>전체 식품 목록</h3>
			</header>

			<div class="container">
					<form action="searchRead.food" id="target" class="form-inline">
						<div class="form-group">
							<select class="form-control" id="key" name="key">
								<option value="" selected="selected">--선택--</option>
								<option value="상품명">상품명</option>
								<option value="제조사">제조사</option>
								<option value="재료명">재료명</option>
								<option value="칼로리">칼로리 계산</option>
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="word" name="word"
								placeholder="검색어를 입력하세요">
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-secondary">검색</button>
							<span class = "warning_span">* 식품에 포함된 회원님의 알레르기 정보입니다.</span>
						</div>
					</form>
			</div>

			<div id=div_main class="row">
				<c:forEach items="${list}" var="f">
					<div class='col-md-6 col-lg-6 wow bounceInUp'
						data-wow-duration='1.4s' id="item_data" class="row"
						onclick="location.href='detail.food?code=${f.code}';">
						<div class='box'>
							<div class='div_image'>
								<img class='item_image' src="${f.getImg()}" height="200px"
									style="position: absoulte; width: 100%; height: 100%;">
							</div>

							<div class='div_info'>
								<span class='title'>${f.getName()}</span>
								<hr>
								<span class ='info_span'><b>제조사 :    </b> ${f.getMaker()}</span><br> 
								<span class ='info_span'><b>1회 제공량 :   </b> ${f.supportpereat} g</span><br>
								<span class ='info_span'><b>칼로리 :    </b> ${f.calory} kcal</span><br>
								
								<hr>
								<c:if test="${not empty member}">
									<div>
										<span class="allergyinfo"> <c:forTokens
												var="ma" items="${member.allergy}" delims=",">
												<c:forTokens var="fa" items="${f.allergy}" delims=",">
													<c:if test="${ma == fa}">${fa}</c:if>
												</c:forTokens>
											</c:forTokens>
										</span>
									</div>
								</c:if>

							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<jsp:include page="trends.jsp"></jsp:include>

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

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>
	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>
	<!--검색 -->

</body>
</html>
