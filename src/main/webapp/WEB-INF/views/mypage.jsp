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
<body>


<c:choose>
	<c:when test="${!empty checkChannel }">
		<c:choose>
			<c:when test="${empty userChannelName }">
				<script>
				  location.href='/mypageLoading'
				</script>
				
				
			</c:when>
			<c:otherwise>
				<!--  채널 정보가 있는 사용자 UI 출력 -->
				
			
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
		<!-- 채널을 등록해야 사용할 수 있는 기능입니다. -->
	</c:otherwise>

</c:choose>
	<!------Header-------->
	<%@ include file="layout/header.jsp"%>
	<%-- 
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true"></jsp:include> --%>
	<!------Header-------->
	<div class="block-31" style="position: relative;">
		<div class="owl-carousel loop-block-31 ">
			<div class="block-30 block-30-sm item"
				style="background-image: url('${userInfo.chBanner}');"
				data-stellar-background-ratio="0.5">
				<div class="container">
					<div
						class="row align-items-center justify-content-center text-center">
						<div class="col-md-7">
							<h2 class="heading mb-5">${userChannelName }</h2>
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

	<!---------------------------------- Tab MENU----------------------------------->

	<div class="site-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<c:choose>

						<c:when test="${empty userChannelLink}">
							<div class="container">
								<div class="row commu">
									<h3 class="col-12">${userName }님, 채널을 등록해보세요!</h3>


									<div class="col-md-12 col-lg-12 md-5">
										<div class="person-donate text-left"></div>
									</div>

								</div>
							</div>



						</c:when>
						<c:otherwise>

							<div class="row commu">
								<h3 class="col-12">어서오세요 ${userName } 님!</h3>
								<br> <br> <br>
								<div class="col-md-3 col-lg-3 mb-3">

									<div class="person-donate text-center">
										<img src="${ userChannelImg}" alt="Image placeholder"
											class="img-left">

									</div>

								</div>
								<div class="col-md-9 col-lg-9 mb-9">
									<h2>${userChannelName }</h2>
									<span class="time d-block mb-3 text-danger">${userSubscriber }</span>
									<p>${userInfo.chExplain }</p>
									<h4>SNS</h4>
									<p>
										<c:forEach items="${iconLinkList}" var="item"
											varStatus="status">
											<a href="${snsLinkList[status.index] }"><img
												style="width: 30px; height: 30px;"
												src="${iconLinkList[status.index]} " alt="profile"
												class="img-responsive img-circle"></a>
										</c:forEach>
									</p>



								</div>
							</div>

						</c:otherwise>

					</c:choose>
					<ul class="nav nav-tabs">
						<!-- tab.start -->
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#comm01">채널관리</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#comm02">커뮤니티관리</a></li>
						
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#comm04">개인정보관리</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#comm05">결제 대시보드</a></li>
					</ul>
					<!-- tab.end -->

					<!------------------------------- Tab contents START------------------------------->
					<div class="tab-content">
						<!-- -- 01 채널관리 탭 컨텐츠.start -->
						<div class="tab-pane fade show active" id="comm01">
							<c:choose>

								<c:when test="${empty userChannelLink}">
									<div class="container">
										<div class="row commu">
											<h3 class="col-12">채널을 등록해야 이용할 수 있어요!</h3>
											<div class="col-md-12 col-lg-12 md-5">
												<div class="person-donate text-left"></div>
											</div>
										</div>
									</div>




						</c:when>

						<c:otherwise>

							<div class="row commu">
								<h3 class="col-12">나의 최신 동영상</h3>
								<br> <br> <br>
								<c:forEach items="${lastmovieLink}" var="item"
									varStatus="status">
									<div class="col-md-5 col-lg-5 mb-5">

										<div class="embed-responsive embed-responsive-21by9">
											<iframe class="embed-responsive-item" width="840"
												height="473" src="${lastmovieLink[status.index] }"
												frameborder="1" allow="autoplay; encrypted-media"
												allowfullscreen></iframe>
										</div>

									</div>
									<div class="col-md-7 col-lg-7 mb-7">
										<h4>${lastmovieTitle[status.index] }</h4>
										<span class="time d-block mb-3 text-danger">${lastmovieTime[status.index] }
											| ${lastmovieView[status.index] }</span> <br>
										<div class="row">
											<div class="col-6">
												<h5 class="text-danger" style="display: inline">싫어요!</h5>
											</div>
											<div class="col-6" align="right">
												<h5 class="text-success text-right" style="display: inline">좋아요!</h5>
											</div>

										</div>
										<c:choose>

											<c:when
												test="${lastmovieCommentAnalysis[status.index] > 80 }">
												<div class="progress" style="height: 20px">
													<div class="progress-bar bg-success"
														style="width:${lastmovieCommentAnalysis[status.index]}%;height:20px">
														아주 좋아요!</div>
												</div>
											</c:when>

											<c:when
												test="${lastmovieCommentAnalysis[status.index] > 75 }">
												<div class="progress" style="height: 20px">
													<div class="progress-bar bg-info"
														style="width:${lastmovieCommentAnalysis[status.index]}%;height:20px">
														그럭저럭 좋아요!</div>
												</div>
											</c:when>

											<c:when
												test="${lastmovieCommentAnalysis[status.index] > 60 }">
												<div class="progress" style="height: 20px">
													<div class="progress-bar bg-warning"
														style="width:${lastmovieCommentAnalysis[status.index]}%;height:20px">
														보통이에요!</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="progress" style="height: 20px">
													<div class="progress-bar bg-danger"
														style="width:${lastmovieCommentAnalysis[status.index]}%;height:20px">
														음 이건 좀..!</div>
												</div>
											</c:otherwise>

										</c:choose>

										<hr>
									</div>

								</c:forEach>

							</div>

							<div class="row commu">
								<h3 class="col-12">나의 인기 동영상</h3>
								<br> <br> <br>
								<c:forEach items="${famousmovieLink}" var="item"
									varStatus="status">
									<div class="col-md-5 col-lg-5 mb-5">

										<div class="embed-responsive embed-responsive-21by9">
											<iframe class="embed-responsive-item" width="840"
												height="473" src="${famousmovieLink[status.index] }"
												frameborder="1" allow="autoplay; encrypted-media"
												allowfullscreen></iframe>
										</div>

									</div>
									<div class="col-md-7 col-lg-7 mb-7">
										<h4>${famousmovieTitle[status.index] }</h4>
										<span class="time d-block mb-3 text-danger">${famousmovieTime[status.index] }
											| ${famousmovieView[status.index] }</span> <br>
										<div class="row">
											<div class="col-6">
												<h5 class="text-danger" style="display: inline">싫어요!</h5>
											</div>
											<div class="col-6" align="right">
												<h5 class="text-success text-right" style="display: inline">좋아요!</h5>
											</div>

										</div>
										<c:choose>

											<c:when
												test="${famousmovieCommentAnalysis[status.index] > 80 }">
												<div class="progress" style="height: 20px">
													<div class="progress-bar bg-success"
														style="width:${famousmovieCommentAnalysis[status.index]}%;height:20px">
														아주 좋아요!</div>
												</div>
											</c:when>

											<c:when
												test="${famousmovieCommentAnalysis[status.index] > 75 }">
												<div class="progress" style="height: 20px">
													<div class="progress-bar bg-info"
														style="width:${famousmovieCommentAnalysis[status.index]}%;height:20px">
														그럭저럭 좋아요!</div>
												</div>
											</c:when>

											<c:when
												test="${famousmovieCommentAnalysis[status.index] > 60 }">
												<div class="progress" style="height: 20px">
													<div class="progress-bar bg-warning"
														style="width:${famousmovieCommentAnalysis[status.index]}%;height:20px">
														보통이에요!</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="progress" style="height: 20px">
													<div class="progress-bar bg-danger"
														style="width:${famousmovieCommentAnalysis[status.index]}%;height:20px">
														음 이건 좀..!</div>
												</div>
											</c:otherwise>

										</c:choose>

										<hr>
									</div>

								</c:forEach>
							</div>
						</c:otherwise>


						</c:choose>
					</div>
					<!-- -- 01 채널관리 탭 컨텐츠.end -->

					<!-- -- 02 커뮤니티관리 탭 컨텐츠.start -->
					<div class="tab-pane fade" id="comm02">
						<div class="container">
							<div class="row">
								<div class="col-md-12 text-center cate_rec_title">


									<h4 class="title_m_tx text-left">
										커뮤니티관리
										<div class="form-row float-right">
											<a href='/communityCreate'><button type="button"
													class="btn btn-default">커뮤니티 생성</button></a>
									</h4>
								</div>

								<div class="container">
								<hr>
								<br>
								<h5>내가 만든 커뮤니티 목록</h5>
									<div class="row">
								
								<c:choose>
	
											<c:when test="${!empty myCommunity}">
												<c:forEach items="${myCommunity}" var="item" varStatus="status">
										
										
												<div class="card col-5" style="width: 18rem;">
												<a href='/auth/community/community?communityNo=${myCommunity[status.index].communityNo }'>
											  <img class="card-img-top mt-3" src="${bannerCommunity[status.index] }" alt="Card image cap">
											  <div class="card-body">
											    <h5 class="card-title">${myCommunity[status.index].communityTitle }</h5>
											    <p class="card-text">${myCommunity[status.index].communityDescription}</p>
											  </div>
											  <ul class="list-group list-group-flush">
											    <li class="list-group-item">${userName}</li>
											    <li class="list-group-item">${ countCommunity[status.index]+1} 명</li>
											    <li class="list-group-item">${myCommunity[status.index].communityCreatedate }</li>
											  </ul>
											  
											  	<p>
											  	<c:forEach items="${tagCommunityList[status.index]}" var="list" varStatus="k">
											  	<c:choose>
	
											<c:when test="${k.index == 0}">
												<strong style="background-color:#BEEBFD">#${list }</strong>
											</c:when>
											<c:when test="${k.index == 1}">
												<strong style="background-color:#DFD4E4">#${list }</strong>
											</c:when>
											<c:when test="${k.index == 2}">
												<strong style="background-color:#FCFFB0">#${list }</strong>
											</c:when>
											<c:when test="${k.index== 3}">
												<strong style="background-color:#AFFFBA">#${list }</strong>
											</c:when>
											<c:when test="${k.index == 4}">
												<strong style="background-color:#FFAFB0">#${list }</strong>
											</c:when>
											</c:choose>
											  		
											  	</c:forEach>
											  	</p>
											  
											  <div class="card-body">
											    <a href="#" class="card-link">${userChannelName}</a>
											  </div>
											  </a>
											</div>
											<div class="col-1"></div>
											
											</c:forEach>	
											
											</c:when>
											
								</c:choose>
									
																
									

									</div>
									
									
									
							<hr>
								<br>
								<h5>내가 가입한 커뮤니티 목록</h5>
									<div class="row">
								<c:choose>
	
											<c:when test="${!empty otherCommunityList}">
												<c:forEach items="${otherCommunityList}" var="item" varStatus="status">
													
										
												<div class="card col-5" style="width: 18rem;">
												<a href='/auth/community/community?communityNo=${otherCommunityList[status.index].communityNo }'>
											  <img class="card-img-top mt-3" src="${otherCommunityHostList[status.index].chBanner }" alt="Card image cap">
											  <div class="card-body">
											    <h5 class="card-title">${otherCommunityList[status.index].communityTitle }</h5>
											    <p class="card-text">${otherCommunityList[status.index].communityDescription}</p>
											  </div>
											  <ul class="list-group list-group-flush">
											    <li class="list-group-item">${otherCommunityHostList[status.index].chTitle}</li>
											    <li class="list-group-item">${ countOtherCommunity[status.index]+1} 명</li>
											    <li class="list-group-item">${otherCommunityList[status.index].communityCreatedate }</li>
											  </ul>
											  <p>
											  	<c:forEach items="${tagOtherCommunityList[status.index]}" var="list" varStatus="k">
											  	<c:choose>
	
											<c:when test="${k.index == 0}">
												<strong style="background-color:#BEEBFD">#${list }</strong>
											</c:when>
											<c:when test="${k.index == 1}">
												<strong style="background-color:#DFD4E4">#${list }</strong>
											</c:when>
											<c:when test="${k.index == 2}">
												<strong style="background-color:#FCFFB0">#${list }</strong>
											</c:when>
											<c:when test="${k.index== 3}">
												<strong style="background-color:#AFFFBA">#${list }</strong>
											</c:when>
											<c:when test="${k.index == 4}">
												<strong style="background-color:#FFAFB0">#${list }</strong>
											</c:when>
											</c:choose>
											  		
											  	</c:forEach>
											  	</p>
											  
											  <div class="card-body">
											    <a href="#" class="card-link">${otherCommunityHostList[status.index].chTitle}</a>
											  </div>
											  </a>
											</div>
											<div class="col-1"></div>
											
											</c:forEach>	
											
											</c:when>
											
								</c:choose>
									
																
									

									</div>
									</div>

								</div>
							</div>
						</div>

					<!-- -- 02 커뮤니티관리 탭 컨텐츠.end -->

					


					<!-- -- 04 개인정보관리 탭 컨텐츠.start -->
					<div class="tab-pane fade show " id="comm04">

							<div class="container">

								<div class="row">
									<div class="col-md-12 text-center cate_rec_title">
										<h4 class="title_m_tx text-left">개인정보관리</h4>

										<div class="container">
											<div class="row">
												<div class="col-md-6 idpw">
													<div class="card bg-light ">
														<article class="card-body mx-auto"
															style="max-width: 1000px;">
															<h5 class="card-title mt-3 text-left">회원정보 수정</h5>
															<!-- 																<p class="text-center">Get started with your free
																	account</p> -->
															<!-- 																<p>
																	<a
																		href="https://kauth.kakao.com/oauth/authorize?client_id=9678b56f9afb8f96a880f7b1bdaee036&redirect_uri=http://localhost:8003/auth/kakao/callback&response_type=code"
																		class="btn btn-block btn-twitter"> <i
																		class="fab fa-twitter"></i>   Login via kakao
																	</a>
																</p> -->
															<!-- 																<p class="divider-text">
																	<span class="bg-light">OR</span>
																</p> -->
															<c:choose>
																<c:when test="${principal.user.oauth != 'kakao' }">
																	<form>
																		<div class="form-group input-group">
																			<div class="input-group-prepend">
																				<span class="input-group-text"><h5 class="mypageinfotext">ID</h5></i>
																				</span>
																			</div>
																			<input class="form-control" name="userNo" id="userNo"
																				placeholder="ID" type="hidden" value="${principal.user.userNo }" disabled="disabled">
																			<input class="form-control" name="userId" id="userId"
																				placeholder="ID" type="text" value="${principal.user.userId }" disabled="disabled">
																		</div>
																		<!-- form-group// -->
																		<div class="form-group input-group">
																			<div class="input-group-prepend">
																				<span class="input-group-text"><h5 class="mypageinfotext">새로운 비밀번호</h5></i>
																				</span>
																			</div>
																			<input class="form-control" name="userPassword"
																				id="userPassword" placeholder="Create password"
																				type="password">
																		</div>
																		<!-- form-group// -->
																		<div class="form-group input-group">
																			<div class="input-group-prepend">
																				<span class="input-group-text"><h5 class="mypageinfotext">새로운 비밀번호 확인</h5></i>
																				</span>
																			</div>
																			<input class="form-control" name="passwdCheck"
																				id="passwdCheck" placeholder="Repeat password"
																				type="password">
																		</div>
																		<!-- form-group// -->
																		<div class="form-group input-group">
																			<div class="input-group-prepend">
																				<span class="input-group-text"><h5 class="mypageinfotext">이름</h5></i>
																				</span>
																			</div>	
																			<input class="form-control" name="userName"
																				id="userName" placeholder="Name" value="${principal.user.userName }" type="text">
																		</div>
																		<!-- form-group// -->
																		<div class="form-group input-group">
																			<div class="input-group-prepend">
																				<span class="input-group-text"><h5 class="mypageinfotext">이메일</h5></i>
																				</span>
																			</div>
																			<input class="form-control" name="userEmail"
																				id="userEmail" placeholder="Email address" value="${principal.user.userEmail }"
																				type="email">
																		</div>
																		<!-- form-group// -->
																		<div class="form-group input-group">
																			<div class="input-group-prepend">
																				<span class="input-group-text"><h5 class="mypageinfotext">나의 유튜브 채널</h5></i>
																				</span>
																			</div>
																			<input class="form-control" id="userChannelName" name="userChannelName" value="${userChannelName }" type="text" readonly>
																				</div>
																		<div class="form-group input-group">
																			<div class="input-group-prepend">
																				<span class="input-group-text"><h5 class="mypageinfotext">내 채널 변경</h5></i>
																				</span>
																			</div>
																			<input class="form-control" name="userChannelLink"
																				id="userChannelLink" placeholder="Your Youtube"
																				type="search"> 
																				
																				<input type="button"
																				class="btn btn-primary btn-block"
																				id="searchMyChennel" style="width: 50px;" value="검색" />
																		</div>
																		
																		<div id="chResult">	</div>
																	
																		<div class="form-group input-group">
																			<div class="input-group-prepend">
																				<span class="input-group-text"><h5 class="mypageinfotext">유튜브 카테고리</h5></i>
																				</span>
																			</div>
																			<select id="userChannelCategory">
																				<option value="0" >select category</option>
																				<option value="1" <c:if test="${principal.user.userChannelCategory == 1}">selected</c:if>>영화 & 애니메이션</option>
																				<option value="2" <c:if test="${principal.user.userChannelCategory == 2}">selected</c:if>>자동차 & 오토바이</option>
																				<option value="10"<c:if test="${principal.user.userChannelCategory == 10}">selected</c:if>>음악</option>
																				<option value="17"<c:if test="${principal.user.userChannelCategory == 17}">selected</c:if>>스포츠</option>
																				<option value="19"<c:if test="${principal.user.userChannelCategory == 19}">selected</c:if>>여행 & 이벤트</option>
																				<option value="20"<c:if test="${principal.user.userChannelCategory == 20}">selected</c:if>>게임</option>
																				<option value="22"<c:if test="${principal.user.userChannelCategory == 22}">selected</c:if>>인물 & 블로그</option>
																				<option value="23"<c:if test="${principal.user.userChannelCategory == 23}">selected</c:if>>유머</option>
																				<option value="24"<c:if test="${principal.user.userChannelCategory == 24}">selected</c:if>>가족 엔터테이먼트</option>
																				<option value="25"<c:if test="${principal.user.userChannelCategory == 25}">selected</c:if>>뉴스 & 정치</option>
																				<option value="26"<c:if test="${principal.user.userChannelCategory == 26}">selected</c:if>>노하우 & 스타일</option>
																				<option value="27"<c:if test="${principal.user.userChannelCategory == 27}">selected</c:if>>교육</option>
																				<option value="28"<c:if test="${principal.user.userChannelCategory == 28}">selected</c:if>>과학 & 기술</option>
																				<option value="29"<c:if test="${principal.user.userChannelCategory == 29}">selected</c:if>>비영리 & 사회운동</option>
																			</select>

																		</div>

																		
																																				<!-- form-group// -->
										 								<div class="form-group input-group">
																			<div class="input-group-prepend">
																				<span class="input-group-text"><h5 class="mypageinfotext">나의 롤모델</h5></i>
																				</span>
																			</div>
																			
																			<input class="form-control"
																				type="text" disabled="disabled" value="${principal.user.userRolemodelLink }">
																		</div>
																		
																		
																		<!-- form-group// -->
																		<div class="form-group input-group">
																			<div class="input-group-prepend">
																				<span class="input-group-text"><h5 class="mypageinfotext">롤모델 변경</h5></i>
																				</span>
																			</div>
																			
																			<input class="form-control" name="userRolemodelLink"
																				id="userRolemodelLink" placeholder="Your Role Model"
																				type="text"> 
																				
																				<input type="button"
																				class="btn btn-primary btn-block"
																				id="searchRoleChennel" style="width: 50px;"
																				value="검색" />
																		</div>
																		
																		
																		<div id="chRoleResult"></div>

																	</form>
																		<div class="form-group">
																			<input type="button" id="mypageInfoModify"
																				class="btn btn-primary btn-block"
																				value="수정하기">
																		</div>
																		
																</c:when>
																<c:otherwise>
																	<form>
																		<div class="form-group input-group">
																			<div class="input-group-prepend">
																				<span class="input-group-text"><h5 class="mypageinfotext">ID</h5></i>
																				</span>
																			</div>
																			<input class="form-control" name="userNo" id="userNo"
																				placeholder="ID" type="hidden" value="${principal.user.userNo }" disabled="disabled">
																			<input class="form-control" name="userId" id="userId"
																				placeholder="ID" type="text" value="${principal.user.userId }" disabled="disabled">
																		</div>
																			<input class="form-control" name="userPassword"
																				id="userPassword" placeholder="Create password"
																				type="hidden"  value="toyou1234!">
																			<input class="form-control" name="passwdCheck"
																				id="passwdCheck" placeholder="Repeat password"
																				type="hidden" value="toyou1234!">
																		<!-- form-group// -->
																		<div class="form-group input-group">
																			<div class="input-group-prepend">
																				<span class="input-group-text"><h5 class="mypageinfotext">이름</h5></i>
																				</span>
																			</div>	
																			<input class="form-control" name="userName"
																				id="userName" placeholder="Name" value="${principal.user.userName }" type="text">
																		</div>
																		<!-- form-group// -->
																		<div class="form-group input-group">
																			<div class="input-group-prepend">
																				<span class="input-group-text"><h5 class="mypageinfotext">이메일</h5></i>
																				</span>
																			</div>
																			<input class="form-control" name="userEmail"
																				id="userEmail" placeholder="Email address" value="${principal.user.userEmail }"
																				type="email">
																		</div>
																		<!-- form-group// -->
																		<div class="form-group input-group">
																			<div class="input-group-prepend">
																				<span class="input-group-text"><h5 class="mypageinfotext">나의 유튜브 채널</h5></i>
																				</span>
																			</div>
																			<input class="form-control" id="userChannelName" name="userChannelName" value="${userChannelName }" type="text" readonly>
																				</div>
																		<div class="form-group input-group">
																			<div class="input-group-prepend">
																				<span class="input-group-text"><h5 class="mypageinfotext">내 채널 변경</h5></i>
																				</span>
																			</div>
																			<input class="form-control" name="userChannelLink"
																				id="userChannelLink" placeholder="Your Youtube"
																				type="search"> 
																				
																				<input type="button"
																				class="btn btn-primary btn-block"
																				id="searchMyChennel" style="width: 50px;" value="검색" />
																		</div>
																		
																		<div id="chResult">	</div>
																	
																		<div class="form-group input-group">
																			<div class="input-group-prepend">
																				<span class="input-group-text"><h5 class="mypageinfotext">유튜브 카테고리</h5></i>
																				</span>
																			</div>
																			<select id="userChannelCategory">
																				<option value="0" >select category</option>
																				<option value="1" <c:if test="${principal.user.userChannelCategory == 1}">selected</c:if>>영화 & 애니메이션</option>
																				<option value="2" <c:if test="${principal.user.userChannelCategory == 2}">selected</c:if>>자동차 & 오토바이</option>
																				<option value="10"<c:if test="${principal.user.userChannelCategory == 10}">selected</c:if>>음악</option>
																				<option value="17"<c:if test="${principal.user.userChannelCategory == 17}">selected</c:if>>스포츠</option>
																				<option value="19"<c:if test="${principal.user.userChannelCategory == 19}">selected</c:if>>여행 & 이벤트</option>
																				<option value="20"<c:if test="${principal.user.userChannelCategory == 20}">selected</c:if>>게임</option>
																				<option value="22"<c:if test="${principal.user.userChannelCategory == 22}">selected</c:if>>인물 & 블로그</option>
																				<option value="23"<c:if test="${principal.user.userChannelCategory == 23}">selected</c:if>>유머</option>
																				<option value="24"<c:if test="${principal.user.userChannelCategory == 24}">selected</c:if>>가족 엔터테이먼트</option>
																				<option value="25"<c:if test="${principal.user.userChannelCategory == 25}">selected</c:if>>뉴스 & 정치</option>
																				<option value="26"<c:if test="${principal.user.userChannelCategory == 26}">selected</c:if>>노하우 & 스타일</option>
																				<option value="27"<c:if test="${principal.user.userChannelCategory == 27}">selected</c:if>>교육</option>
																				<option value="28"<c:if test="${principal.user.userChannelCategory == 28}">selected</c:if>>과학 & 기술</option>
																				<option value="29"<c:if test="${principal.user.userChannelCategory == 29}">selected</c:if>>비영리 & 사회운동</option>
																			</select>

																		</div>

																		
																																				<!-- form-group// -->
										 								<div class="form-group input-group">
																			<div class="input-group-prepend">
																				<span class="input-group-text"><h5 class="mypageinfotext">나의 롤모델</h5></i>
																				</span>
																			</div>
																			
																			<input class="form-control"
																				type="text" disabled="disabled" value="${principal.user.userRolemodelLink }">
																		</div>
																		
																		
																		<!-- form-group// -->
																		<div class="form-group input-group">
																			<div class="input-group-prepend">
																				<span class="input-group-text"><h5 class="mypageinfotext">롤모델 변경</h5></i>
																				</span>
																			</div>
																			
																			<input class="form-control" name="userRolemodelLink"
																				id="userRolemodelLink" placeholder="Your Role Model"
																				type="text"> 
																				
																				<input type="button"
																				class="btn btn-primary btn-block"
																				id="searchRoleChennel" style="width: 50px;"
																				value="검색" />
																		</div>
																		
																		
																		<div id="chRoleResult"></div>

																	</form>
																		<div class="form-group">
																			<input type="button" id="mypageInfoModify"
																				class="btn btn-primary btn-block"
																				value="수정하기">
																		</div>                                                          
																</c:otherwise>
															</c:choose>
														</article>
													</div>
													<!-- card.// -->


													<!--container end.//-->

												</div>
												<!-- 	<div class="col-md-6">그래프2</div> -->
											</div>

<!-- 											<div class="row">
												<div class="col-md-6 idpw"></div>
												<div class="col-md-6">그래프2</div>
											</div>

 -->
											<div class="row float-right">
												<p>
													<button type="button" id="deleteBtn" class="btn btn-danger btn-block bte">회원탈퇴</button>
												</p>
											</div>
											
										</div>
									</div>
								</div>
							</div>
						</div>
					<!-- -- 04 개인정보관리 탭 컨텐츠.end -->


					<!-- -- 05 결제 대시보드 탭 컨텐츠.start -->
					<div class="tab-pane fade" id="comm05">
						<div class="container">
							<div class="row">
								<div class="col-md-12 text-center cate_rec_title">
									<!-- 성연추가 -->


									<br>

									<h4 class="title_m_tx text-center">${principal.user.userName}님의 결제 대시보드</h4>

									<br>
									<div class="container">

										<div class="row">
											<!-- 사용중인 등급 / 전체 유저의 사용 서비스 조회 시작 -->

											<!-- 사용중인 등급 시작-->
											<div class="col-sm-6">
												<table class="table table-sm col-md-1 text-center">
													<thead class="thead-light">
														<tr>
															<th scope="col">사용중인 등급</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td scope="row">
																<c:if test="${payInfo == 0}">
																	<h1>BASIC</h1>
																</c:if> 
																<c:if test="${payInfo == 1}">
																	<h1>STANDARD</h1>
																</c:if> 
																<c:if test="${payInfo == 2}">
																	<h1>STARTUP</h1>
																</c:if> 
																<c:if test="${payInfo == 3}">
																	<h1>PROFESSIONAL</h1>
																</c:if>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
											<!-- 사용중인 등급 종료 -->

											<!-- 전체 유저의 사용 서비스 조회 시작 -->
											<div class="col-sm-6">
												<table class="table table-sm col-md-1 text-center">
													<thead class="thead-light">
														<tr>
															<th scope="col">전체 회원의 구독 현황</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td scope="row">
																<iframe src="http://192.168.56.105:5601/app/dashboards#/view/a1a6e000-258c-11ec-9509-533be27e5eec?embed=true&_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(description:%EA%B5%AC%EB%8F%85%EC%9E%90%ED%98%84%ED%99%A9,filters:!(),fullScreenMode:!f,options:(hidePanelTitles:true,useMargins:!t),query:(language:kuery,query:''),timeRestore:!t,title:%EA%B5%AC%EB%8F%85%EC%9E%90%ED%98%84%ED%99%A9,viewMode:view)&hide-filter-bar=true" height="330" width="330" frameborder="0"></iframe>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
											<!-- 전체 유저의 사용 서비스 조회 종료 -->
										</div>
										<!-- 사용중인 등급 / 전체 유저의 사용 서비스 조회 종료 -->

										<!-- 결제내역조회 시작 -->
										<div class="row">
											<div class="col-sm-12 text-center">
												<div class="table title">
													<h4 class="mid-title-thin">결제내역조회</h4>
												</div>
												<table class="table table-sm col-md-7">
													<thead class="thead-light">
														<tr>
															<th scope="col">승인번호</th>
															<th scope="col">구매정보</th>
															<th scope="col">결제금액</th>
															<th scope="col">결제시간</th>
															<th scope="col">납부확인</th>
														</tr>
													</thead>
													<tbody id="hungryList">

														<c:forEach items="${productBuyLogList}" var="list">

															<tr>
																<th scope="row">${list.productBuyLogNo}</th>
																<td>
																	<c:set var="TextValue" value="${list.productBuyLogDate }" />
																		${fn:substring(TextValue,2,4) }년
																		${fn:substring(TextValue,5,7) }월&nbsp; 
																	<span style="color: red"> 
																		<c:if test='${list.productNo == "1"}'>${Name1 }</c:if> 
																		<c:if test='${list.productNo == "2"}'>${Name2 }</c:if> 
																		<c:if test='${list.productNo == "3"}'>${Name3 }</c:if>
																	</span>&nbsp; 1개월
																</td>
																<td>
																	<c:set var="Price1Value" value="${Price1 }" />
																	<c:set var="Price2Value" value="${Price2 }" />
																	<c:set var="Price3Value" value="${Price3 }" />
																	<c:if test='${list.productNo == "1"}'>${fn:substring(Price1Value,0,2)},${fn:substring(Price1Value,2,5)}원</c:if>
																	<c:if test='${list.productNo == "2"}'>${fn:substring(Price2Value,0,2)},${fn:substring(Price2Value,2,5)}원</c:if>
																	<c:if test='${list.productNo == "3"}'>${fn:substring(Price3Value,0,2)},${fn:substring(Price3Value,2,5)}원</c:if>
																</td>
																<td>${fn:substring(TextValue,0,16) }</td>
																<td>Done</td>
															</tr>
														</c:forEach>


													</tbody>
												</table>
											</div>
										</div>
										<!-- 결제내역조회 종료 -->
									</div>
								</div>


								<!-- 성연추가 -->
							</div>
						</div>
					</div>

					<!-- -- 05 결제 대시보드 탭 컨텐츠.end -->
					<!-- -- 05 결제 대시보드 탭 컨텐츠.end -->
				</div>
			</div>
		</div>
	</div>


	</div>



<%@ include file="layout/footer.jsp"%>
<%@ include file="layout/Menu.jsp"%>
<!-- Footer -->
	<%-- 
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true"></jsp:include>
 --%>
	<!-- Footer -->
	<script type="text/javascript">
		$(document).ready(function() {

							var idCheck = 0;
							var chSearchCheck = 1;
							var chRoleSelectCheck = 1;

							function checkform() {
								var userPwCheck = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,20}$/);
								var userNameCheck = RegExp(/^[ㄱ-ㅎ가-힣a-zA-Z]{1,10}$/);
								/*  RegExp(/^[A-Za-z0-9]{8,20}$/); */
								var userPassword = $("#userPassword").val();
								var passwdCheck = $("#passwdCheck").val();
								var userName = $("#userName").val();
								var userEmail = $("#userEmail").val();
								var userChannelLink = $(".chSelect").attr(
										"data");
								var userRolemodelLink = $(".chRoleSelect").attr("data");

								if (userPassword == "") {
									alert("패스워드를 입력해주세요");
									return false;
								}
								if (!userPwCheck.test(userPassword)) {
									alert("(패스워드 양식 오류) - [영어 소문자, 숫자와 특수기호 필히 입력],[8~20 자리]")
									return false;
								}

								if (passwdCheck == "") {
									alert("패스워드 확인을 입력해주세요");
									return false;
								}
								if (passwdCheck != userPassword) {
									alert("(패스워드가 동일하지 않습니다.")
									return false;
								}
								if (userName == "") {
									alert("이름을 입력하세요");
									return false;
								}
								if (!userNameCheck.test(userName)) {
									alert("(이름 양식 오류) - [한글/영어로 된 이름을 입력하세요]");
									return false;
								}
								if (userEmail == "") {
									alert("이메일을 입력해주세요")
									return false;
								}
								if (chSearchCheck != 1) {
									alert("채널을 선택해주세요")
									return false;
								}
								if (chRoleSelectCheck != 1) {
									alert("롤모델을 선택해주세요")
									return false;
								}

								if (!(typeof userChannelLink == "undefined" && typeof userRolemodelLink == "undefined")) {
									if (userChannelLink == userRolemodelLink) {
										alert("본인 채널과 롤모델을 다르게 선택하세요");
										chRoleSelectCheck = 0;
										return false
									}
								}

								return true;

							}

							//	유튜브 채널 검색 메소드
							$("#searchMyChennel")
									.click(
											function() {
												var userChannelLink = $("#userChannelLink").val()
												$("#chResult").empty()
												if (userChannelLink == ""
														|| userChannelLink == null) {
													alert("검색어를 입력해주세요")
												} else {
													$.ajax({
														url : "/user/searchChannel",
														type : "get",
														data : {
														keyword : userChannelLink
														},
														beforeSend : function() {
																	$('#chResult').empty();
																	$('#chResult').append();
														},
														success : function(contents) { // 채널을 리스트로 받아옴
																	chSearchCheck = 0;
																	if (contents != null) {
																		var str = '<table class="table table-bordered">';
																		for (var i = 0; i < contents.length; i++) {
																			var content = contents[i]
																					.split("!@#");
																			str += '<tr class="chSelect" data="'+content[2]+'">';
																			str += '<td><img style="width:40px;height:40px;" src="'+content[0]+'"/></td>';
																			str += '<td>'
																					+ content[1]
																					+ "</td>";
																			str += '<td>'
																					+ content[3]
																					+ "</td>";
																			str += '</tr>';
																		}
																		str += '</table>';
																		$('#chResult')
																				.append(str);
																	} else {
																		alert('검색결과가 없습니다.');
																	}
																},
																error : function() {
																	alert("서버에러");
																}
															});
												}
											})
													
										
											

							// 롤모델! 
							$("#searchRoleChennel").click(
											function() {
												var userRolemodelLink = $("#userRolemodelLink").val()
												$("#chRoleResult").empty()
												if (userRolemodelLink == "" || userRolemodelLink == null) {
													alert("검색어를 입력해주세요")
												} else {
													$.ajax({
														url : "/user/searchChannel",
														type : "get",
														data : {
														keyword : userRolemodelLink
														},

														success : function(contents) { // 채널을 리스트로 받아옴
																	chRoleSelectCheck = 0;
																	if (contents != null) {
																		var str = '<table class="table table-bordered">';
																		for (var i = 0; i < contents.length; i++) {
																			var content = contents[i]
																					.split("!@#");
																			str += '<tr class="chRoleSelect" data="'+content[2]+'">';
																			str += '<td><img style="width:40px;height:40px;" src="'+content[0]+'"/></td>';
																			str += '<td>'
																					+ content[1]
																					+ "</td>";
																			str += '<td>'
																					+ content[3]
																					+ "</td>";
																			str += '</tr>';
																		}
																		str += '</table>';
																		$(
																				'#chRoleResult')
																				.append(
																						str);
																	} else {
																		alert('검색결과가 없습니다.');
																	}
																},
																error : function() {
																	alert("서버에러");
																}
															});
												}
											})

							$(document).on("click",".chSelect",	function() {
												var link = $(this).attr("data")
												var img = $(this).find("img").attr("src")
												var title = $(this).find("td").eq(1).text()
												var subscriber = $(this).find("td").eq(2).text()

												$("#chResult").empty()
												var str = '<table class="table table-bordered">'
												str += '<tr class="chSelect" data="'+link+'">';
												str += '<td><img id="userChannelImg" style="width:40px;height:40px;" src="'+img+'"/></td>';
												str += '<td  id="userChannelName">'
														+ title + "</td>";
												str += '<td id="userSubscriber">'
														+ subscriber + "</td>";
												str += '</tr>';
												str += '</table>'
												$('#chResult').append(str);
												chSearchCheck = 1;
											})

							// 롤모델 리스트 클릭시
							$(document).on("click",".chRoleSelect",function() {
												var link = $(this).attr("data")
												var img = $(this).find("img")
														.attr("src")
												var title = $(this).find("td")
														.eq(1).text()
												var subscriber = $(this).find(
														"td").eq(2).text()

												$("#chRoleResult").empty()
												var str = '<table class="table table-bordered">'
												str += '<tr class="chRoleSelect" data="'+link+'">';
												str += '<td><img style="width:40px;height:40px;" src="'+img+'"/></td>';
												str += '<td>' + title + "</td>";
												str += '<td>' + subscriber
														+ "</td>";
												str += '</tr>';
												str += '</table>'
												$('#chRoleResult').append(str);
												chRoleSelectCheck = 1;
											})

							

							//  회원정보수정 버튼 #mypageInfoModify 클릭시 이벤트
							$(document).on("click","#mypageInfoModify",function() {
												var userNo = $("#userNo").val();
												var userId = $("#userId").val();
												var userPassword = $("#userPassword").val();
												var passwdCheck = $("#passwdCheck").val();
												var userName = $("#userName").val();
												var userEmail = $("#userEmail").val();
												var userChannelLink = $(".chSelect").attr("data");
												var userSubscriber = $("#userSubscriber").text();
												var userChannelCategory = $("#userChannelCategory").val();
												var userRolemodelLink = $(".chRoleSelect").attr("data");
												var userChannelImg = $("#userChannelImg").attr("src")
												var userChannelName = $("#userChannelName").val();
												// 위의 조건을 다 만족했다면 ajax 회원정보수정 실행
												if (checkform()) {
													$.ajax({
																url : "/mypage/userUpdateProc",
																type : "put",
																contentType : "application/json; charset=utf-8",
																data : JSON.stringify({
																			"userNo" : userNo,
																			"userId" : userId,
																			"userPassword" : userPassword,
																			"userName" : userName,
																			"userEmail" : userEmail,
																			"userChannelName" : userChannelName,
																			"userChannelLink" : userChannelLink,
																			"userChannelCategory" : userChannelCategory,
																			"userChannelImg" : userChannelImg,
																			"userSubscriber" : userSubscriber,
																			"userRolemodelLink" : userRolemodelLink
																		}),
																dataType : "json",
																success : function(result) {
																	if(result.status ==500 ){
																		alert("회원정보수정에 실패하셨습니다.");					
																	}else{
																		alert("회원정보수정이 완료되었습니다.");					
																		location.href = "/mypage";					
																	}
																},
																error: function(request,status,error){
													            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
																}

															})

												}
											})
							//	회원가입 이벤트 종료


								// 회원탈퇴
								$(document).on("click","#deleteBtn",function() {

									alert("정말로 탈퇴를 진행하시겠습니까?");		
									$.ajax({
										url : "/mypage/deleteUser",
										type : "delete",
										success : function(result) {
											if(result.status ==500 ){
												alert("회원탈퇴에 실패하셨습니다.");					
											}else{
												alert("회원탈퇴가 완료되었습니다.");					
												location.href = "/logout";					
											}
										},
										error: function(request,status,error){
							            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
										}

									})
						
								})
											

						})
	</script>


</body>
</html>