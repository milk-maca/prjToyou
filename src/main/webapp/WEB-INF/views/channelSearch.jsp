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
<link rel="stylesheet"
	href="/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/css/animate.css">
<link rel="stylesheet"
	href="/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/css/magnific-popup.css">
<link rel="stylesheet" href="/css/aos.css">
<link rel="stylesheet" href="/css/ionicons.min.css">
<link rel="stylesheet"
	href="/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="/css/jquery.timepicker.css">
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
			<div class="block-30 block-30-sm item"
				style="background-image: url('${banner}');"
				data-stellar-background-ratio="0.5">
				<div class="container">
					<div
						class="row align-items-center justify-content-center text-center">
						<div class="col-md-7">
							<h2 class="heading mb-5">${title }</h2>
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




	<div class="row mypro">
		<div class="col-md-6 col-lg-3 mb-5">
			<div class="person-donate text-center">
				<img src="${profile}"
					alt="Image placeholder" class="img-fluid">
				<div class="donate-info">
					<h2>${title }</h2>
					<span class="time d-block mb-3">${sub }</span>
					<p>
						우리 채널 탄신일 :  <span class="text-success">${birth }</span> <br> <em>-</em>
						<a href="#" class="link-underline fundraise-item">
							${explain }</a>
					</p>
				</div>
			</div>
		</div>
	</div>






	<!--         <div class="col-md-6 pl-md-5">

          <div class="form-volunteer">
            
            <h2>Be A Volunteer Today</h2>
            <form action="#" method="post">
              <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control py-2" id="name" placeholder="Enter your name">
              </div>
              <div class="form-group">
                <label for="email">Email</label>
                <input type="text" class="form-control py-2" id="email" placeholder="Enter your email">
              </div>
              <div class="form-group">
                <label for="v_message">Email</label>
                <textarea name="v_message" id="" cols="30" rows="3" class="form-control py-2" placeholder="Write your message"></textarea>
                <input type="text" class="form-control py-2" id="email">
              </div>
              <div class="form-group">
                <input type="submit" class="btn btn-white px-5 py-2" value="Send">
              </div>
            </form>
          </div>
        </div> -->

	<!--       </div>
    </div>

  </div> -->
	<!-- .featured-donate -->




<!-- Footer -->
<%@ include file="layout/Menu.jsp"%>
<%@ include file="layout/footer.jsp"%>
<%-- 
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true"></jsp:include>
 --%><!-- Footer -->

</body>
</html>