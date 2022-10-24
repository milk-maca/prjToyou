<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>You To You &mdash; Youtuber Management</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Overpass:300,400,500|Dosis:400,700"
	rel="stylesheet">
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
<script src="http://unpkg.com/ionicons@5.5.2/dist/ionicons.js"></script>
<body>
	<!------Header-------->
	<%@ include file="layout/header.jsp"%>
	<%-- 
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true"></jsp:include> --%>
	<!------Header-------->
	<div class="block-31" style="position: relative;">
		<div class="owl-carousel loop-block-31 ">
			<div class="block-30 block-30-sm item"
				style="background-image: url('/image/banner_magazine.jpg');"
				data-stellar-background-ratio="0.5">
				<div class="container">
					<div
						class="row align-items-center justify-content-center text-center">
						<div class="col-md-7">
							<h2 class="heading mb-5">Magazine</h2>
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


	<div class="site-section" >
		<div class="container">
			<div class="row"></div>
		</div>
	</div>
	<!-- .site-section -->

	<div class="site-section" >
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="nav nav-tabs" >
						<!-- tab.start -->
						<li class="nav-item    "><a class="nav-link active text-dark"
							data-toggle="tab" href="#comm01"><ion-icon name="newspaper-outline"></ion-icon>&nbsp;최신 뉴스</a></li>
						<li class="nav-item   "><a class="nav-link text-dark" data-toggle="tab"
							href="#comm02"><ion-icon name="videocam-outline"></ion-icon>&nbsp;영화</a></li>
						<li class="nav-item   "><a class="nav-link text-dark" data-toggle="tab"
							href="#comm03"><ion-icon name="musical-notes-outline"></ion-icon>&nbsp;음악</a></li>
						<li class="nav-item   "><a class="nav-link text-dark" data-toggle="tab"
							href="#comm04"><ion-icon name="tv-outline"></ion-icon>&nbsp;TV</a></li>
						<li class="nav-item   "><a class="nav-link text-dark" data-toggle="tab"
							href="#comm05"><ion-icon name="library-outline"></ion-icon>&nbsp;도서</a></li>
						<li class="nav-item   "><a class="nav-link text-dark" data-toggle="tab"
							href="#comm06"><ion-icon name="brush-outline"></ion-icon>&nbsp;예술</a></li>
						<li class="nav-item   "><a class="nav-link text-dark" data-toggle="tab"
							href="#comm07"><ion-icon name="body-outline"></ion-icon>&nbsp;연예</a></li>
						<li class="nav-item   "><a class="nav-link text-dark" data-toggle="tab"
							href="#comm08"><ion-icon name="barbell-outline"></ion-icon>&nbsp;건강</a></li>
						<li class="nav-item   "><a class="nav-link text-dark" data-toggle="tab"
							href="#comm09"><ion-icon name="flask-outline"></ion-icon>&nbsp;과학기술</a></li>
						<li class="nav-item   "><a class="nav-link text-dark" data-toggle="tab"
							href="#comm10"><ion-icon name="stats-chart-outline"></ion-icon>&nbsp;비지니스</a></li>
						<li class="nav-item   "><a class="nav-link text-dark" data-toggle="tab"
							href="#comm11"><ion-icon name="globe-outline"></ion-icon> &nbsp;세계</a></li>
					</ul>
					<!-- tab.end -->

					<!------------------------------- Tab contents START------------------------------->
					<div class="tab-content" >

						<!-- -- 01 최신 뉴스.start -->
						<div class="tab-pane fade show active" id="comm01">
						
									<div class="site-section fund-raisers bg-light"  style="padding: 0px" style="padding:0"  >
									
				
										<div class="container ">
											<div
												class="row mb-3 justify-content-center ">
												<div class="col-md-8 text-center">
													<h2>Entertainment</h2>
													<p id="subTitle" class="lead ">최신 뉴스</p>
												</div>
											</div>
										</div>
										<div class="container-fluid border-dark box-dashed"
											style="width: 100%; height: 50%;">
											<div style="position: fixed; left: 200px; top: 100px">
												<p>Test</p>
											</div>
											<div class="col-md-12 block-11" style="padding: 0px">
												<div class="nonloop-block-11 owl-carousel"
													style="padding: 0px">
													<c:forEach var="list" items="${EnterNews}"
														varStatus="status">

														<div class="card fundraise-item border border-dark"
															style="width: 100%; height: 100%">

															<a href="${list.magazineLink }"><img
																class="card-img-top" src="${list.magazineImage}"
																onerror="this.src='/image/toyouNoimage.PNG'"></a>

															<div class="card-body">
																<h6 class="card-title">
																	<a href="${list.magazineLink }"><small>${list.magazineTitle }</small></a>
																</h6>
																<p class="card-text">${list.magazineWriter }</p>
																<span class="donation-time mb-3 d-block">${list.magazineTime }</span>
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- -- 01 최신 뉴스.end -->
								
								<!-- -- 02 영화.start -->
						<div class="tab-pane fade" id="comm02">
									<div class="site-section fund-raisers bg-light"  style="padding: 0px" style="padding: 0px" >
										<div class="container ">
											<div
												class="row mb-3 justify-content-center">
												<div class="col-md-8 text-center">
													<h2>Entertainment</h2>
													<p id="subTitle" class="lead">영화</p>
												</div>
											</div>
										</div>
										<div class="container-fluid border-dark box-dashed"
											style="width: 100%; height: 50%;">
											<div style="position: fixed; left: 200px; top: 100px">
												<p>Test</p>
											</div>
											<div class="col-md-12 block-11" style="padding: 0px">
												<div class="nonloop-block-11 owl-carousel"
													style="padding: 0px">
													<c:forEach var="list" items="${EnterMovie}"
														varStatus="status">

														<div class="card fundraise-item border border-dark"
															style="width: 100%; height: 100%">

															<a href="${list.magazineLink }"><img
																class="card-img-top" src="${list.magazineImage}"
																onerror="this.src='/image/toyouNoimage.PNG'"></a>

															<div class="card-body">
																<h6 class="card-title">
																	<a href="${list.magazineLink }"><small>${list.magazineTitle }</small></a>
																</h6>
																<p class="card-text">${list.magazineWriter }</p>
																<span class="donation-time mb-3 d-block">${list.magazineTime }</span>
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- -- 02 영화 뉴스.end -->
								
								
								<!-- -- 03 음악.start -->
						<div class="tab-pane fade" id="comm03">
									<div class="site-section fund-raisers bg-light"  style="padding: 0px" >
										<div class="container ">
											<div
												class="row mb-3 justify-content-center ">
												<div class="col-md-8 text-center">
													<h2>Entertainment</h2>
													<p id="subTitle" class="lead">음악</p>
												</div>
											</div>
										</div>
										<div class="container-fluid border-dark box-dashed"
											style="width: 100%; height: 50%;">
											<div style="position: fixed; left: 200px; top: 100px">
												<p>Test</p>
											</div>
											<div class="col-md-12 block-11" style="padding: 0px">
												<div class="nonloop-block-11 owl-carousel"
													style="padding: 0px">
													<c:forEach var="list" items="${EnterMusic}"
														varStatus="status">

														<div class="card fundraise-item border border-dark"
															style="width: 100%; height: 100%">

															<a href="${list.magazineLink }"><img
																class="card-img-top" src="${list.magazineImage}"
																onerror="this.src='/image/toyouNoimage.PNG'"></a>

															<div class="card-body">
																<h6 class="card-title">
																	<a href="${list.magazineLink }"><small>${list.magazineTitle }</small></a>
																</h6>
																<p class="card-text">${list.magazineWriter }</p>
																<span class="donation-time mb-3 d-block">${list.magazineTime }</span>
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- -- 03 음악 뉴스.end -->
								
								
								<!-- -- 04 TV.start -->
						<div class="tab-pane fade" id="comm04">
									<div class="site-section fund-raisers bg-light"  style="padding: 0px" >
										<div class="container ">
											<div
												class="row mb-3 justify-content-center">
												<div class="col-md-8 text-center">
													<h2>Entertainment</h2>
													<p id="subTitle" class="lead">TV 쇼</p>
												</div>
											</div>
										</div>
										<div class="container-fluid border-dark box-dashed"
											style="width: 100%; height: 50%;">
											<div style="position: fixed; left: 200px; top: 100px">
												<p>Test</p>
											</div>
											<div class="col-md-12 block-11" style="padding: 0px">
												<div class="nonloop-block-11 owl-carousel"
													style="padding: 0px">
													<c:forEach var="list" items="${EnterTV}"
														varStatus="status">

														<div class="card fundraise-item border border-dark"
															style="width: 100%; height: 100%">

															<a href="${list.magazineLink }"><img
																class="card-img-top" src="${list.magazineImage}"
																onerror="this.src='/image/toyouNoimage.PNG'"></a>

															<div class="card-body">
																<h6 class="card-title">
																	<a href="${list.magazineLink }"><small>${list.magazineTitle }</small></a>
																</h6>
																<p class="card-text">${list.magazineWriter }</p>
																<span class="donation-time mb-3 d-block">${list.magazineTime }</span>
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- -- 04 TV 뉴스.end -->
								
								<!-- -- 05 Book.start -->
						<div class="tab-pane fade" id="comm05">
									<div class="site-section fund-raisers bg-light"  style="padding: 0px" >
										<div class="container ">
											<div
												class="row mb-3 justify-content-center">
												<div class="col-md-8 text-center">
													<h2>Entertainment</h2>
													<p id="subTitle" class="lead">도서</p>
												</div>
											</div>
										</div>
										<div class="container-fluid border-dark box-dashed"
											style="width: 100%; height: 50%;">
											<div style="position: fixed; left: 200px; top: 100px">
												<p>Test</p>
											</div>
											<div class="col-md-12 block-11" style="padding: 0px">
												<div class="nonloop-block-11 owl-carousel"
													style="padding: 0px">
													<c:forEach var="list" items="${EnterBook}"
														varStatus="status">

														<div class="card fundraise-item border border-dark"
															style="width: 100%; height: 100%">

															<a href="${list.magazineLink }"><img
																class="card-img-top" src="${list.magazineImage}"
																onerror="this.src='/image/toyouNoimage.PNG'"></a>

															<div class="card-body">
																<h6 class="card-title">
																	<a href="${list.magazineLink }"><small>${list.magazineTitle }</small></a>
																</h6>
																<p class="card-text">${list.magazineWriter }</p>
																<span class="donation-time mb-3 d-block">${list.magazineTime }</span>
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- -- 05 Book 뉴스.end -->
								
								<!-- -- 06 Art.start -->
						<div class="tab-pane fade" id="comm06">
									<div class="site-section fund-raisers bg-light"  style="padding: 0px" >
										<div class="container ">
											<div
												class="row mb-3 justify-content-center">
												<div class="col-md-8 text-center">
													<h2>Entertainment</h2>
													<p id="subTitle" class="lead">예술</p>
												</div>
											</div>
										</div>
										<div class="container-fluid border-dark box-dashed"
											style="width: 100%; height: 50%;">
											<div style="position: fixed; left: 200px; top: 100px">
												<p>Test</p>
											</div>
											<div class="col-md-12 block-11" style="padding: 0px">
												<div class="nonloop-block-11 owl-carousel"
													style="padding: 0px">
													<c:forEach var="list" items="${EnterArt}"
														varStatus="status">

														<div class="card fundraise-item border border-dark"
															style="width: 100%; height: 100%">

															<a href="${list.magazineLink }"><img
																class="card-img-top" src="${list.magazineImage}"
																onerror="this.src='/image/toyouNoimage.PNG'"></a>

															<div class="card-body">
																<h6 class="card-title">
																	<a href="${list.magazineLink }"><small>${list.magazineTitle }</small></a>
																</h6>
																<p class="card-text">${list.magazineWriter }</p>
																<span class="donation-time mb-3 d-block">${list.magazineTime }</span>
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- --  06 Art 뉴스.end -->
								
								
								<!-- -- 07 Idol.start -->
						<div class="tab-pane fade" id="comm07">
									<div class="site-section fund-raisers bg-light"  style="padding: 0px" >
										<div class="container ">
											<div
												class="row mb-3 justify-content-center">
												<div class="col-md-8 text-center">
													<h2>Entertainment</h2>
													<p id="subTitle" class="lead">연예</p>
												</div>
											</div>
										</div>
										<div class="container-fluid border-dark box-dashed"
											style="width: 100%; height: 50%;">
											<div style="position: fixed; left: 200px; top: 100px">
												<p>Test</p>
											</div>
											<div class="col-md-12 block-11" style="padding: 0px">
												<div class="nonloop-block-11 owl-carousel"
													style="padding: 0px">
													<c:forEach var="list" items="${EnterIdol}"
														varStatus="status">

														<div class="card fundraise-item border border-dark"
															style="width: 100%; height: 100%">

															<a href="${list.magazineLink }"><img
																class="card-img-top" src="${list.magazineImage}"
																onerror="this.src='/image/toyouNoimage.PNG'"></a>

															<div class="card-body">
																<h6 class="card-title">
																	<a href="${list.magazineLink }"><small>${list.magazineTitle }</small></a>
																</h6>
																<p class="card-text">${list.magazineWriter }</p>
																<span class="donation-time mb-3 d-block">${list.magazineTime }</span>
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- --  07 Idol 뉴스.end -->
								
								
								
								
								
								
								<!-- -- 08 건강.start -->
						<div class="tab-pane fade" id="comm08">
									<div class="site-section fund-raisers bg-light"  style="padding: 0px" >
										<div class="container ">
											<div
												class="row mb-3 justify-content-center">
												<div class="col-md-8 text-center">
													<h2>Health</h2>
													<p id="subTitle" class="lead">건강</p>
												</div>
											</div>
										</div>
										<div class="container-fluid border-dark box-dashed"
											style="width: 100%; height: 50%;">
											<div style="position: fixed; left: 200px; top: 100px">
												<p>Test</p>
											</div>
											<div class="col-md-12 block-11" style="padding: 0px">
												<div class="nonloop-block-11 owl-carousel"
													style="padding: 0px">
													<c:forEach var="list" items="${Health}"
														varStatus="status">

														<div class="card fundraise-item border border-dark"
															style="width: 100%; height: 100%">

															<a href="${list.magazineLink }"><img
																class="card-img-top" src="${list.magazineImage}"
																onerror="this.src='/image/toyouNoimage.PNG'"></a>

															<div class="card-body">
																<h6 class="card-title">
																	<a href="${list.magazineLink }"><small>${list.magazineTitle }</small></a>
																</h6>
																<p class="card-text">${list.magazineWriter }</p>
																<span class="donation-time mb-3 d-block">${list.magazineTime }</span>
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- -- 08 건강 뉴스.end -->
								
								
								<!-- -- 09 과학기술.start -->
						<div class="tab-pane fade" id="comm09">
									<div class="site-section fund-raisers bg-light"  style="padding: 0px" >
										<div class="container ">
											<div
												class="row mb-3 justify-content-center">
												<div class="col-md-8 text-center">
													<h2>Science</h2>
													<p id="subTitle" class="lead">과학기술</p>
												</div>
											</div>
										</div>
										<div class="container-fluid border-dark box-dashed"
											style="width: 100%; height: 50%;">
											<div style="position: fixed; left: 200px; top: 100px">
												<p>Test</p>
											</div>
											<div class="col-md-12 block-11" style="padding: 0px">
												<div class="nonloop-block-11 owl-carousel"
													style="padding: 0px">
													<c:forEach var="list" items="${Science}"
														varStatus="status">

														<div class="card fundraise-item border border-dark"
															style="width: 100%; height: 100%">

															<a href="${list.magazineLink }"><img
																class="card-img-top" src="${list.magazineImage}"
																onerror="this.src='/image/toyouNoimage.PNG'"></a>

															<div class="card-body">
																<h6 class="card-title">
																	<a href="${list.magazineLink }"><small>${list.magazineTitle }</small></a>
																</h6>
																<p class="card-text">${list.magazineWriter }</p>
																<span class="donation-time mb-3 d-block">${list.magazineTime }</span>
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- -- 09 과학기술.end -->
								
								
								<!-- -- 10 사업.start -->
						<div class="tab-pane fade" id="comm10">
									<div class="site-section fund-raisers bg-light"  style="padding: 0px" >
										<div class="container ">
											<div
												class="row mb-3 justify-content-center">
												<div class="col-md-8 text-center">
													<h2>Business</h2>
													<p id="subTitle" class="lead">사업</p>
												</div>
											</div>
										</div>
										<div class="container-fluid border-dark box-dashed"
											style="width: 100%; height: 50%;">
											<div style="position: fixed; left: 200px; top: 100px">
												<p>Test</p>
											</div>
											<div class="col-md-12 block-11" style="padding: 0px">
												<div class="nonloop-block-11 owl-carousel"
													style="padding: 0px">
													<c:forEach var="list" items="${Business}"
														varStatus="status">

														<div class="card fundraise-item border border-dark"
															style="width: 100%; height: 100%">

															<a href="${list.magazineLink }"><img
																class="card-img-top" src="${list.magazineImage}"
																onerror="this.src='/image/toyouNoimage.PNG'"></a>

															<div class="card-body">
																<h6 class="card-title">
																	<a href="${list.magazineLink }"><small>${list.magazineTitle }</small></a>
																</h6>
																<p class="card-text">${list.magazineWriter }</p>
																<span class="donation-time mb-3 d-block">${list.magazineTime }</span>
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- -- 10 사업.end -->
								
								
								<!-- -- 11 세계.start -->
						<div class="tab-pane fade" id="comm11">
									<div class="site-section fund-raisers bg-light"  style="padding: 0px" >
										<div class="container ">
											<div
												class="row mb-3 justify-content-center">
												<div class="col-md-8 text-center">
													<h2>World</h2>
													<p id="subTitle" class="lead">세계</p>
												</div>
											</div>
										</div>
										<div class="container-fluid border-dark box-dashed"
											style="width: 100%; height: 50%;">
											<div style="position: fixed; left: 200px; top: 100px">
												<p>Test</p>
											</div>
											<div class="col-md-12 block-11" style="padding: 0px">
												<div class="nonloop-block-11 owl-carousel"
													style="padding: 0px">
													<c:forEach var="list" items="${World}"
														varStatus="status">

														<div class="card fundraise-item border border-dark"
															style="width: 100%; height: 100%">

															<a href="${list.magazineLink }"><img
																class="card-img-top" src="${list.magazineImage}"
																onerror="this.src='/image/toyouNoimage.PNG'"></a>

															<div class="card-body">
																<h6 class="card-title">
																	<a href="${list.magazineLink }"><small>${list.magazineTitle }</small></a>
																</h6>
																<p class="card-text">${list.magazineWriter }</p>
																<span class="donation-time mb-3 d-block">${list.magazineTime }</span>
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- --  11 세계.end -->
								
								
								
							</div>
						</div>
						


					</div>
				
			</div>
			</div>







	<!-- Footer -->
	
	<%@ include file="layout/Menu.jsp"%>
<%@ include file="layout/footer.jsp"%>
	<%-- 
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true"></jsp:include>
 --%>
	<!-- Footer -->

</body>
</html>