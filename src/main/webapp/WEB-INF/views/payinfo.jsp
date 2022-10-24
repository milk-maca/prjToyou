<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>
<body>
<!------Header-------->
<%@ include file="layout/header.jsp"%>
<%-- 
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true"></jsp:include> --%>
<!------Header-------->






<!-- ==================================================================================== -->
<!-- 배너 시작 -->
	<div class="block-31" style="position: relative;">
		<div class="owl-carousel loop-block-31">
			<div class="block-30 block-30-sm item"
				style="background-image: url('/image/banner_payment.jpg');"
				data-stellar-background-ratio="0.5">
				<div class="container">
					<div
						class="row align-items-center justify-content-center text-center">
						<div class="col-md-7">
							<h2 class="heading mb-5">요금안내</h2>
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
<!-- 배너 종료 -->	
<!-- ==================================================================================== -->









	<div class="site-section border-top text-center col-lg-12">	
		<br>
		<br>		
		
		<h2>ToYou에서 이루세요, ${principal.user.userName}님의 꿈!</h2>
		<br>
		
		<h5>더 많은 기능이 필요하신가요?<br><br>
			적합한 요즘으로 효율적인 마케팅을 시작해보세요!<br><br>
			구독해지는 언제든지 가능합니다.
		</h5>
	</div>


		
<!-- ==================================================================================== -->
<!-- 멤버쉽 요금안내 시작 -->

	<div class="container">
		<div class="row commu">
			<div class="container cate_rank">
				<div class="container">
					<div class="row">
						<!-- BASIC 시작 -->
						<div class="col-sm-3 text-center">	
							<div class="person-donate2">
								<img src="/image/person_1.jpg" alt="Image placeholder"class="img-left">
							</div>
							<table class="table table-sm col-md-1 text-center">
								<thead class="thead-dark">
									<tr>
										<th scope="col">BASIC</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">FREE</th>
									</tr>
									<tr>
										<td>
											채널분석 <b>5</b>회<br>
											관련채널분석 <b>5</b>회<br>
											광고 제안 <b>5</b>회<br>
											트랜드 키워드 조회<br>
										</td>
									</tr>
									<tr>
										<td class="text-center">
							                
							                <!-- 로그인 되어있지 않으면 회원가입 페이지로 이동-->
							                <c:if test="${empty principal}">
							                    <form action="/auth/joinForm">
									         		<div class="form-group">
									         			<button type="submit" class="btn btn-default">회원가입</button>
									         		</div>
							     		        </form>  
							                </c:if>
							                
							                <!-- 로그인 되어있으면 마이페이지 페이지로 이동-->
							                <c:if test="${!empty principal}">
							                    <form action="/mypage">
									         		<div class="form-group">
									         			<button type="submit" class="btn btn-default">&#x2764;FREE&#x2764;</button>
									         		</div>
							     		        </form>  
							     		    </c:if>
							     		    	        		
		        						</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- BASIC 종료 -->
						<!-- STANDARD 시작 -->
						<div class="col-sm-3 text-center">	
							<div class="person-donate2">
								<img src="/image/person_2.jpg" alt="Image placeholder"class="img-left">
							</div>		
							<table class="table table-sm col-md-1 text-center">
								<thead class="thead-dark">
									<tr>
										<th scope="col">${Name1}</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<c:set var="Price1Value" value="${Price1 }" />
										<th scope="row">월 ${fn:substring(Price1Value,0,2)},${fn:substring(Price1Value,2,5)}원</th>
									</tr>
									<tr>
										<td>
											채널분석 <b>15</b>회<br>
											관련채널분석 <b>15</b>회<br>
											광고 제안 <b>15</b>회<br>
											트랜드 키워드 조회<br>
											시청자 분석 <b>10</b>회<br>
											커뮤니티 보유 <b>1</b>개<br>
										</td>
									</tr>
									<tr>
										<td class="text-center">
											<form action="/payMembershipForm">
												<input type="hidden" value="${Name1}" name="gradeOfSubscriber">
												<input type="hidden" value="${Price1}" name="priceOfSubscriber">
		         								<div class="form-group">
		         									<button type="submit" class="btn btn-default">구독신청!</button>
		         								</div>
		        							</form>     
		        						</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- STANDARD 종료 -->
						<!-- STARTUP 시작 -->
						<div class="col-sm-3 text-center">
							<div class="person-donate2">
								<img src="/image/person_3.jpg" alt="Image placeholder"class="img-left">
							</div>
							<table class="table table-sm col-md-1 text-center">
								<thead class="thead-dark">
									<tr>
										<th scope="col">${Name2}</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<c:set var="Price2Value" value="${Price2 }" />
										<th scope="row">월 ${fn:substring(Price2Value,0,2)},${fn:substring(Price2Value,2,5)}원</th>
									</tr>
									<tr>
										<td>
											채널분석 <b>30</b>회<br>
											관련채널분석 <b>30</b>회<br>
											광고 제안 <b>30</b>회<br>
											트랜드 키워드 조회<br>
											시청자 분석 <b>50</b>회<br>
											커뮤니티 보유 <b>3</b>개<br>
										</td>
									</tr>
									<tr>
										<td class="text-center">
											<form action="/payMembershipForm">
												<input type="hidden" value="${Name2}" name="gradeOfSubscriber">
												<input type="hidden" value="${Price2}" name="priceOfSubscriber">
		         								<div class="form-group">
		         									<button type="submit" class="btn btn-default">구독신청!</button>
		         								</div>
		        							</form>     
		        						</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- STARTUP 종료 -->
						<!-- PROFESSIONAL 시작 -->
						<div class="col-sm-3 text-center">
							<div class="person-donate2">
								<img src="/image/person_4.jpg" alt="Image placeholder"class="img-left">
							</div>		
							<table class="table table-sm col-md-1 text-center">
								<thead class="thead-dark">
									<tr>
										<th scope="col">${Name3}</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<c:set var="Price3Value" value="${Price3 }" />
										<th scope="row">월 ${fn:substring(Price3Value,0,2)},${fn:substring(Price3Value,2,5)}원</th>
									</tr>
									<tr>
										<td>
											채널분석 <b>무제한</b><br>
											관련채널분석 <b>무제한</b><br>
											광고 제안 <b>100</b>회<br>
											트랜드 키워드 조회<br>
											시청자 분석 <b>무제한</b><br>
											커뮤니티 보유 <b>5</b>개<br>
											<b>경쟁 유튜버 비교</b><br>
										</td>
									</tr>
									<tr>
										<td class="text-center">
											<form action="/payMembershipForm">
												<input type="hidden" value="${Name3}" name="gradeOfSubscriber">
												<input type="hidden" value="${Price3}" name="priceOfSubscriber">
		         								<div class="form-group">
		         									<button type="submit" class="btn btn-default">구독신청!</button>
		         								</div>
		        							</form>     
		        						</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- PROFESSIONAL 종료 -->
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 멤버쉽 요금안내 종료 -->
<!-- ==================================================================================== -->




        
<!-- Footer -->
<%@ include file="layout/Menu.jsp"%>
<%@ include file="layout/footer.jsp"%>

<%-- 
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true"></jsp:include>
 --%><!-- Footer -->
  </body>
</html>