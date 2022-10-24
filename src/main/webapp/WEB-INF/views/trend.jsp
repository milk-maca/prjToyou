<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  <div class="block-31" style="position: relative;">
    <div class="owl-carousel loop-block-31 ">
      <div class="block-30 block-30-sm item" style="background-image: url('/image/banner_trend.jpg');" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-7">
              <h2 class="heading mb-5">Trend</h2>
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
  
  
	<div class="site-section border-top ssbt_text01">
		<div class="container">
			<div class="row mb-3 justify-content-center">
				<div class="col-md-8 text-center cate_rec_title">
				<!--     <h4>- You To You -</h4> -->
					<h2 class="title_m">신규가입 유튜버</h2>
					<!--      <p class="lead">오늘 가입한 유튜버 채널</p>
          <p class="mb-5"><a href="#" class="link-underline">View All Donations</a></p> -->
          </div>    
 <div class="container">
      <div class="row">
      <c:forEach var="list" items="${NewUserList}" begin="0" end="3" step="1" varStatus="status">
        <div class="col-md-6 col-lg-3 mb-5">
          <div class="person-donate text-center">
          	<a href="/auth/channelSearch?keyword=${ list.userChannelName}">
            	<img src=${list.userChannelImg } alt="Image placeholder" class="img-fluid">
            </a>
            <div class="donate-info">
              <h2>${list.userChannelName}</h2>
              <span class="time d-block mb-3">${list.userSubscriber}</span>
              <a href="${list.userChannelLink}" target='_blank' class="link-underline fundraise-item"> 채널바로가기</a>
            </div>
            
          </div>    
        </div>
        </c:forEach>
       			</div>
		</div>
		</div>
		</div>
		</div>
		
		
	<div class="site-section border-top fund-raisers">
		<div class="container">
			<div class="row mb-3 justify-content-center">
				<div class="col-md-8 text-center cate_rec_title">
					<h2 class="title_m">카테고리별 추천채널</h2>
					<!--      <p class="lead">오늘 가입한 유튜버 채널</p>
          <p class="mb-5"><a href="#" class="link-underline">View All Donations</a></p> -->
				</div>
			</div>
		</div>
<%-- <c:set var="number" value ="${randomIndexArray}" /> --%>
<div class="container cate_rank">
		<div class="container">
			<div class="row">
				<c:if test="${null ne AsmrList}">
				<div class="col-sm-6">
					<div class="table title"><h3 class="mid-title-thin">ASMR</h3></div>				
					<table class="table table-sm col-md-3 text-center">
						<thead class="thead-dark">
							<tr>
								<th scope="col">순위</th>
								<th scope="col">채널명</th>
								<th scope="col">구독자수</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${AsmrList}" var="list">
							<tr>
								<th scope="row">${list.categoryAsmrId}</th>
								<td>${list.categoryAsmrName}</td>
								<td>${list.categoryAsmrSubscribe}</td>
							</tr>
							</c:forEach>			
						</tbody>
						
					</table>
				</div>
				</c:if>
				<c:if test="${null ne BeautiList}">
				<div class="col-sm-6">
				<div class="table title"><h3 class="mid-title-thin">뷰티</h3></div>
					<table class="table table-sm col-md-3 text-center">
						<thead class="thead-dark">
							<tr>
								<th scope="col">순위</th>
								<th scope="col">채널명</th>
								<th scope="col">구독자수</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${BeautiList}" var="list">
							<tr>
								<th scope="row">${list.categoryBeautiId}</th>
								<td>${list.categoryBeautiName}</td>
								<td>${list.categoryBeautiSubscribe}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
</c:if>

			<c:if test="${null ne GameList}">
				<div class="col-sm-6"> 
					<div class="table title"><h3 class="mid-title-thin">게임</h3></div>				
					<table class="table table-sm col-md-3 text-center">
						<thead class="thead-dark">
							<tr>
								<th scope="col">순위</th>
								<th scope="col">채널명</th>
								<th scope="col">구독자수</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${GameList}" var="list">
							<tr>
								<th scope="row">${list.categoryGameId}</th>
								<td>${list.categoryGameName}</td>
								<td>${list.categoryGameSubscribe}</td>
							</tr>
							</c:forEach>			
						</tbody>
						
					</table>
				</div>
</c:if>
<c:if test="${null ne MukbangList}">
				<div class="col-sm-6">
				<div class="table title"><h3 class="mid-title-thin">먹방</h3></div>
					<table class="table table-sm col-md-3 text-center">
						<thead class="thead-dark">
							<tr>
								<th scope="col">순위</th>
								<th scope="col">채널명</th>
								<th scope="col">구독자수</th>
							</tr>
						</thead>
						<tbody>
						
						<c:forEach items="${MukbangList}" var="list">
							<tr>
								<th scope="row">${list.categoryMukbangId}</th>
								<td>${list.categoryMukbangName}</td>
								<td>${list.categoryMukbangSubscribe}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
				</c:if>

			<c:if test="${null ne FitnessList}">
				<div class="col-sm-6">
					<div class="table title"><h3 class="mid-title-thin">운동</h3></div>				
					<table class="table table-sm col-md-3 text-center">
						<thead class="thead-dark">
							<tr>
								<th scope="col">순위</th>
								<th scope="col">채널명</th>
								<th scope="col">구독자수</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${FitnessList}" var="list">
							<tr>
								<th scope="row">${list.categoryFitnessId}</th>
								<td>${list.categoryFitnessName}</td>
								<td>${list.categoryFitnessSubscribe}</td>
							</tr>
							</c:forEach>			
						</tbody>
						
					</table>
				</div>
</c:if>
<c:if test="${null ne CarList}">
				<div class="col-sm-6">
				<div class="table title"><h3 class="mid-title-thin">자동차</h3></div>
					<table class="table table-sm col-md-3 text-center">
						<thead class="thead-dark">
							<tr>
								<th scope="col">순위</th>
								<th scope="col">채널명</th>
								<th scope="col">구독자수</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${CarList}" var="list">
							<tr>
								<th scope="row">${list.categoryCarId}</th>
								<td>${list.categoryCarName}</td>
								<td>${list.categoryCarSubscribe}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
				</c:if>


	<div class="site-section border-top ssbt_text02">
		<div class="container">
			<div class="row mb-3 justify-content-center">
				<div class="col-md-8 text-center cate_rec_title">
					<h2 class="title_m" id="title2"> 한 눈에 확인하는 SNS 트렌드</h2>
					<!--      <p class="lead">오늘 가입한 유튜버 채널</p>
          <p class="mb-5"><a href="#" class="link-underline">View All Donations</a></p> -->
				</div>
			</div>
		</div>
   </div>
</div>
</div>
</div>

<div class="container cate_rank">

		<div class="container">
			<div class="row">
			
			<div class="col-sm-5 text-center">
				
				<div class="table title"><h4 class="mid-title-thin"><b>틱톡 인기 해시태그</b></h4></div>
					<table class="table table-sm col-md-3">
						<thead class="thead-light">
							<tr>
							
								<th style="text-overflow:ellipsis; overflow:visible; white-space:pre;" scope="col">순위</th>
								<th scope="col">해시 태그</th>
								<th scope="col">조회 수</th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${tiktokList}" var="list">
							   
							   <tr>
								<th scope="row">${list.keywordTiktokNo }</th>
								

								<td style="text-overflow:ellipsis; overflow:visible; white-space:pre;"><a href="${list.keywordTiktokLink}">${list.keywordTiktokName }</a></td>
								<td style="text-overflow:ellipsis; overflow:visible; white-space:pre;">${list.keywordTiktokView }</td>
								</tr>
							 </c:forEach>
							

						</tbody>
					</table>
					
				</div>
			
			
				<div class="col-sm-2 text-center">
													
				</div>


				
				
				

				<div class="col-sm-5 text-center">
				
				<div class="table title"><h4 class="mid-title-thin"><b>트위치 인기 스트리머</b></h4></div>
					<table class="table table-sm col-md-3">
						<thead class="thead-light">
							<tr>
							
								<th style="text-overflow:ellipsis; overflow:visible; white-space:pre;" scope="col">순위</th>
								<th style="text-overflow:ellipsis; overflow:visible; white-space:pre;" scope="col">프로필</th>
								<th scope="col">스트리머</th>
								<th scope="col">카테고리</th>
								
								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${twitchList}" var="list">
							   
							   <tr>
							   
								<th scope="row">${list.keywordTwitchNo }</th>
								<td style="text-overflow:ellipsis; overflow:visible; white-space:pre;"><a href="${list.keywordTwitchLink}"><img style="width:30px;height:30px;" src="${list.keywordTwitchImage}" alt="profile" class="img-responsive img-circle"></a></td>
								<td style="text-overflow:ellipsis; overflow:visible; white-space:pre;"><a href="${list.keywordTwitchLink}">${list.keywordTwitchName }</a></td>
								<td style="text-overflow:ellipsis; overflow:visible; white-space:pre;">${list.keywordTwitchCategory }</td>
								</tr>
							 </c:forEach>
							

						</tbody>
					</table>
					
				</div>
				
				<br>
				<br>
				<br>
				
				<div class="col-sm-4 text-center">
				
				<div class="table title"><h4 class="mid-title-thin"><b>트위터 종합 인기 검색어</b></h4></div>
					<table class="table table-sm col-md-3">
						<thead class="thead-light">
							<tr>
							

								<th style="text-overflow:ellipsis; overflow:visible; white-space:pre;" scope="col">순위</th>
								<th scope="col">검색어</th>
								
								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${twitterTotalList}" var="list">
							   
							   <tr>
								<th scope="row">${list.keywordTwitterNo }</th>
								<td style="text-overflow:ellipsis; overflow:visible; white-space:pre;"><a href="${list.keywordTwitterLink}">${list.keywordTwitterName }</a></td>
								
								</tr>
							 </c:forEach>
							

						</tbody>
					</table>
					
				</div>
				
				<div class="col-sm-4 text-center">
				
				<div class="table title"><h4 class="mid-title-thin"><b>트위터 최신 인기 검색어</b></h4></div>
					<table class="table table-sm col-md-3">
						<thead class="thead-light">
							<tr>
							

								<th style="text-overflow:ellipsis; overflow:visible; white-space:pre;" scope="col">순위</th>
								<th scope="col">검색어</th>
								
								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${twitterFamousList}" var="list">
							   
							   <tr>
								<th scope="row">${list.keywordTwitterNo -10}</th>
								<td style="text-overflow:ellipsis; overflow:visible; white-space:pre;"><a href="${list.keywordTwitterLink}">${list.keywordTwitterName }</a></td>
								
								</tr>
							 </c:forEach>
							

						</tbody>
					</table>
					
				</div>
				
				<div class="col-sm-4 text-center">
				
				<div class="table title"><h4 class="mid-title-thin"><b>트위터 꾸준한 인기 검색어</b></h4></div>
					<table class="table table-sm col-md-3">
						<thead class="thead-light">
							<tr>
							

								<th style="text-overflow:ellipsis; overflow:visible; white-space:pre;" scope="col">순위</th>
								<th scope="col">검색어</th>
								
								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${twitterDurationList}" var="list">
							   
							   <tr>
								<th scope="row">${list.keywordTwitterNo -20}</th>
								<td style="text-overflow:ellipsis; overflow:visible; white-space:pre;"><a href="${list.keywordTwitterLink}">${list.keywordTwitterName }</a></td>
								
								</tr>
							 </c:forEach>
							

						</tbody>
					</table>
					
				</div>
				
				
				
			</div>
		</div>
</div>



  <div class="site-section border-top ssbt_text02">
    <div class="container">
      <div class="row">

<!-- 
    <div class="container">
      <div class="row mb-3 justify-content-center">
        <div class="col-md-8 text-center">
          <h2>왜 You To You를 선택해야할까요?</h2>
          <p class="lead"> 많은 유튜버들이 선택한 매니지먼트 블라블라</p> 
          <p><a href="#" class="link-underline">View All Fundraisers</a></p>
        </div>
      </div>
    </div>
     -->
    
    
    
    <div class="container">
      <div class="row mb-3 justify-content-center new_ch">
        <div class="col-md-8 text-center new_ch">
          <h4 class="mid-title-thin2">- For You -</h4>
          <h2 class="title_m">맞춤 추천 채널</h2>
<!--      <p class="lead">오늘 가입한 유튜버 채널</p>
          <p class="mb-5"><a href="#" class="link-underline">View All Donations</a></p> -->
        </div>
      </div>

      <div class="row">
      <c:choose>
     <c:when test="${not empty CategoryList2}">
    <c:forEach var="list" items="${CategoryList2}" begin="0" end="2" step="1" varStatus="status"> 
        <div class="col-12 col-md-6 col-lg-4 mb-4 mb-lg-0">
          <div class="post-entry">
            <a href="${list.categoryUserlink }" target='_blank' class="mb-3 img-wrap">
              <img src="${list.categoryUserImage }" alt="Image placeholder" class="img-fluid">
            </a>
            <h3><a href="#">${list.categoryUserName }</a></h3>
            <span class="date mb-4 d-block text-muted">${list.categoryUserSubscribe }</span>
<!--             <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>-->            <p><a href="${list.categoryUserlink }" target='_blank' class="link-underline">채널 바로가기</a></p>
          </div>         
        </div>
         </c:forEach> 
        </c:when>
       <c:when test="${empty CategoryList2}">
       <c:choose>
       	<c:when test="${empty principal}">
       	 <h3>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;로그인이 필요한 기능입니다.</h3>
       	</c:when>
       	<c:otherwise>
		<h3>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;카테고리를 등록해주세요</h3>
		
		</c:otherwise>
       
       </c:choose>
      
       </c:when>
		
</c:choose>
      </div>

      </div>
    </div>
  </div>
 

      </div>
 
  </div> <!-- .site-section -->


<!-- Footer -->
<%@ include file="layout/Menu.jsp"%>
<%@ include file="layout/footer.jsp"%>
<%-- 
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true"></jsp:include>
 --%><!-- Footer -->

  </body>
</html>