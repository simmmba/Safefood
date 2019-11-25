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
<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="css/style.css" rel="stylesheet">

<link href="css/mycss.css" rel="stylesheet">

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
	<jsp:include page="nav.jsp"></jsp:include>

	<section id="services" class="section-bg">
		<div class="container">

			<header class="section-header">
				<h3>Notice</h3>
			</header>
			<table id = "intakeTable">
				<%-- <c:forEach items="${list}" var="i">
					<tr>
						<td>${i.code}</td>
						<td>${i.count}</td>
					</tr>
				</c:forEach> --%>
			</table>
		</div>
	</section>
	
	<div class = "floating">
		<label>인기 검색어</label>
		<%@ include file="trends.jsp"%>
	</div>
	
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
	
	<script type="text/javascript">
	$(document).ready(function(){
 		intakeList();
 		intakeDel();
 		intakeAdd();
	});
	 
	//모든 사용자 목록 조회 요청

	
	//사용자 조회 요청
	function intake() {
		// $(부모).on('click', 자식, function(){})
		$('body').on('click', '#intakebtn', function(){
			var code = $(this).val();
			//ajax 요청
			$.ajax({
				url:'intake.food?code='+code,
				type:'get',
				success:function(){
					alert("내 섭취 정보에 추가했습니다.")
				},
				error : function(xhr, status, msg){
					alert("상태값 : " + status + "http 에러 메세지 : " + msg);
				}
			});
		}); 
	}//customerSelect
	
	//모든 사용자 목록 조회 요청
	function intakeList() {//REST 서버에 모든 고객정보 ajax 요청 보내기
			$.ajax({
				url : 'myintake.food',
				type : 'get',
				dataType : 'json', //서버가 보내주는 데이터 타입
				success : function(data){
					intakeListResult(data);
				},
				error : function(xhr, status, msg){
					alert("상태값 : " + status + "http 에러 메세지 : " + msg);
				}
				
			});
	}//customerList
	
	function intakeListResult(data){
		$('#intakeTable').empty();
		$('<tr>').append($('<th>').html("제품명"))
			   .append($('<th>').html("섭취 갯수"))
			   .appendTo('#intakeTable');
		
		$.each(data, function(idx,item){
			$('<tr>').append($('<td>').html(item.name))
					 .append($('<td>').html(item.count))
					 .append($('<td>').html('<button id = "btnAdd">더하기</buttton>'))
					 .append($('<td>').html('<button id = "btnDel">빼기</buttton>'))
					 .append($('<input type="hidden" id ="hidden_ino">').val(item.ino))
					 .appendTo('#intakeTable');
		});
	}
	
	//섭취 빼기 요청
	 function intakeDel() {
		$('body').on('click', '#btnDel', function(){
			var ino = $(this).closest('tr').find('#hidden_ino').val();
			$.ajax({
				url:'intakeDel.food?ino='+ino,
				type:'get',
				success: function(){
					intakeList();
				},
				error : function(xhr, status, msg){
					alert("상태값 : " + status + "http 에러 메세지 : " + msg);
				}
			});
		});
	}
	
	//섭취 추가 요청
	 function intakeAdd() {
		$('body').on('click', '#btnAdd', function(){
			var ino = $(this).closest('tr').find('#hidden_ino').val();
			$.ajax({
				url:'intakeAdd.food?ino='+ino,
				type:'get',
				success: function(){
					intakeList();
				},
				error : function(xhr, status, msg){
					alert("상태값 : " + status + "http 에러 메세지 : " + msg);
				}
			});
		});
	}//customerDelete
	

	

	
</script>

</body>
</html>