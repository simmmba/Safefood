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
<!-- vue 추가 -->
<script src="https://unpkg.com/vue"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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

</head>

<body>
	
	<jsp:include page="nav.jsp"></jsp:include>

	<section id="services" class="section-bg">

		<header class="section-header">
			<h3>QnA</h3>
		</header>
		<div class="container">
			<div id="app">
				<div class="container">
					<button type="button" class="btn btn-primary" @click="showlist(0)">모든 글 보기</button>
					<button type="button" class="btn btn-primary" @click="showlist(2)">질문 작성</button>
					<button type="button" class="btn btn-primary" @click="showlist(4)">검색</button>
				</div>
				<br>
				<component v-bind:is="currentview"></component>
			</div>
		</div>
	</section>

	<div class="floating">
		<label>인기 검색어</label>
		<%@ include file="trends.jsp"%>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- #services -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

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
						<td>{{question.wdate}}</td>
					</tr>

					<tr>
						<th scope="row">조회수</th>
						<td>{{question.count}}</td>
					</tr>

					<tr>
						<td colspan="2">{{question.content}}</td>
					</tr>

				</tbody>
			</table>
			<button @click="updateQuestion" class="btn btn-primary">수정</button>
			<button @click="deleteQuestion" class="btn btn-primary">삭제</button>

		</div>
	</script>

	<script type="text/x-template" id="writeQuestiontemplate">
		<div class="form-horizontal">
			<div class="form-group has-feedback row">
				<label for="inputName"
					class="col-md-3 control-label text-md-right col-form-label">제목
					<span class="text-danger small">*</span>
				</label>
				<div class="col-md-8">
					<input type="text"  v-model = "title" class="form-control" id="inputName"
						placeholder="title" required name="title">
				</div>
			</div>
			<div class="form-group has-feedback row">
				<label for="inputLastName"
					class="col-md-3 control-label text-md-right col-form-label">작성자
					<span class="text-danger small">*</span>
				</label>
				<div class="col-md-8">
					<input type="text" v-model = "name" class="form-control" 
						placeholder="author" required="required" > 
				</div>
			</div>
			<div class="form-group has-feedback row">
				<label for="inputLastName"
					class="col-md-3 control-label text-md-right col-form-label">비밀번호
					<span class="text-danger small">*</span>
				</label>
				<div class="col-md-8">
					<input type="password" v-model = "pass" class="form-control" id="inputLastName"
						placeholder="영문 숫자 포함 6자리 이상" required="required" name="pass"> 
				</div>
			</div>
			
			<div class="form-group has-feedback row">
				<label for="inputEmail"
					class="col-md-3 control-label text-md-right col-form-label">내용
					<span class="text-danger small">*</span>
				</label>
				<div class="col-md-8">
					<textarea v-model = "content" cols = "50" rows = "10" class="form-control" id="inputEmail"
						placeholder="content" required="required" name="content">
					</textarea>
					<input type="hidden" v-model ="name" name = "name" value = "${member.id}">
				</div>
			</div>
				<div class="form-group row">
					<div class="ml-md-auto col-md-9">
						<button @click="write" class="btn btn-primary">등록</button>
					</div>
				</div>
			</div>
	</script>

	<script type="text/x-template" id="updateQuestiontemplate">
		<div class="form-horizontal">
			<div class="form-group has-feedback row">
				<label for="inputName"
					class="col-md-3 control-label text-md-right col-form-label">제목
					<span class="text-danger small">*</span>
				</label>
				<div class="col-md-8">
					<input type="text"  v-model = "title" class="form-control" id="inputName"
						placeholder="title" required name="title">
				</div>
			</div>
			
			<div class="form-group has-feedback row">
				<label for="inputEmail"
					class="col-md-3 control-label text-md-right col-form-label">내용
					<span class="text-danger small">*</span>
				</label>
				<div class="col-md-8">
					<textarea v-model = "content" cols = "50" rows = "10" class="form-control" id="inputEmail"
						placeholder="content" required="required" name="content">
					</textarea>
					<input type="hidden" v-model ="name" name = "name" value = "${member.id}">
				</div>
			</div>
				<div class="form-group row">
					<div class="ml-md-auto col-md-9">
						<button @click="write" class="btn btn-primary">수정</button>
					</div>
				</div>
			</div>
	</script>

	<script type="text/x-template" id="searchQuestiontemplate">
	<div>
		<div class="container">
			<div class="col-lg-6">
				<div id="target" class="form-inline">
					<div class="form-group">
						<select v-model = "condition" class="form-control" id="key" name="condition" >
  							<option disabled value="">종류 선택</option>
							<option value="title" selected>제목</option>
							<option value="name">작성자</option>
						</select>
					</div>
					<div class="form-group">
						<input v-model = "word" type="text" class="form-control" id="word" name="word" placeholder="검색어를 입력하세요">
					</div>
					<div class="form-group">
						<button @click="search" class="btn btn-primary">검색</button>
					</div>
				</div>
				<br>
			</div>
		</div>


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
	          question: [],
	          loading: true,
	          errored: false 
	        }
	      },
	      methods:{
	    		updateQuestion:function(){
		    	  App.currentview = 'updateQuestion';
		    	  App.showlist(3);
		    	},
		    	deleteQuestion:function(){
			        axios
			          .delete('http://localhost:8080/safefood/qna/'+App.questionNum)
			          //.get('./emp.json')
			          .then(response => {
			        	  App.showlist(0);
			        	  
			        	  })
			          .catch(() => {
			            this.errored = true
			          })
			          .finally(() => this.loading = false);
		    		
			        location.href='./qna.food';
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
		
		
		//작성
		var writeQuestion = Vue.component('writeQuestion',{
		    template: '#writeQuestiontemplate',
		    data () {
			    return {
			      loading: true,
			      errored: false,
			      question:[],
			      title :'',
			      pass :'',
			      name : '',
			      content:''
			    }
			  },
		 	 methods: {
		 		write() {				  
				  axios.post('http://localhost:8080/safefood/qna/', {
			    	  title: this.title,
			    	  pass:this.pass,
			    	  content: this.content,
			    	  name : this.name
			    	  
			    	} 
			      ).then(function(response){
		    		  App.currentview = 'listQuestion';
		    		  App.showlist(0);
			    	}
			      )
				}
		 	 }
		  });  
		
		//수정
		var updateQuestion = Vue.component('updateQuestion',{
		    template: '#updateQuestiontemplate',
		    data () {
			    return {
			      loading: true,
			      errored: false,
			      title :'',
			      content:''
			    }
			  },
		 	 methods: {
		 		write() {
				  
				  axios.put('http://localhost:8080/safefood/qna/', {
			    	  title: this.title,
			    	  content: this.content,
			    	  num : App.questionNum
			    	} 
			      ).then(function(response){
		    		  App.currentview = 'listQuestion';
		    		  App.showlist(0);
			    	}
			      )
				}
		 	 },
		     mounted () {
				  axios
			         .get('http://localhost:8080/safefood/qna/'+App.questionNum)
			         .then(response => {
						this.title = response.data.title;
						this.content = response.data.content;
			       	  })
			         .catch(() => {
			           this.errored = true
			         })
			         .finally(() => this.loading = false);
			 }
		  });
		
		
		//검색
		var searchQuestion = Vue.component('searchQuestion',{
	    template: '#searchQuestiontemplate',
	    data(){
	        return {
	          info: [],
	          condition:'',
	          word:'',
	          loading: true,
	          errored: false 
	        }
	      },
	      methods:{
	    	  search:function(){
	    		 
	  	        axios
		          .get('http://localhost:8080/safefood/qna/'+this.condition+'/'+this.word)
		          //.get('./emp.json')
		          .then(response => {
						this.info = response.data;	  
		        	  })
		          .catch(() => {
		            this.errored = true
		          })
		          .finally(() => this.loading = false);
	    	  },
	    	  show_detail:function(questionNum){
	    		  App.questionNum=questionNum;
	    		  App.currentview = 'detailQuestion';
	    		  App.showlist(1);
	    		}  
	      },
	      mounted () {
		        axios
		          .get('http://localhost:8080/safefood/listQuestion')
		          .then(response => {
						this.info = response.data;        	  
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
		      allviews:['listQuestion','detailQuestion','writeQuestion','updateQuestion','searchQuestion'],
		   },
		   components: {
			   listQuestion: listQuestion,
			   detailQuestion: detailQuestion,
			   writeQuestion : writeQuestion,
			   updateQuestion : updateQuestion,
			   searchQuestion: searchQuestion
		     },
		     methods:{
		    	 showlist: function (val) {
					 this.currentview=this.allviews[val];
		        }
		     }
		})
	
	</script>

</body>
</html>
