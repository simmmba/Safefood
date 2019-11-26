<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.safe.vo.Food, com.safe.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--========================== Header ============================-->
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
				<h1><b>
					<a href="main.food">
					<!-- <img src="http://edu.ssafy.com/asset/images/header-logo.jpg" alt="로고" height="400"> -->
					SAFE FOOD</a></b>
				</h1>
			</div>

			<nav class="main-nav float-right d-none d-lg-block navbar navbar-fixed-top">
				<ul>
					<!-- <li class="active"><a href="#intro">공지 사항</a></li> -->
					<li><a href="read.food">상품 정보</a></li>
					<li><a href="#about">베스트 섭취 정보</a></li>
					<c:if test="${not empty member}">
						<li><a href="intakeinfo.food">내 섭취 정보</a></li>
						<li><a href="#team">예상 섭취 정보</a></li>
					</c:if>
					<li><u><a href="qna.food">QnA</a></u></li>
					<li><u><a href="notice.food">공지 사항</a></u></li>

				</ul>
			</nav>
			<!-- .main-nav -->
		</div>

	</header>
	<!-- #header -->

</body>
</html>