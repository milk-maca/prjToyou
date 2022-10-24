<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 성연추가) jstl 문자열 자르기 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 성연추가) jstl 문자열 자르기 -->
<!DOCTYPE html>
<html>
<head>
<title>You To You &mdash; Youtuber Management</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Overpass:300,400,500|Dosis:400,700" rel="stylesheet">
<link rel="stylesheet" href="/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/css/animate.css">
<link rel="stylesheet" href="/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/css/magnific-popup.css">
<link rel="stylesheet" href="/css/aos.css">
<link rel="stylesheet" href="/css/ionicons.min.css">
<link rel="stylesheet" href="/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/css/jquery.timepicker.css">
<link rel="stylesheet" href="/css/flaticon.css">
<link rel="stylesheet" href="/css/icomoon.css">
<link rel="stylesheet" href="/css/fancybox.min.css">
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
</head>
<body>
<!------Header-------->
<%@ include file="layout/header.jsp"%>
<%-- 
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true"></jsp:include> --%>
<!------Header-------->
  <div class="block-31" style="position: relative;">
    <div class="owl-carousel loop-block-31 ">
      <div class="block-30 block-30-sm item" style="background-image: url('/image/bigmain.jpg');" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-7">
              <h2 class="heading mb-5">You To You</h2>
              <p class="read" style="color:white;">유튜유는 광고주와 유튜버가 필요한 모든 데이터와 인사이트를 제공합니다.</p>
        <!-- <p style="display: inline-block;"><a href="https://vimeo.com/channels/staffpicks/93951774"  data-fancybox class="ftco-play-video d-flex"><span class="play-icon-wrap align-self-center mr-4"><span class="ion-ios-play"></span></span> <span class="align-self-center">Watch Video</span></a></p> -->           
        <!-- 메인 중앙 검색창
               <div class="input-group">
                   <input type="text" class="form-control" placeholder="검색어를 입력하세요">
                   <span class="input-group-btn">
                   <button class="btn btn-secondary" type="button">검색</button>
                   </span>
              </div> END 메인 중앙 검색창 -->
             </div>
          </div>
        </div>
      </div>
      
    </div>
  </div>
  <div class="site-section section-counter">
    <div class="container">
      <div class="row">
        <div class="col-md-6 pr-5">
          <div class="block-48">
              <span class="block-48-text-1">유튜유를 </br>이용중인 사람들</span>
              <div class="block-48-counter ftco-number" data-number="${allUserNum }">0</div>
              <span class="block-48-text-1 mb-4 d-block"></span>
              <p class="mb-0"><a href="/auth/joinForm" class="btn btn-white px-3 py-2">가입하기</a></p>
            </div>
        </div>
        <div class="col-md-6 welcome-text maintx">
          <h2 class="display-4 mb-3">You Tube To You</h2>
          <p class="lead">채널기반 맞춤형 데이터를 제공합니다.</p>
          <p class="mb-4">유투유와 함께 효율적인 마케팅을 시작해보세요!</p>
          <p class="mb-0"><a href="auth/payinfo" class="btn btn-free px-3 py-2">무료체험</a></p>
        </div>
      </div>
    </div>
  </div>

  <div class="site-section border-top">
    <div class="container">
      <div class="row">


    <div class="container">
      <div class="row mb-3 justify-content-center hei">
        <div class="col-md-8 text-center">
          <h2>왜 You To You를 선택해야할까요?</h2>
<!--           <p class="lead"> 많은 유튜버들이 선택한 매니지먼트 블라블라</p>  -->
<!--           <p><a href="#" class="link-underline">View All Fundraisers</a></p> -->
        </div>
      </div>
    </div>
    
    
<div class="site-section">
    <div class="container">
    
      <div class="row align-items-center mb-5">
        <div class="col-md-7 order-md-2 mb-5 mb-md-0">
          <img src="/image/main01.png" alt="" class="img-fluid">
        </div>

        <div class="col-md-5 pr-md-5 mb-5 order-md-1">
          <div class="block-41">
            <div class="block-41-subheading d-flex">
              <div class="block-41-number">차별화된 검색 서비스</div>
            </div>
            <h2 class="block-41-heading mb-3">고급검색</h2>
            <div class="block-41-text">
              <p>채널 기반 최적의 유튜버들의 데이터를 한 눈에 볼 수 있습니다</p>
            </div>
          </div>
        </div>
        
      </div> <!-- .row -->

      <div class="row align-items-center mb-5">
        <div class="col-md-7 mb-5 mb-md-0">
          <img src="/image/main02.png" alt="" class="img-fluid">
        </div>

        <div class="col-md-5 pl-md-5 mb-5">
          <div class="block-41">
            <div class="block-41-subheading d-flex">
              <div class="block-41-number">강력한 분석 시스템</div>
            </div>
            <h2 class="block-41-heading mb-3">분석/광고</h2>
            <div class="block-41-text">
              <p>차별화된 분석 시스템을 기반으로 광고효과를 극대화할 수 있습니다.</p>
            </div>
          </div>
        </div>
        
      </div> <!-- .row -->
      
      
        <div class="row align-items-center mb-5">
        <div class="col-md-7 order-md-2 mb-5 mb-md-0">
          <img src="/image/main03.png" alt="" class="img-fluid">
        </div>

        <div class="col-md-5 pr-md-5 mb-5 order-md-1">
          <div class="block-41">
            <div class="block-41-subheading d-flex">
              <div class="block-41-number">강력한 커뮤니티</div>
            </div>
            <h2 class="block-41-heading mb-3">커뮤니티</h2>
            <div class="block-41-text">
              <p>유튜유만의 유튜버 특화 된 커뮤니티를 통해 빠른 협업과 소통을 시작하세요.</p>
            </div>
          </div>
        </div>
        
      </div> <!-- .row -->



    </div>
  </div>
  
  
  
  
    
<!--  3열짜리       <div class="col-md-4">
          <div class="media block-6">
            <div class="icon"><span class="ion-ios-bulb"></span></div>  좌측 아이콘1
            <div class="media-body">
              <h3 class="heading">고급검색</h3>
              <p>채널 기반 최적의 유튜버들의 데이터를 한 눈에 볼 수 있습니다</p>
              <p><a href="#" class="link-underline">Learn More</a></p>
            </div>
          </div>     
        </div>

        <div class="col-md-4">
          <div class="media block-6">
            <div class="icon"><span class="ion-ios-cash"></span></div>  좌측 아이콘2
            <div class="media-body">
              <h3 class="heading">분석/광고</h3>
              <p>차별화된 분석 시스템을 기반으로 광고효과를 극대화할 수 있습니다.</p>
              <p><a href="#" class="link-underline">Learn More</a></p>
            </div>
          </div>  
        </div>

        <div class="col-md-4">
          <div class="media block-6">
            <div class="icon"><span class="ion-ios-contacts"></span></div> 좌측 아이콘3
            <div class="media-body">
              <h3 class="heading">유튜버 커뮤니티</h3>
              <p>유튜유만의 유튜버 특화 된 커뮤니티를 통해 빠른 협업과 소통을 시작하세요.</p>
              <p><a href="#" class="link-underline">Learn More</a></p>
            </div>
          </div> 
        </div> -->


      </div>
    </div>
  </div> <!-- .site-section -->



  

  <div class="site-section fund-raisers bg-light">
    <div class="container">
      <div class="row mb-3 justify-content-center bmem">
        <div class="col-md-8 text-center">
          <h2>You To You 멤버십</h2>
             <p class="lead">더 많은 기능이 필요하신가요?<br/>적합한 요금으로 효율적인 마케팅을 시작해 보세요.<br/>구독해지는 언제든 가능합니다.</p>
         <!-- <p><a href="#" class="link-underline">View All Fundraisers</a></p> -->
        </div>
      </div>
    </div>


    <div class="container-fluid">

      <!-- <div class="row"> -->
        
        <div class="col-md-12 block-11">
          <div class="nonloop-block-11 owl-carousel">

            <div class="card fundraise-item">
            <a href="#"><img class="card-img-top" src="/image/plan01.jpg" alt="image placeholder"></a>
              <div class="card-body">
                <!-- <h3 class="card-title"><a href="#">Basic</a></h3> -->
                <div class="row">
                <div class="col-12">
                <span class="donation-time mb-3 d-block" style="color:#f7ca44;">무료 제공 솔루션</span> 
                <span class="fund-raised d-block price">FREE</span>
                
                 

	                <!-- 로그인 되어있지 않으면 회원가입 페이지로 이동-->
	                <c:if test="${empty principal}">
	                    <form action="/auth/joinForm">
			         		<div class="form-group">
			         			<button type="submit" class="btn pay">회원가입시 무료제공</button>
			         		</div>
	     		        </form>  
	                </c:if>
	                
	                <!-- 로그인 되어있으면 마이페이지 페이지로 이동-->
	                <c:if test="${!empty principal}">
	                    <form action="/mypage">
			         		<div class="form-group">
			         			<button type="submit" class="btn pay">기본제공</button>
			         		</div>
	     		        </form>  
	     		    </c:if>

     		        
     		        
                <div class="emptybox"></div>                
                <p class="card-text"><i class="fas fa-check"></i>  데이터 분석조회<br/>
          							 <i class="fas fa-check"></i>  채널분석 5회<br/>
									 <i class="fas fa-check"></i>  관련채널분석 5회<br/>
									 <i class="fas fa-check"></i>  광고 제안 5회<br/>
									 <i class="fas fa-check"></i>  트랜드 키워드 조회</p> 
       			</div>
				</div>
				<div class="emptybox"></div> 

<!--                 <div class="progress custom-progress-success">
                  <div class="progress-bar bg-primary" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                </div> -->

              </div>
            </div>

            <div class="card fundraise-item">
              <a href="#"><img class="card-img-top" src="/image/plan02.jpg" alt="Image placeholder"></a>
              <div class="card-body">
                <!-- <h3 class="card-title"><a href="#">Standard</a></h3> -->
                <div class="row">
                <div class="col-12">
                <span class="donation-time mb-3 d-block" style="color:#f7ca44;">광고 제안의 첫걸음</span> 
                <c:set var="Price1Value" value="${Price1 }" />
                <span class="fund-raised d-block price">월 ${fn:substring(Price1Value,0,2)},${fn:substring(Price1Value,2,5)}원</span>
                    <form action="/payMembershipForm">
					   <input type="hidden" value="STANDARD" name="gradeOfSubscriber">
		         		<div class="form-group">
		         		<button type="submit" class="btn pay">구독신청!</button>
		         		</div>
     		        </form>  
                <div class="emptybox"></div> 
                <p class="card-text"><i class="fas fa-check"></i>  채널분석 15회<br/>
          							 <i class="fas fa-check"></i>  관련채널분석 15회<br/>
									 <i class="fas fa-check"></i>  광고 제안 15회<br/>
									 <i class="fas fa-check"></i>  트랜드 키워드 조회<br/>
									 <i class="fas fa-check"></i>  시청자 분석 10회<br/>
									 <i class="fas fa-check"></i>  커뮤니티 보유 1개</p>
				</div>
				</div>					 
				<div class="emptybox"></div>
<!--                 <div class="progress custom-progress-success">
                  <div class="progress-bar bg-primary" role="progressbar" style="width: 28%" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100"></div>
                </div> -->
              </div>
            </div>
            
            <div class="card fundraise-item">
              <a href="#"><img class="card-img-top" src="/image/plan03.jpg" alt="Image placeholder"></a>
              <div class="card-body">
                <!-- <h3 class="card-title"><a href="#">Startup</a></h3> -->
                <div class="row">
                <div class="col-12">
                <span class="donation-time mb-3 d-block" style="color:#f7ca44;">유튜버 매칭을 위한 솔루션</span> 
                <c:set var="Price2Value" value="${Price2 }" />
                <span class="fund-raised d-block price">월 ${fn:substring(Price2Value,0,2)},${fn:substring(Price2Value,2,5)}원</span>
                    <form action="/payMembershipForm">
					   <input type="hidden" value="STARTUP" name="gradeOfSubscriber">
		         		<div class="form-group">
		         		<button type="submit" class="btn pay">구독신청!</button>
		         		</div>
     		        </form>  
                <div class="emptybox"></div> 
                <p class="card-text"><i class="fas fa-check"></i>  채널분석 30회<br/>
          							 <i class="fas fa-check"></i>  관련채널분석 30회<br/>
									 <i class="fas fa-check"></i>  광고 제안 30회<br/>
									 <i class="fas fa-check"></i>  트랜드 키워드 조회<br/>
									 <i class="fas fa-check"></i>  시청자 분석 50회<br/>
									 <i class="fas fa-check"></i>  커뮤니티 보유 3개</p>
				</div>
				</div>					 
				<div class="emptybox"></div>
<!--                 <div class="progress custom-progress-success">
                  <div class="progress-bar bg-primary" role="progressbar" style="width: 28%" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100"></div>
                </div> -->
              </div>
            </div>
            
            
            <div class="card fundraise-item">
              <a href="#"><img class="card-img-top" src="/image/plan04.jpg" alt="Image placeholder"></a>
              <div class="card-body">
                <!-- <h3 class="card-title"><a href="#">Professional</a></h3> -->
                <div class="row">
                <div class="col-12">
                <span class="donation-time mb-3 d-block" style="color:#f7ca44;">효율적인 마케팅을 위한 솔루션</span> 
                <c:set var="Price3Value" value="${Price3 }" />
                <span class="fund-raised d-block price">월 ${fn:substring(Price3Value,0,2)},${fn:substring(Price3Value,2,5)}원</span>
                
                <form action="/payMembershipForm">
					<input type="hidden" value="PROFESSIONAL" name="gradeOfSubscriber">
		         		<div class="form-group">
		         		<button type="submit" class="btn pay">구독신청!</button>
		         		</div>
		        </form>    
		        							
<!--                 <input class="btn pay" type="submit" value="결제하기"> -->
                <div class="emptybox"></div> 
                <p class="card-text"><i class="fas fa-check"></i>  채널분석 무제한<br/>
          							 <i class="fas fa-check"></i>  관련채널분석 무제한<br/>
									 <i class="fas fa-check"></i>  광고 제안 100회<br/>
									 <i class="fas fa-check"></i>  트랜드 키워드 조회<br/>
									 <i class="fas fa-check"></i>  시청자 분석 무제한<br/>
									 <i class="fas fa-check"></i>  커뮤니티 보유 5개<br/>
									 <i class="fas fa-check"></i>  경쟁 유튜버 비교</p>								 
				</div>
				</div>					 
				<div class="emptybox"></div>
<!--                 <div class="progress custom-progress-success">
                  <div class="progress-bar bg-primary" role="progressbar" style="width: 28%" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100"></div>
                </div> -->
                
                
              </div>
            </div>
                     
          </div>
        </div>
      <!-- </div> -->
    </div>
  </div> <!-- .section -->




  
<!-- Footer -->
<%@ include file="layout/Menu.jsp"%>
<%@ include file="layout/footer.jsp"%>

<%-- 
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true"></jsp:include>
 --%><!-- Footer -->

  </body>
</html>