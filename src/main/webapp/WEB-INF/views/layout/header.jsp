<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<header>  
<!-- 	<nav class="navbar navbar-expand-lg" id="ftco-navbar">
    <div class="container">
    	<div class="info_bar">
          <ul class="navbar-nav ml-auto"> 
          <li class="nav-item"><a href="#" class="nav-link">로그인</a></li>
          <li class="nav-item"><a href="#" class="nav-link">마이페이지</a></li>
          </ul>
	</div>
</div>
</nav>	
	 --> 
  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">      
   <div class="container">
      <div class="container">
    	<div class="info_bar">
          <ul class="navbar-nav ml-auto ">        
<!--      <li class="box"><a href="#"><img class="profile" src="#">로그인</a></li> -->
			<c:choose>
				<c:when test="${empty principal}">		
          			<li class="nav-item"><a href="/auth/loginForm" class="nav-link">로그인</a></li>
          			<li class="nav-item"><a href="/auth/joinForm" class="nav-link">회원가입</a></li>
          		</c:when>
          		<c:otherwise>
          			<li class="nav-item"><a href="/mypage" class="nav-link">${principal.user.userName}</a></li>
          			<c:choose>
	          			<c:when test="${principal.user.oauth == 'kakao' }">
		          			<li class="nav-item"><a href="https://kauth.kakao.com/oauth/logout?client_id=9678b56f9afb8f96a880f7b1bdaee036&logout_redirect_uri=http://localhost:8003/kakao/logout/callback" class="nav-link">로그아웃</a></li>
	          			</c:when>
	          			<c:otherwise>
		          			<li class="nav-item"><a href="/logout" class="nav-link">로그아웃</a></li>          			
	          			</c:otherwise>
          			</c:choose>
          		</c:otherwise>
          	</c:choose>
          	<!-- 성연추가) 관리자페이지 접속 -->
          	<!-- 로그인 된 userId가 test1234 일 경우에만 관리자페이지 접속 가능 -->
 			<c:if test="${principal.user.userId == 'test1234'}">
 				<li class="nav-item"><a href="/admin_index" class="nav-link">관리자페이지</a></li>
 			</c:if>
          	<!-- 성연추가) 관리자페이지 접속 -->
          </ul>
	    </div>
      <a class="navbar-brand" href="/">You To You</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
       <span class="oi oi-menu"></span> Menu
      </button>
     

<!-- ** <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <form class="form-inline" action="/action_page.php">
    <input class="form-control mr-sm-2" type="text" placeholder="Search">
    <button class="btn btn-success" type="submit">Search</button>
  </form>
</nav> ** -->



     <div class="collapse navbar-collapse" id="ftco-nav">   
<!--<form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form> -->
    <!-- 검색창 ---------------------------------------------------------------------------------->
     	<form action="/auth/channelSearch" method="get" class="form-inline my-2 my-lg-0" role="search">
         <div class="form-group">
         <input type="text" class="form-control mr-2" name="keyword" placeholder="채널명을 입력하세요">
         <button type="submit" class="btn btn-default">검색</button>
         </div>
        </form>        
        <ul class="navbar-nav ml-auto"> 
          <li class="nav-item"><a href="/auth/trend" class="nav-link">트랜드 분석</a></li>
          <li class="nav-item"><a href="/auth/magazine" class="nav-link">매거진</a></li>
          <li class="nav-item"><a href="/auth/communityTotal" class="nav-link">커뮤니티</a></li>
          <li class="nav-item"><a href="/auth/payinfo" class="nav-link">요금안내</a></li>
<!--           <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
          <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li> -->
        </ul>
       
      </div>
    </div>
    </div>
  </nav>
<!--   <-- END nav -->
  </header> 
