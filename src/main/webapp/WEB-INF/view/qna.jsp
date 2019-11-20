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
</style>
<!-- =======================================================
    Theme Name: Rapid
    Theme URL: https://bootstrapmade.com/rapid-multipurpose-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
    <!-- vue 추가 -->
	<script src="https://unpkg.com/vue"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
					<li class="active"><a href="notice.food">공지 사항</a></li>
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


	<section id="services" class="section-bg">


		<header class="section-header">
			<h3>Notice</h3>
		</header>
		<div class="container">


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
							<button type="submit" class="btn btn-primary">검색</button>
							<span style="float: right"><button type="button"
									class="btn btn-primary"
									onclick="location.href = 'noticeInsertForm.food'">작성</button></span>
						</div>
					</form>
					<!-- /input-group -->
				</div>
				<!-- /.col-lg-6 -->
			</div>
			
			<div id = "app">
				<component v-bind:is = "currentview"></component>  
			
			
			</div>


		</div>


	</section>

	<div class="floating">
		<label>인기 검색어</label>
		<%@ include file="trends.jsp"%>
	</div>
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


	<script type="text/x-template" id="listQuestiontemplate">
		<div>	
		<div v-for="q in info" @click ="show_detail(q.num)" >
			<div class='col-md-6 col-lg-12 wow' data-wow-duration='1.4s'>
				<div class='box'>
					<div>
						<span class='title'> 
							{{q.num}}
						</span>
					</div>
						<div class='div_info div_notice' style="padding-left: 0px;">
						<span>제목 : {{q.title}}</span>
						<hr>
						<span>작성일 : {{q.wdate}}</span>
						<hr>
						<span>작성자 : {{q.name}}</span>
						<hr>
					</div>
				</div>
			</div>
		</div>
		</div>
	</script>
	
	<script type="text/x-template" id="detailQuestiontemplate">
		<div class="container">
			<table class="table table-hover">
				<tbody>
					<tr>
						<th scope="row">제목</th>
						<td>{{question.title}}</td>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td>{{question.name}}</td>
					</tr>
					<tr>
						<th scope="row">작성일</th>
						<td>${question.wdate}</td>
					</tr>

					<tr>
						<th scope="row">조회수</th>
						<td>${question.count}</td>
					</tr>

					<tr>
						<td colspan="2">${question.content}</td>
					</tr>

				</tbody>
			</table>
		</div>
	</script>
	
	
	
	
	
	<script>
		//목록
		var listQuestion = Vue.component('listQuestion',{
	    template: '#listQuestiontemplate',
	    data(){
	        return {
	          info: [],
	          loading: true,
	          errored: false 
	        }
	      },
	      methods:{
	    	  show_detail:function(questionNum){
	    		  alert(questionNum+"상세보기");
	    		  App.questionNum=questionNum;
	    		  App.currentview = 'detailQuestion';
	    		  App.showlist(1);
	    		}  
	      },
	      mounted () {
	        axios
	          .get('http://localhost:8080/safefood/listQuestion')
	          //.get('./emp.json')
	          .then(response => {
					this.info = response.data;        	  
	        	  })
	          .catch(() => {
	            this.errored = true
	          })
	          .finally(() => this.loading = false);
	      }
		});
		//상세보기
		var detailQuestion = Vue.component('detailQuestion',{
	    template: '#detailQuestiontemplate',
	    data(){
	        return {
	          question: {},
	          loading: true,
	          errored: false 
	        }
	      },
	      methods:{
	    	  show_detail:function(questionNum){
	    		  alert(questionNum+"상세보기");
	    		  App.questionNum=questionNum;
	    		  App.currentview = 'detailQuestion';
	    		  App.showlist(1);
	    		}  
	      },
	      mounted () {
	        axios
	          .get('http://localhost:8080/safefood/qna/'+App.questionNum)
	          //.get('./emp.json')
	          .then(response => {
					this.question = response.data;        	  
	        	  })
	          .catch(() => {
	            this.errored = true
	          })
	          .finally(() => this.loading = false);
	      }
		});
	
	
	
	var App=new Vue({
		  el: '#app',
		  data: {
			  currenttitle:'SSAFY HRM LIST',
			  questionNum:'',
			  currentview: 'listQuestion',
		      allviews:['listQuestion','detailQuestion'],
		      cutt:['SSAFY HRM LIST','SSAFY HRM ADD EMPLOEE']
		   },
		   components: {
			   listQuestion: listQuestion,
			   detailQuestion: detailQuestion
		     },
		     methods:{
		    	 showlist: function (val) {
		    		 //alert(val);
					 this.currentview=this.allviews[val];
		    		 this.currenttitle=this.cutt[val];
		         }
		     }
		})
	
	</script>

</body>
</html>
