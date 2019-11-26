<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.safe.vo.Food, com.safe.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Notice</title>
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
	table {
		width: 100%;
		text-align: center;
	}
	.tt tr:nth-child(odd) { 
		background-color: #ece6df; 
	}
	.tt tr:nth-child(even) { 
		background-color: #dbcdc1; 
	}
	.tt td { 
		padding: 5px;
		border-radius: 10px;
	}
	.tt th { 
		padding: 10px;
		border-radius: 10px;
	}
	.tt tr:nth-child(1) { 
		background-color: #ac8d71;
		color: white; 
	}
</style>
</head>

<body>
	<jsp:include page="nav.jsp"></jsp:include>

	<section id="services" class="section-bg">
		<div class="container">

			<header class="section-header">
				<h3>공지사항</h3>
			</header>
			<div class="container">
				<div class="col-lg-6">
					<form action="noticeSearch.food" id="target" class="form-inline">
						<div class="form-group">
							<select class="form-control" id="key" name="condition">
								<option value="제목" selected="selected">제목</option>
								<option value="작성자">작성자</option>
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
			<br>
			<center>
				<table class="tt">
<!-- 				<table class="tt table-hover"> -->
					<tr>
						<th width="7%">번호</th>
						<th width="50%">제목</th>
						<th width="20%">작성자</th>
						<th width="15%">등록일</th>
						<th width="8%">조회수</th>
					</tr>
					<c:forEach items="${list}" var="b">
						<tr>
							<td>${b.getNum()}</td>
							<td><a href='noticeRead.food?num=${b.getNum()}'>${b.getTitle()}</a></td>
							<td>${b.getName()}</td>
							<td>${b.getWdate()}</td>
							<td>${b.getCount()}</td>
						</tr>
						
						<%--
						<div id="item_data" class="row"  style=" cursor: pointer;" onclick="location.href='noticeRead.food?num=${b.getNum()}';">
							<div class='col-md-6 col-lg-12 wow' data-wow-duration='1.4s'>
								<div class='box'>
									<div>
										<span class='title'> 
											<a href='noticeRead.food?num=${b.getNum()}'> ${b.getNum()}</a>
										</span>
									</div>
		
									<div class='div_info div_notice' style="padding-left: 0px;">
										<span>제목 : ${b.getTitle()}</span>
										<hr>
										<span>작성일 : ${b.getWdate()}</span>
										<hr>
										<span>작성자 : ${b.getName()}</span>
										<hr>
									</div>
								</div>
							</div>
						</div>
						--%>
					</c:forEach>
				</table>
				<!-- <div class="text-center">
					<ul class="pagination">
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
					</ul>
				</div> -->
			</center>
			<br>
			<c:if test="${not empty member}">
				<center>
					<button type="button" class="btn btn-secondary" onclick = "location.href = 'noticeInsertForm.food'" >작성</button>
				</center>
			</c:if>
		
		</div>
	</section>
	
	<jsp:include page="trends.jsp"></jsp:include>
	
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

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>
	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>
	<!--검색 -->

</body>
</html>
